package center

import (
	"errors"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/api"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/model"
	"go-foodie-shop/service"
	"go-foodie-shop/util"
	"go.uber.org/zap"
	"net/http"
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
			c.JSON(http.StatusOK, api.ErrorResponse(errors.New("查询订单失败")))
			return
		}

		log.ServiceLog.Info("查询订单成功", zap.Any("orderItems", orderItems))
		c.JSON(http.StatusOK, api.SuccessResponse(orderItems))
	} else {
		c.JSON(http.StatusBadRequest, api.ErrorResponse(err))
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
			c.JSON(http.StatusOK, api.ErrorResponse(errors.New("查询订单失败")))
			return
		}

		log.ServiceLog.Info("查询订单成功", zap.Any("commentVOS", commentVOS))
		result := util.PagedGridResult(commentVOS, total, queryMyCommentRequest.Page.Page, queryMyCommentRequest.PageSize)

		c.JSON(http.StatusOK, api.SuccessResponse(result))
	} else {
		c.JSON(http.StatusBadRequest, api.ErrorResponse(err))
	}
}

// SaveCommentList 保存我的评价
func SaveCommentList(c *gin.Context) {
	var itemsComments []model.OrderItemsComment
	if err := c.ShouldBindJSON(&itemsComments); err == nil {
		orderId, b := c.GetQuery("orderId")
		if !b {
			c.JSON(http.StatusBadRequest, api.ErrorResponse(errors.New("orderId 为空")))
			return
		}
		userId := c.Query("userId")
		if "" == orderId {
			c.JSON(http.StatusBadRequest, api.ErrorResponse(errors.New("userId 为空")))
			return
		}

		err := service.SaveMyComment(userId, orderId, itemsComments)
		if err != nil {
			c.JSON(http.StatusOK, api.ErrorResponse(err))
			return
		}

		c.JSON(http.StatusOK, api.SuccessResponse(nil))
	} else {
		c.JSON(http.StatusBadRequest, api.ErrorResponse(err))
	}
}
