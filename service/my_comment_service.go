package service

import (
	"errors"
	"github.com/jinzhu/gorm"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/model"
	"go-foodie-shop/util"
	"go.uber.org/zap"
	"time"
)

type QueryOrderRequest struct {
	UserId  string `form:"userId" json:"userId" binding:"required,max=30"`
	OrderId string `form:"orderId" json:"orderId" binding:"required,max=30"`
}

type QueryMyCommentRequest struct {
	UserId string `form:"userId" json:"userId" binding:"required,max=30"`
	model.Page
}

type SaveCommentRequest []model.OrderItemsComment

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
		Order("ic.created_time DESC")

	var count int64
	if err := db.Count(&count).Error; err != nil {
		return nil, 0, err
	}

	err := db.Scopes(util.Paginate(r.Page.Page, r.PageSize)).
		Find(&myCommentVOS).
		Error
	return myCommentVOS, count, err
}

// 保存我的评论信息
func SaveMyComment(userId, orderId string, orderItemsComments []model.OrderItemsComment) error {
	// 使用事务控制逻辑
	return model.DB.Transaction(func(tx *gorm.DB) error {

		// 1.保存订单评价 item_comments
		var comments []model.ItemsComments
		var comment model.ItemsComments

		for _, value := range orderItemsComments {
			id, _ := util.NextId()
			comment.Id = id.String()
			comment.UserId = userId
			comment.ItemId = value.ItemId
			comment.ItemName = value.ItemName
			comment.ItemSpecId = value.ItemSpecId
			comment.SpecName = value.ItemSpecName
			comment.CommentLevel = int(value.CommentLevel)
			comment.Content = value.Content
			comment.CreatedTime = time.Now()
			comment.UpdatedTime = time.Now()
			comments = append(comments, comment)
		}
		for _, itemsComments := range comments {
			// TODO 改为批量新增，现在批量新增出错，未找到解决方法
			err := tx.Create(&itemsComments).Error
			if err != nil {
				log.ServiceLog.Error(
					"创建评论失败",
					zap.Any("commentList", orderItemsComments),
					zap.Error(err),
				)
				return errors.New("创建评论失败")
			}
		}
		//err := tx.Create(&comments).Error

		//if err != nil {
		//	log.ServiceLog.Error(
		//		"创建评论失败",
		//		zap.Any("commentList", orderItemsComments),
		//		zap.Error(err),
		//	)
		//	return errors.New("创建评论失败")
		//}

		// 2.修改订单 Orders
		order := model.Orders{IsComment: 1}
		if err := tx.Model(model.Orders{}).Where(model.Orders{Id: orderId}).Update(&order).Error; err != nil {
			log.ServiceLog.Error(
				"修改订单失败",
				zap.Any("orderId", orderId),
				zap.Error(err),
			)
			return errors.New("修改订单失败")
		}

		localTime := model.LocalTime(time.Now())
		// 3. 修改订单状态的  commentTime
		orderStatus := model.OrderStatus{OrderId: orderId, CommentTime: &localTime}
		if err := tx.Model(&model.OrderStatus{}).Update(&orderStatus).Error; err != nil {
			log.ServiceLog.Error(
				"修改订单状态失败",
				zap.Any("orderId", orderId),
				zap.Error(err),
			)
			return errors.New("修改订单状态失败")
		}
		log.ServiceLog.Info("保存订单成功", zap.Any("commentData", orderItemsComments))
		return nil
	})

}
