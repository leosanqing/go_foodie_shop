package api

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
)

func QueryAllAddress(c *gin.Context) {
	var indexService = service.QueryAllAddressRequest{}
	if err := c.ShouldBindQuery(&indexService); err == nil {
		header := c.GetHeader("headerUserId")
		fmt.Println(header)
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
