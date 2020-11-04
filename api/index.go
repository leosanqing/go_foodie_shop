package api

import (
	"github.com/gin-gonic/gin"
	"go-foodie-shop/service"
	"strconv"
)

// Carousel 轮播图展示列表
func Carousel(c *gin.Context) {
	c.JSON(200, service.QueryCarouselList())
}

// Cats 查询以及目录下的所有分类
func Cats(c *gin.Context) {
	c.JSON(200, service.QueryAllRootLevelCats())
}

// SubCats 查询子分类(二三级)
func SubCats(c *gin.Context) {
	rootCatIdStr := c.Param("rootCatId")
	if id, err := strconv.Atoi(rootCatIdStr); err == nil {
		c.JSON(200, service.QuerySubCats(id))
	} else {
		c.JSON(200, ErrorResponse(err))
	}
}

func GetSixNewItems(c *gin.Context) {
	rootCatIdStr := c.Param("rootCatId")
	if id, err := strconv.Atoi(rootCatIdStr); err == nil {
		c.JSON(200, service.QuerySixNewItems(id))
	} else {
		c.JSON(200, ErrorResponse(err))
	}
}
