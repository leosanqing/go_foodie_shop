package api

import (
	"github.com/gin-gonic/gin"
	"go-foodie-shop/service"
)

// Carousel 轮播图展示列表
func Carousel(c *gin.Context) {
	c.JSON(200, service.QueryCarouselList())
}
