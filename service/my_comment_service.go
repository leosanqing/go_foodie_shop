package service

import (
	"errors"
	"go-foodie-shop/model"
	"go-foodie-shop/util"
)

type QueryOrderRequest struct {
	UserId  string `form:"userId" json:"userId" binding:"required,max=30"`
	OrderId string `form:"orderId" json:"orderId" binding:"required,max=30"`
}

type QueryMyCommentRequest struct {
	UserId string `form:"userId" json:"userId" binding:"required,max=30"`
	model.Page
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

func (r *QueryMyCommentRequest) QueryMyComment() ([]model.MyCommentVO, int64, error) {
	var myCommentVOS []model.MyCommentVO
	db := model.DB.
		Table("items_comments ic").
		Select("ic.id as comment_id,\n"+
			"ic.content as content,\n"+
			"ic.created_time as created_time,\n"+
			"ic.item_id as item_id,\n"+
			"ic.item_name as item_name,\n"+
			"ic.spec_name as spec_name,\n"+
			"ii.url as item_img").
		Joins("LEFT JOIN items_img ii ON ic.item_id = ii.item_id").
		Where("ic.user_id = ?", r.UserId).
		Where("ii.is_main = 1").
		Order("ic.created_time	DESC")

	var count int64
	if err := db.Count(&count).Error; err != nil {
		return nil, 0, err
	}

	err := db.Scopes(util.Paginate(r.Page.Page, r.PageSize)).
		Find(&myCommentVOS).
		Error
	return myCommentVOS, count, err
}
