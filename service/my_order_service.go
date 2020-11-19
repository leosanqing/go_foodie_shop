package service

import (
	"errors"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/model"
	"go-foodie-shop/util"
	"go.uber.org/zap"
)

type OrderStatus int

const (
	WaitPay OrderStatus = 10 + 10*iota
	WaitDeliver
	WaitReceiver
	Success
	Close
)

type QueryMyOrderRequest struct {
	UserId      string      `form:"userId" json:"userId" binding:"required,max=30"`
	OrderStatus OrderStatus `form:"orderStatus" json:"orderStatus" binding:"oneof=0 10 20 30 40 50"`
	model.Page
}

func (r *QueryMyOrderRequest) QueryMyOrders() ([]model.MyOrderVO, int64, error) {
	var myOrderVOS []model.MyOrderVO
	db := model.DB.
		Table("orders od").
		Select("od.id as order_id,\n"+
			"od.created_time as created_time,\n"+
			"od.pay_method as pay_method,\n"+
			"od.real_pay_amount as real_pay_amount,\n"+
			"od.post_amount as post_amount,\n"+
			"os.order_status as order_status,\n"+
			"od.is_comment as is_comment").
		Joins("LEFT JOIN order_status os ON od.id = os.order_id").
		Where("od.user_id = ?", r.UserId).
		Where("od.is_delete = 0").
		Order("od.updated_time ASC")

	if r.OrderStatus != 0 {
		db = db.Where("os.order_status = ?", r.OrderStatus)
	}

	var count int64
	if err := db.Count(&count).Error; err != nil {
		log.ServiceLog.Error(
			"查询我的订单失败",
			zap.Any("userId", r.UserId),
			zap.Error(err),
		)
		return nil, 0, errors.New("查询我的订单失败")
	}

	if err := db.Scopes(util.Paginate(r.Page.Page, r.PageSize)).
		Find(&myOrderVOS).
		Error; err != nil {
		log.ServiceLog.Error(
			"查询我的订单失败",
			zap.Any("userId", r.UserId),
			zap.Error(err),
		)
		return nil, 0, errors.New("查询我的订单失败")
	}

	if len(myOrderVOS) == 0 {
		return nil, count, nil
	}
	for i := 0; i < len(myOrderVOS); i++ {
		items := queryOrderItems(myOrderVOS[i].OrderId)
		myOrderVOS[i].SubOrderItemList = items
	}
	return myOrderVOS, count, nil
}

func queryOrderItems(orderId string) []model.MySubOrderItemVO {
	var orderSubItem []model.MySubOrderItemVO
	model.DB.
		Table("order_items").
		Where("order_id = ?", orderId).
		Find(&orderSubItem)
	return orderSubItem
}
