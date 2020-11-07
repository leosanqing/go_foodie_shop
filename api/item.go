package api

import (
	"errors"
	"fmt"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
)

// ItemInfo 商品详情
func ItemInfo(c *gin.Context) {
	var itemVO model.ItemInfoVO
	var itemService service.QueryItemService

	itemId := c.Param("itemId")
	err, items := itemService.QueryItemsById(itemId)
	if err != nil {
		fmt.Println(items)
		log.ServiceLog.Error("query Item by Id err id ")
		c.JSON(200, ErrorResponse(errors.New("查询商品失败")))
		return
	}
	itemVO.Item = items

	err, itemImg := itemService.QueryItemsImgById(itemId)
	if err != nil {
		log.ServiceLog.Error("query ItemImg by Id err id %s")
		c.JSON(200, ErrorResponse(errors.New("查询商品失败")))
		return
	}
	itemVO.ItemImgList = itemImg

	err, specs := itemService.QueryItemSpec(itemId)
	if err != nil {
		log.ServiceLog.Error("query itemSpec by Id err id %s")
		c.JSON(200, ErrorResponse(errors.New("查询商品规格信息失败")))
		return
	}
	itemVO.ItemSpecList = specs

	err, itemParam := itemService.QueryItemsParam(itemId)
	if err != nil {
		log.ServiceLog.Error("query itemParam by Id err id %s")
		c.JSON(200, ErrorResponse(errors.New("查询商品参数信息失败")))
		return
	}
	itemVO.ItemParam = itemParam

	c.JSON(200, serializer.Response{
		Status: 200,
		Data:   itemVO,
	})
	//c.JSON(200, itemService.ItemInfo())
}
