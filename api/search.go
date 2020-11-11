package api

import (
	"errors"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
	"go-foodie-shop/util"
	"go.uber.org/zap"
)

// ItemInfo 商品详情
func SearchItem(c *gin.Context) {
	var searchItemService service.SearchItemService
	if err := c.ShouldBind(&searchItemService); err == nil {
		items, count, err := searchItemService.SearchItems()
		if err != nil {
			log.ServiceLog.Error(
				"search item by id err ",
				zap.Any("searchItemService", searchItemService),
				zap.Error(err),
			)
			c.JSON(200, ErrorResponse(errors.New("查询商品失败")))
			return
		}

		result := util.PagedGridResult(items, count, searchItemService.Page, searchItemService.PageSize)

		c.JSON(200, serializer.Response{
			Status: 200,
			Data:   result,
			Msg:    "success",
		})
	} else {
		c.JSON(200, ErrorResponse(err))
	}
}
