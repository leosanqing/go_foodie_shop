package center

import (
	"github.com/gin-gonic/gin"
	"go-foodie-shop/api"
	"go-foodie-shop/service"
	"go-foodie-shop/util"
	"net/http"
)

// QueryMyOrders 查询我的订单
func QueryMyOrders(c *gin.Context) {
	var queryMyOrderRequest = service.QueryMyOrderRequest{}
	if err := c.ShouldBind(&queryMyOrderRequest); err == nil {
		myOrders, count, err := queryMyOrderRequest.QueryMyOrders()
		result := util.PagedGridResult(myOrders, count, queryMyOrderRequest.Page.Page, queryMyOrderRequest.PageSize)

		if err != nil {
			c.JSON(http.StatusOK, api.ErrorResponse(err))
			return
		}

		c.JSON(http.StatusOK, api.SuccessResponse(result))
	} else {
		c.JSON(http.StatusBadRequest, api.ErrorResponse(err))
	}
}

// QueryTrend 查询用户订单数
func QueryTrend(c *gin.Context) {
	var queryTrendRequest = service.QueryTrendRequest{}
	if err := c.ShouldBind(&queryTrendRequest); err == nil {
		myOrders, count, err := queryTrendRequest.QueryMyOrderTrend()
		result := util.PagedGridResult(myOrders, count, queryTrendRequest.Page.Page, queryTrendRequest.PageSize)

		if err != nil {
			c.JSON(http.StatusOK, api.ErrorResponse(err))
			return
		}

		c.JSON(http.StatusOK, api.SuccessResponse(result))
	} else {
		c.JSON(http.StatusBadRequest, api.ErrorResponse(err))
	}
}

// StatusCounts 查询用户订单  不同状态下的数量
func StatusCounts(c *gin.Context) {
	var queryTrendRequest = service.QueryStatusCountsRequest{}
	if err := c.ShouldBindQuery(&queryTrendRequest); err == nil {
		myOrders, err := queryTrendRequest.QueryOrderStatus()
		if err != nil {
			c.JSON(http.StatusOK, api.ErrorResponse(err))
			return
		}

		c.JSON(http.StatusOK, api.SuccessResponse(myOrders))
	} else {
		c.JSON(http.StatusBadRequest, api.ErrorResponse(err))
	}
}

// deliver 商家发货 没有前端 只能通过接口调用
func Deliver(c *gin.Context) {
	var deliverRequest = service.DeliverRequest{}
	if err := c.ShouldBindQuery(&deliverRequest); err == nil {
		err := deliverRequest.UpdateDeliverOrderStatus()
		if err != nil {
			c.JSON(http.StatusOK, api.ErrorResponse(err))
			return
		}

		c.JSON(http.StatusOK, api.SuccessResponse(nil))
	} else {
		c.JSON(http.StatusBadRequest, api.ErrorResponse(err))
	}
}

// ConfirmReceiver 确认收货
func ConfirmReceiver(c *gin.Context) {
	var receiverRequest = service.ConfirmReceiverRequest{}
	if err := c.ShouldBindQuery(&receiverRequest); err == nil {
		err := receiverRequest.ConfirmReceiver()
		if err != nil {
			c.JSON(http.StatusOK, api.ErrorResponse(err))
			return
		}

		c.JSON(http.StatusOK, api.SuccessResponse(nil))
	} else {
		c.JSON(http.StatusBadRequest, api.ErrorResponse(err))
	}
}

// DeleteOrder 删除订单
func DeleteOrder(c *gin.Context) {
	var receiverRequest = service.ConfirmReceiverRequest{}
	if err := c.ShouldBindQuery(&receiverRequest); err == nil {
		err := receiverRequest.DeleteOrder()
		if err != nil {
			c.JSON(http.StatusOK, api.ErrorResponse(err))
			return
		}

		c.JSON(http.StatusOK, api.SuccessResponse(nil))
	} else {
		c.JSON(http.StatusBadRequest, api.ErrorResponse(err))
	}
}
