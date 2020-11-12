package api

import (
	"errors"
	"fmt"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
	"go-foodie-shop/util"
	"go.uber.org/zap"
)

// ItemInfo 商品详情
func ItemInfo(c *gin.Context) {
	var itemVO model.ItemInfoVO
	var itemService service.QueryItemService
	if err := c.ShouldBind(&itemService); err == nil {
		itemId := c.Param("itemId")
		items, err := itemService.QueryItemsById(itemId)
		if err != nil {
			fmt.Println(items)
			log.ServiceLog.Error("query Item by Id err id ")
			c.JSON(200, ErrorResponse(errors.New("查询商品失败")))
			return
		}
		itemVO.Item = items

		itemImg, err := itemService.QueryItemsImgById(itemId)
		if err != nil {
			log.ServiceLog.Error("query ItemImg by Id err id ")
			c.JSON(200, ErrorResponse(errors.New("查询商品失败")))
			return
		}
		itemVO.ItemImgList = itemImg

		specs, err := itemService.QueryItemSpec(itemId)
		if err != nil {
			log.ServiceLog.Error("query itemSpec by Id err id %s")
			c.JSON(200, ErrorResponse(errors.New("查询商品规格信息失败")))
			return
		}
		itemVO.ItemSpecList = specs

		err, itemParam := itemService.QueryItemsParam(itemId)
		if err != nil {
			log.ServiceLog.Error(
				"query itemParam by Id err id ",
				zap.String("itemId", itemId),
				zap.Error(err),
			)
			c.JSON(200, ErrorResponse(errors.New("查询商品参数信息失败")))
			return
		}
		itemVO.ItemParam = itemParam
		log.ServiceLog.Info("query itemParam by Id err id ", zap.Any("itemParam", itemVO.ItemParam))

		c.JSON(200, serializer.Response{
			Status: 200,
			Data:   itemVO,
			Msg:    "success",
		})
	} else {
		c.JSON(200, ErrorResponse(err))
	}
}

// CommentLevelCounts 评价统计
func CommentLevelCounts(c *gin.Context) {
	var commentService service.CommentService
	if err := c.ShouldBind(&commentService); err == nil {
		if commentLevelVO, err := commentService.GetCommentsCount(); err != nil {
			log.ServiceLog.Error(
				"查询商品评价失败",
				zap.String("itemId", commentService.ItemId),
				zap.Error(err),
			)
			c.JSON(200, ErrorResponse(errors.New("查询商品评价失败")))
		} else {
			log.ServiceLog.Info(
				"查询商品评价成功",
				zap.Any("commentLevelVO", commentLevelVO),
			)
			c.JSON(200, serializer.Response{
				Status: Success,
				Data:   commentLevelVO,
			})
		}
	} else {
		c.JSON(400, ErrorResponse(err))
	}
}

// QueryComments 评价
func QueryComments(c *gin.Context) {
	var commentService service.CommentService
	if err := c.ShouldBind(&commentService); err == nil {
		if itemCommentVOS, total, err := commentService.QueryComment(); err != nil {
			log.ServiceLog.Error(
				"查询商品评价失败",
				zap.String("itemId", commentService.ItemId),
				zap.Error(err),
			)
			c.JSON(200, ErrorResponse(errors.New("查询商品评价失败")))
		} else {
			log.ServiceLog.Info(
				"查询商品评价成功",
				zap.Any("itemCommentVOS", itemCommentVOS),
			)
			// 脱敏处理
			for index := range itemCommentVOS {
				itemCommentVOS[index].Nickname = util.CommonDisplay(itemCommentVOS[index].Nickname)
			}
			result := util.PagedGridResult(itemCommentVOS, total, commentService.Page.Page, commentService.PageSize)
			c.JSON(200, serializer.Response{
				Status: Success,
				Data:   result,
			})
		}
	} else {
		c.JSON(400, ErrorResponse(err))
	}
}

// QueryItemsBySpecIds 刷新购物车
func QueryItemsBySpecIds(c *gin.Context) {
	var shopCartService service.ShopCartService
	if err := c.ShouldBind(&shopCartService); err == nil {
		if shopCartVOS, err := shopCartService.QueryItemsBySpecIds(); err != nil {
			log.ServiceLog.Error(
				"查询商品评价失败",
				zap.String("itemSpecIds", shopCartService.ItemSpecIds),
				zap.Error(err),
			)
			c.JSON(200, ErrorResponse(errors.New("查询商品信息失败")))
		} else {
			log.ServiceLog.Info(
				"查询商品信息成功",
				zap.Any("shopCartVOS", shopCartVOS),
			)

			c.JSON(200, serializer.Response{
				Status: Success,
				Data:   shopCartVOS,
			})
		}
	} else {
		c.JSON(400, ErrorResponse(err))
	}
}
