package api

import (
	"github.com/gin-gonic/gin"
	"go-foodie-shop/service"
)

// Carousel 轮播图展示列表
func Carousel(c *gin.Context) {
	var indexService = service.IndexService{}
	if err := c.ShouldBind(&indexService); err == nil {
		c.JSON(200, indexService.QueryCarouselList())
	} else {
		c.JSON(200, ErrorResponse(err))
	}
}

// Cats 查询以及目录下的所有分类
func Cats(c *gin.Context) {
	var indexService = service.IndexService{}
	if err := c.ShouldBind(&indexService); err == nil {
		c.JSON(200, indexService.QueryAllRootLevelCats())
	} else {
		c.JSON(200, ErrorResponse(err))
	}
}

// SubCats 查询子分类(二三级)
func SubCats(c *gin.Context) {
	var indexService = service.QueryItemByIdRequest{}
	if err := c.ShouldBindUri(&indexService); err == nil {
		c.JSON(200, indexService.QuerySubCats())
	} else {
		c.JSON(400, ErrorResponse(err))
	}
}

func GetSixNewItems(c *gin.Context) {
	var indexService = service.QueryItemByIdRequest{}
	if err := c.ShouldBindUri(&indexService); err == nil {
		c.JSON(200, indexService.QuerySixNewItems())
	} else {
		c.JSON(400, ErrorResponse(err))
	}
}
