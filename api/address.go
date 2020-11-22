package api

import (
	"github.com/gin-gonic/gin"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
)

// QueryAllAddress 查询全部地址信息
func QueryAllAddress(c *gin.Context) {
	var indexService = service.QueryAllAddressRequest{}
	if err := c.ShouldBindQuery(&indexService); err == nil {
		address, err := indexService.QueryAllAddress()
		if err != nil {
			c.JSON(200, ErrorResponse(err))
			return
		}
		c.JSON(200, serializer.Response{Status: Success, Data: address})
	} else {
		c.JSON(400, ErrorResponse(err))
	}
}

func AddAddress(c *gin.Context) {
	var addAddressRequest = service.AddAddressRequest{}
	if err := c.ShouldBindJSON(&addAddressRequest); err == nil {
		err := addAddressRequest.AddNewUserAddress()
		if err != nil {
			c.JSON(200, ErrorResponse(err))
			return
		}
		c.JSON(200, serializer.Response{Status: Success})
	} else {
		c.JSON(400, ErrorResponse(err))
	}
}
