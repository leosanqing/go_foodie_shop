package api

import (
	"github.com/gin-gonic/gin"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
	"net/http"
)

// QueryAllAddress 查询全部地址信息
func QueryAllAddress(c *gin.Context) {
	var indexService = service.QueryAllAddressRequest{}
	if err := c.ShouldBindQuery(&indexService); err == nil {
		address, err := indexService.QueryAllAddress()
		if err != nil {
			c.JSON(http.StatusOK, ErrorResponse(err))
			return
		}
		c.JSON(http.StatusOK, SuccessResponse(address))
	} else {
		c.JSON(http.StatusBadRequest, ErrorResponse(err))
	}
}

func AddAddress(c *gin.Context) {
	var addAddressRequest = service.AddAddressRequest{}
	if err := c.ShouldBindJSON(&addAddressRequest); err == nil {
		err := addAddressRequest.AddNewUserAddress()
		if err != nil {
			c.JSON(http.StatusOK, ErrorResponse(err))
			return
		}
		c.JSON(http.StatusOK, serializer.Response{Status: Success})
	} else {
		c.JSON(http.StatusBadRequest, ErrorResponse(err))
	}
}
