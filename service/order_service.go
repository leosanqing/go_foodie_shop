package service

import (
	"errors"
	"github.com/gogf/gf/util/gconv"
	"github.com/jinzhu/gorm"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/model"
	"go-foodie-shop/util"
	"go.uber.org/zap"
	"strings"
	"time"
)

type PayMethod int

const (
	WxPay PayMethod = 1 + iota
	AliPay
)

type CreateOrderRequest struct {
	UserId      string    `json:"userId"`
	ItemSpecIds string    `json:"itemSpecIds"`
	AddressId   string    `json:"addressId"`
	PayMethod   PayMethod `json:"payMethod"`
	LeftMsg     string    `json:"leftMsg"`
}

type QueryPaidOrderInfoRequest struct {
	OrderId string `form:"orderId" json:"orderId" binding:"required,max=30"`
}

type OrderVO struct {
	OrderId         string       `json:"orderId"`
	ToBeRemovedList []ShopCartBO `json:"toBeRemovedList"`
}

func (r *CreateOrderRequest) CreateOrder(shopCartBOS []ShopCartBO) (OrderVO, error) {
	var orderVO OrderVO

	// 使用事务管理操作
	err := model.DB.Transaction(func(tx *gorm.DB) error {
		// 1.生成 新订单 ，填写 Orders表
		orderId, _ := util.NextId()
		userAddress, err2 := queryAddressByUserAndAddrId(r.UserId, r.AddressId)
		if err2 != nil {
			return err2
		}
		now := model.LocalTime(time.Now())
		order := model.Orders{
			Id:        gconv.String(orderId),
			UserId:    r.UserId,
			LeftMsg:   r.LeftMsg,
			PayMethod: int(r.PayMethod),
			ReceiverAddress: userAddress.Province +
				" " + userAddress.City +
				" " + userAddress.District +
				" " + userAddress.Detail,
			ReceiverMobile: userAddress.Mobile,
			ReceiverName:   userAddress.Receiver,
			PostAmount:     0,
			IsDelete:       0,
			IsComment:      0,
			CreatedTime:    &now,
			UpdatedTime:    &now,
			// 分库分表：orderItems 作为orders的子表，所有插入时，要先插入Orders，
			// 这样在插入OrderItems时，才能找到对应的分片。所以这里先插入Orders,
			// 计算金额后，再更新一下Orders.
			TotalAmount:   0,
			RealPayAmount: 0,
		}

		err := model.DB.Create(&order).Error
		if err != nil {
			log.ServiceLog.Error(
				"创建订单异常",
				zap.Any("orderInfo", order),
				zap.Error(err),
			)
			return errors.New("创建订单异常")
		}

		// 2.1 循环遍历，根据商品规格表，保存到商品规格表
		totalAmount := 0
		realPayTotalAmount := 0
		itemSpecIds := strings.Split(r.ItemSpecIds, ",")

		for _, specId := range itemSpecIds {
			itemsSpec := model.ItemsSpec{
				Id: specId,
			}
			err2 := model.DB.First(&itemsSpec).Error
			if err2 != nil {
				log.ServiceLog.Error(
					"查询商品规格失败",
					zap.Any("specId", specId),
					zap.Error(err),
				)
				return errors.New("查询商品规格失败")
			}

			counts := 0
			for _, bo := range shopCartBOS {
				if bo.SpecId == specId {
					orderVO.ToBeRemovedList = append(orderVO.ToBeRemovedList, bo)
					counts = bo.BuyCounts
				}
			}

			// 获取价格
			totalAmount += itemsSpec.PriceNormal * counts
			realPayTotalAmount += itemsSpec.PriceDiscount * counts

			// 2.2 根据商品Id，获得商品图片和信息
			itemId := itemsSpec.ItemId
			items := model.ItemsImg{ItemId: itemId, IsMain: 1}
			if err := model.DB.
				Select("url").
				First(&items).
				Error; err != nil {
				log.ServiceLog.Error(
					"查询商品图片失败",
					zap.Any("itemId", itemId),
					zap.Error(err),
				)
				return errors.New("查询商品图片失败")
			}
			itemImg := items.Url

			id, _ := util.NextId()

			// 2.3 将商品规格信息写入 订单商品表
			orderItem := model.OrderItems{
				Id:         gconv.String(id),
				BuyCounts:  counts,
				ItemId:     itemId,
				ItemImg:    itemImg,
				ItemName:   itemsSpec.Name,
				ItemSpecId: specId,
				OrderId:    gconv.String(orderId),
			}

			if err := model.DB.Create(&orderItem).Error; err != nil {
				log.ServiceLog.Error(
					"创建商品订单表失败",
					zap.Any("orderItem", orderItem),
					zap.Error(err),
				)
				return errors.New("创建商品订单表失败")
			}

			// 2.4 减库存
			if err := model.DB.Model(&model.ItemsSpec{}).
				Exec("update\n"+
					"	items_spec\n"+
					"set\n"+
					"	stock = stock - ?\n"+
					"WHERE\n"+
					"	id = ?\n"+
					"AND\n"+
					"	stock >= ?", counts, specId, counts).
				Error; err != nil {
				log.ServiceLog.Error(
					"删减库存失败",
					zap.Any("specId", specId),
					zap.Int("counts", counts),
					zap.Error(err),
				)
				return errors.New("删减库存失败")
			}
		}

		if err := model.DB.Model(&model.Orders{}).
			Update(&model.Orders{
				TotalAmount:   totalAmount,
				RealPayAmount: realPayTotalAmount,
				Id:            order.Id,
			}).Error; err != nil {
			log.ServiceLog.Error(
				"更新订单信息失败",
				zap.String("orderId", order.Id),
				zap.Int("totalAmount", totalAmount),
				zap.Int("realPayTotalAmount", realPayTotalAmount),
				zap.Error(err),
			)
			return errors.New("更新订单信息失败")
		}

		now = model.LocalTime(time.Now())
		// 3. 订单状态表
		orderStatus := model.OrderStatus{
			OrderId: order.Id,
			// 未接入支付功能，直接改成已付款
			OrderStatus: int(WaitDeliver),
			CreatedTime: &now,
			PayTime:     &now,
		}

		if err := model.DB.Create(&orderStatus).Error; err != nil {
			log.ServiceLog.Error(
				"插入订单状态表失败",
				zap.Any("orderStatus", orderStatus),
				zap.Error(err),
			)
			return errors.New("插入订单状态表失败")
		}

		orderVO.OrderId = order.Id
		return nil
	})

	return orderVO, err
}

func queryAddressByUserAndAddrId(userId, addressId string) (model.UserAddress, error) {
	address := model.UserAddress{
		UserId: userId,
		Id:     addressId,
	}
	err := model.DB.First(&address).Error
	if err != nil {
		log.ServiceLog.Error(
			"根据用户Id 及 addressId 查询地址信息",
			zap.String("userId", userId),
			zap.String("addressId", addressId),
			zap.Error(err),
		)
		return address, errors.New("获取地址信息失败")
	}
	return address, nil
}

func (r *QueryPaidOrderInfoRequest) QueryPaidOrderInfo() (model.OrderStatus, error) {
	orderStatus := model.OrderStatus{
		OrderId: r.OrderId,
	}

	if err := model.DB.First(&orderStatus).Error; err != nil {
		log.ServiceLog.Error(
			"查询订单信息异常",
			zap.Any("orderStatus", orderStatus),
			zap.Error(err),
		)
		return orderStatus, errors.New("查询订单信息异常")
	}

	log.ServiceLog.Info(
		"查询订单信息异常",
		zap.Any("orderStatus", orderStatus),
	)
	return orderStatus, nil
}
