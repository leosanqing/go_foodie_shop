package service

import (
	"errors"
	"go-foodie-shop/model"
)

type QueryOrderRequest struct {
	UserId  string `form:"userId" json:"userId" binding:"required,max=30"`
	OrderId string `form:"orderId" json:"orderId" binding:"required,max=30"`
}

func (r *QueryOrderRequest) QueryMyOrder() ([]model.OrderItems, error) {
	order := model.Orders{
		Id:       r.OrderId,
		UserId:   r.UserId,
		IsDelete: 0,
	}
	err := model.DB.First(&order).Error

	if err != nil {
		return nil, err
	}

	if order.IsComment == 1 {
		return nil, errors.New("商品已经评价过")
	}

	comment, err := r.QueryPendingComment()
	return comment, err
}

func (r *QueryOrderRequest) QueryPendingComment() ([]model.OrderItems, error) {
	var orderItem []model.OrderItems
	err := model.DB.
		Where("order_id = ?", r.OrderId).
		Find(&orderItem).
		Error
	return orderItem, err
}
