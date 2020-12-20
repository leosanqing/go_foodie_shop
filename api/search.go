package api

import (
	"errors"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/service"
	"go-foodie-shop/util"
	"go.uber.org/zap"
	"net/http"
)

// SearchItem 查询商品
func SearchItem(c *gin.Context) {
	var searchItemService service.SearchItemService
	if err := c.ShouldBind(&searchItemService); err == nil {
		if searchItemService.Keywords == "" {
			c.JSON(http.StatusOK, ErrorResponse(errors.New("请输入要查询的关键字")))
			return
		}
		items, count, err := searchItemService.SearchItems()
		if err != nil {
			log.ServiceLog.Error(
				"search item by id err ",
				zap.Any("searchItemService", searchItemService),
				zap.Error(err),
			)
			c.JSON(http.StatusOK, ErrorResponse(errors.New("查询商品失败")))
			return
		}

		result := util.PagedGridResult(items, count, searchItemService.Page.Page, searchItemService.PageSize)

		c.JSON(http.StatusOK, SuccessResponse(result))
	} else {
		c.JSON(http.StatusBadRequest, ErrorResponse(err))
	}
}

func SearchItemByCatId(c *gin.Context) {
	var searchItemService service.SearchItemService
	if err := c.ShouldBind(&searchItemService); err == nil {
		if 0 == searchItemService.CatId {
			c.JSON(http.StatusOK, ErrorResponse(errors.New("请输入分类Id")))
			return
		}
		items, count, err := searchItemService.SearchItemsByCatId()
		if err != nil {
			log.ServiceLog.Error(
				"search item by id err ",
				zap.Any("searchItemService", searchItemService),
				zap.Error(err),
			)
			c.JSON(http.StatusOK, ErrorResponse(errors.New("查询商品失败")))
			return
		}

		result := util.PagedGridResult(items, count, searchItemService.Page.Page, searchItemService.PageSize)

		c.JSON(http.StatusOK, SuccessResponse(result))
	} else {
		c.JSON(http.StatusBadRequest, ErrorResponse(err))
	}
}
