package service

import (
	"errors"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/model"
	"go-foodie-shop/util"
	"go.uber.org/zap"
	"time"
)

type OrderStatus int

const (
	WaitPay OrderStatus = 10 + 10*iota
	WaitDeliver
	WaitReceiver
	Success
	Close
)

type IsComment int

const (
	NoValue IsComment = -1 + iota
	No
	Yes
)

type QueryTrendRequest struct {
	UserId string `form:"userId" json:"userId" binding:"required,max=30"`
	model.Page
}

type QueryMyOrderRequest struct {
	QueryTrendRequest
	OrderStatus OrderStatus `form:"orderStatus" json:"orderStatus" binding:"oneof=0 10 20 30 40 50"`
}

type QueryStatusCountsRequest struct {
	UserId string `form:"userId" json:"userId" binding:"required,max=30"`
}

type DeliverRequest struct {
	OrderId string `form:"orderId" json:"orderId" binding:"required,max=30"`
}

type ConfirmReceiverRequest struct {
	UserId  string `form:"userId" json:"userId" binding:"required,max=30"`
	OrderId string `form:"orderId" json:"orderId" binding:"required,max=30"`
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

func (r *QueryTrendRequest) QueryMyOrderTrend() ([]model.OrderStatus, int64, error) {
	var orderStatus []model.OrderStatus
	db := model.DB.
		Table("orders o").
		Select("os.order_id as order_id,\n"+
			"os.order_status as order_status,\n"+
			"os.created_time as created_time,\n"+
			"os.pay_time as pay_time,\n"+
			"os.deliver_time as deliver_time,\n"+
			"os.success_time as success_time,\n"+
			"os.close_time as close_time,\n"+
			"os.comment_time as comment_time").
		Joins("LEFT JOIN order_status os on o.id = os.order_id").
		Where("o.is_delete = 0 \n"+
			"AND o.user_id = ? \n"+
			"AND os.order_status in (20, 30, 40)", r.UserId).
		Order("os.order_id DESC")

	var count int64
	if err := db.Count(&count).Error; err != nil {
		return nil, 0, err
	}

	err := db.Scopes(util.Paginate(r.Page.Page, r.PageSize)).
		Find(&orderStatus).
		Error
	return orderStatus, count, err
}

func (r *QueryStatusCountsRequest) QueryOrderStatus() (model.OrderStatusCountsVO, error) {
	var orderStatus model.OrderStatusCountsVO
	waitPayCount, err := queryOrderStatusCount(r.UserId, int(WaitPay), NoValue)
	if err != nil {
		return orderStatus, err
	}

	waitDeliverCount, err := queryOrderStatusCount(r.UserId, int(WaitDeliver), NoValue)
	if err != nil {
		return orderStatus, err
	}

	waitReceiverCount, err := queryOrderStatusCount(r.UserId, int(WaitReceiver), NoValue)
	if err != nil {
		return orderStatus, err
	}

	waitCommentCount, err := queryOrderStatusCount(r.UserId, int(Success), No)
	if err != nil {
		return orderStatus, err
	}

	orderStatus.WaitPayCounts = waitPayCount
	orderStatus.WaitDeliverCounts = waitDeliverCount
	orderStatus.WaitReceiveCounts = waitReceiverCount
	orderStatus.WaitCommentCounts = waitCommentCount

	return orderStatus, err
}

func queryOrderStatusCount(userId string, orderStatus int, isComment IsComment) (int64, error) {
	var count int64
	db := model.DB.
		Table("orders o").
		Joins("LEFT JOIN order_status os on o.id = os.order_id").
		Where("o.is_delete = 0 \n"+
			"AND o.user_id = ? \n"+
			"AND os.order_status = ?", userId, orderStatus)
	if isComment != NoValue && (isComment == No || isComment == Yes) {
		db.Where("o.is_comment = ?", isComment)
	}

	if err := db.Count(&count).Error; err != nil {
		log.ServiceLog.Error(
			"查询用户订单状态统计失败",
			zap.String("userId", userId),
			zap.Int("orderStatus", orderStatus),
			zap.Error(err),
		)
		return 0, errors.New("查询用户订单状态统计失败")
	}

	log.ServiceLog.Info(
		"查询用户订单状态统计成功",
		zap.String("userId", userId),
		zap.Int("orderStatus", orderStatus),
	)
	return count, nil
}

func (r *DeliverRequest) UpdateDeliverOrderStatus() error {
	now := model.LocalTime(time.Now())

	orderStatus := model.OrderStatus{
		OrderStatus: int(WaitReceiver),
		DeliverTime: &now,
	}
	err := model.DB.
		Model(&model.OrderStatus{}).
		Where(&model.OrderStatus{OrderId: r.OrderId, OrderStatus: int(WaitDeliver)}).
		Update(&orderStatus).
		Error

	if err != nil {
		log.ServiceLog.Error(
			"发货异常",
			zap.String("orderId", r.OrderId),
			zap.Error(err),
		)
		return errors.New("发货异常")
	}

	log.ServiceLog.Info(
		"发货成功",
		zap.String("orderId", r.OrderId),
	)
	return nil
}

func (r *ConfirmReceiverRequest) ConfirmReceiver() error {
	// 确认 orderId 与 userId 是否正确
	order := model.Orders{
		Id:       r.OrderId,
		UserId:   r.UserId,
		IsDelete: 0,
	}
	err := model.DB.First(&order).Error
	if err != nil {
		log.ServiceLog.Error(
			"查询订单失败",
			zap.String("orderId", r.OrderId),
			zap.String("userId", r.UserId),
			zap.Error(err),
		)
		return errors.New("查询订单失败")
	}

	now := model.LocalTime(time.Now())

	orderStatus := model.OrderStatus{
		OrderStatus: int(Success),
		SuccessTime: &now,
	}
	err = model.DB.
		Model(&model.OrderStatus{}).
		Where(&model.OrderStatus{OrderId: r.OrderId, OrderStatus: int(WaitReceiver)}).
		Update(&orderStatus).
		Error

	if err != nil {
		log.ServiceLog.Error(
			"确认收货失败",
			zap.String("orderId", r.OrderId),
			zap.String("userId", r.UserId),
			zap.Error(err),
		)
		return errors.New("确认收货失败")
	}
	log.ServiceLog.Error(
		"确认收货成功",
		zap.String("orderId", r.OrderId),
		zap.String("userId", r.UserId),
		zap.Error(err),
	)
	return nil
}
