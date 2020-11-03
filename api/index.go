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

func Cats(c *gin.Context) {
	c.JSON(200, service.QueryAllRootLevelCats())
}

func SubCats(c *gin.Context) {
	rootCatIdStr := c.Param("rootCatId")
	if id, err := strconv.Atoi(rootCatIdStr); err == nil {
		c.JSON(200, service.QuerySecondCats(id))
	} else {
		c.JSON(200, ErrorResponse(err))
	}

}
