package api

import (
	"encoding/json"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/cache"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
	"go.uber.org/zap"
)

const (
	CarouselKey = "carousel"
	CatsKey     = "cats"
)

const (
	Zero = 0
)

// QueryCarousel 轮播图展示列表
// 轮播图失效时间：
// 1. 由后台运行系统统一重置，然后删除缓存
// 2. 定时重置，比如每天夜里
// 3. 设置超时时间，时间过了重置
func QueryCarousel(c *gin.Context) {
	var indexService = service.IndexService{}
	if err := c.ShouldBind(&indexService); err == nil {
		var carouselList []model.Carousel
		// 先查询 redis ，如果redis 没有数据则去数据库查询
		carouselStr := cache.RedisClient.Get(CarouselKey).Val()
		log.ServiceLog.Info("查询 redis 中的 轮播图信息", zap.String("carousel", carouselStr))

		if "" != carouselStr {
			err := json.Unmarshal([]byte(carouselStr), &carouselList)
			if err != nil {
				log.ServiceLog.Error("Json 转换异常", zap.String("carouselStr", carouselStr), zap.Error(err))
				c.JSON(200, serializer.JsonConvertErr(err))
			} else {
				c.JSON(200, serializer.Response{Status: Success, Data: carouselList})
			}
			return
		}

		carouselList, err := indexService.QueryCarouselList()
		if err != nil {
			c.JSON(200, serializer.ParamErr("查询轮播图出错", err))
			return
		}
		// 存入 redis
		marshal, _ := json.Marshal(carouselList)
		cache.RedisClient.Set(CarouselKey, marshal, Zero)
		c.JSON(200, SuccessResponse(carouselList))
	} else {
		c.JSON(200, ErrorResponse(err))
	}
}

// Cats 查询一级目录下的所有分类
// 目录更新不会很频繁，所以也是用 redis 进行缓存
func Cats(c *gin.Context) {
	var indexService = service.IndexService{}
	if err := c.ShouldBind(&indexService); err == nil {

		// 先查询 redis ，如果redis 没有数据则去数据库查询
		catJsonStr := cache.RedisClient.Get(CatsKey).Val()
		log.ServiceLog.Info("查询 redis 中的 以及分类信息", zap.String(CatsKey, catJsonStr))

		var cats []model.Category
		if "" != catJsonStr {
			err := json.Unmarshal([]byte(catJsonStr), &cats)
			if err != nil {
				log.ServiceLog.Error("Json 转换异常", zap.String("catJsonStr", catJsonStr), zap.Error(err))
				c.JSON(200, serializer.JsonConvertErr(err))
			} else {
				c.JSON(200, SuccessResponse(cats))
			}
			return
		}

		cats, err := indexService.QueryAllRootLevelCats()
		if err != nil {
			c.JSON(200, serializer.DBErr("查询一级目录失败", err))
			return
		}
		marshal, _ := json.Marshal(cats)
		cache.RedisClient.Set(CatsKey, marshal, Zero)
		c.JSON(200, SuccessResponse(cats))
	} else {
		c.JSON(400, ErrorResponse(err))
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
