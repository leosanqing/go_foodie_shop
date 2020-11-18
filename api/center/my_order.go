package center

import (
	"github.com/gin-gonic/gin"
	"go-foodie-shop/api"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
	"go-foodie-shop/util"
)

// QueryMyOrders 查询我的订单
func QueryMyOrders(c *gin.Context) {
	var queryMyOrderRequest = service.QueryMyOrderRequest{}
	if err := c.ShouldBind(&queryMyOrderRequest); err == nil {
		myOrders, count, err := queryMyOrderRequest.QueryMyOrders()
		result := util.PagedGridResult(myOrders, count, queryMyOrderRequest.Page.Page, queryMyOrderRequest.PageSize)

		if err != nil {
			c.JSON(200, api.ErrorResponse(err))
			return
		}

		c.JSON(200, serializer.Response{
			Status: 200,
			Data:   result,
		})
	} else {
		c.JSON(400, api.ErrorResponse(err))
	}
}
