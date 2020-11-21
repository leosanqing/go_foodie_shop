package center

import (
	"errors"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/api"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
	"go-foodie-shop/util"
	"go.uber.org/zap"
)

// Pending 查询我的订单动态
func Pending(c *gin.Context) {
	var orderRequest = service.QueryOrderRequest{}
	if err := c.ShouldBindQuery(&orderRequest); err == nil {
		orderItems, err := orderRequest.QueryMyOrder()
		if err != nil {
			log.ServiceLog.Error(
				"查询订单失败",
				zap.String("userId", orderRequest.UserId),
				zap.Error(err),
			)
			c.JSON(200, api.ErrorResponse(errors.New("查询订单失败")))
			return
		}

		log.ServiceLog.Info("查询订单成功", zap.Any("orderItems", orderItems))
		c.JSON(200, serializer.Response{
			Status: 200,
			Data:   orderItems,
		})
	} else {
		c.JSON(400, api.ErrorResponse(err))
	}
}

// QueryMyComment 查询我的评价
func QueryMyComment(c *gin.Context) {
	var queryMyCommentRequest = service.QueryMyCommentRequest{}
	if err := c.ShouldBind(&queryMyCommentRequest); err == nil {
		commentVOS, total, err := queryMyCommentRequest.QueryMyComment()
		if err != nil {
			log.ServiceLog.Error(
				"查询订单失败",
				zap.String("userId", queryMyCommentRequest.UserId),
				zap.Error(err),
			)
			c.JSON(200, api.ErrorResponse(errors.New("查询订单失败")))
			return
		}

		log.ServiceLog.Info("查询订单成功", zap.Any("commentVOS", commentVOS))
		result := util.PagedGridResult(commentVOS, total, queryMyCommentRequest.Page.Page, queryMyCommentRequest.PageSize)

		c.JSON(200, serializer.Response{
			Status: 200,
			Data:   result,
		})
	} else {
		c.JSON(400, api.ErrorResponse(err))
	}
}

// SaveCommentList 保存我的评价
func SaveCommentList(c *gin.Context) {
	var itemsComments []model.OrderItemsComment
	if err := c.ShouldBindJSON(&itemsComments); err == nil {
		orderId := c.Query("orderId")
		if "" == orderId {
			c.JSON(400, api.ErrorResponse(errors.New("orderId 为空")))
			return
		}
		userId := c.Query("userId")
		if "" == orderId {
			c.JSON(400, api.ErrorResponse(errors.New("userId 为空")))
			return
		}

		err := service.SaveMyComment(userId, orderId, itemsComments)
		if err != nil {
			c.JSON(200, api.ErrorResponse(err))
			return
		}

		c.JSON(200, serializer.Response{
			Status: 200,
		})
	} else {
		c.JSON(400, api.ErrorResponse(err))
	}
}
