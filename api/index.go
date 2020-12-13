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
	"net/http"
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
		carouselStr := cache.RedisClient.Get(cache.CarouselKey).Val()
		log.ServiceLog.Info("查询 redis 中的 轮播图信息", zap.String("carousel", carouselStr))

		if "" != carouselStr {
			err := json.Unmarshal([]byte(carouselStr), &carouselList)
			if err != nil {
				log.ServiceLog.Error("Json 转换异常", zap.String("carouselStr", carouselStr), zap.Error(err))
				c.JSON(http.StatusOK, serializer.JsonConvertErr(err))
			} else {
				c.JSON(http.StatusOK, SuccessResponse(carouselList))
			}
			return
		}

		carouselList, err := indexService.QueryCarouselList()
		if err != nil {
			c.JSON(http.StatusOK, serializer.ParamErr("查询轮播图出错", err))
			return
		}
		// 存入 redis
		marshal, _ := json.Marshal(carouselList)
		cache.RedisClient.Set(cache.CarouselKey, marshal, Zero)
		c.JSON(http.StatusOK, SuccessResponse(carouselList))
	} else {
		c.JSON(http.StatusBadRequest, ErrorResponse(err))
	}
}

// Cats 查询一级目录下的所有分类
// 目录更新不会很频繁，所以也是用 redis 进行缓存
func Cats(c *gin.Context) {
	var indexService = service.IndexService{}
	if err := c.ShouldBind(&indexService); err == nil {

		// 先查询 redis ，如果redis 没有数据则去数据库查询
		catJsonStr := cache.RedisClient.Get(cache.CatsKey).Val()
		log.ServiceLog.Info("查询 redis 中的 一级分类信息", zap.String(cache.CatsKey, catJsonStr))

		var cats []model.Category
		if "" != catJsonStr {
			err := json.Unmarshal([]byte(catJsonStr), &cats)
			if err != nil {
				log.ServiceLog.Error("Json 转换异常", zap.String("catJsonStr", catJsonStr), zap.Error(err))
				c.JSON(http.StatusOK, serializer.JsonConvertErr(err))
			} else {
				c.JSON(http.StatusOK, SuccessResponse(cats))
			}
			return
		}

		cats, err := indexService.QueryAllRootLevelCats()
		if err != nil {
			c.JSON(http.StatusOK, serializer.DBErr("查询一级目录失败", err))
			return
		}
		marshal, _ := json.Marshal(cats)
		cache.RedisClient.Set(cache.CatsKey, marshal, Zero)
		c.JSON(http.StatusOK, SuccessResponse(cats))
	} else {
		c.JSON(http.StatusBadRequest, ErrorResponse(err))
	}
}

// SubCats 查询子分类(二三级)
func SubCats(c *gin.Context) {
	var indexService = service.QueryItemByIdRequest{}
	if err := c.ShouldBindUri(&indexService); err == nil {
		subCatJsonStr := cache.RedisClient.Get(cache.SubCatKey).Val()
		log.ServiceLog.Info("查询 redis 中的 二级分类信息", zap.String(cache.SubCatKey, subCatJsonStr))

		var subCats []model.CategoryVO
		if "" != subCatJsonStr {
			err := json.Unmarshal([]byte(subCatJsonStr), &subCats)
			if err != nil {
				log.ServiceLog.Error("Json 转换异常", zap.String("subCatJsonStr", subCatJsonStr), zap.Error(err))
				c.JSON(http.StatusOK, serializer.JsonConvertErr(err))
			} else {
				c.JSON(http.StatusOK, SuccessResponse(subCats))
			}
			return
		}

		subCats, err := indexService.QuerySubCats()
		if err != nil {
			c.JSON(http.StatusOK, serializer.DBErr("查询子分类异常", err))
		} else {
			// 存入 redis
			marshal, _ := json.Marshal(subCats)
			cache.RedisClient.Set(cache.SubCatKey+indexService.RootCatId, marshal, Zero)
			c.JSON(http.StatusOK, SuccessResponse(subCats))
		}
	} else {
		c.JSON(http.StatusBadRequest, ErrorResponse(err))
	}
}

func GetSixNewItems(c *gin.Context) {
	var indexService = service.QueryItemByIdRequest{}
	if err := c.ShouldBindUri(&indexService); err == nil {
		c.JSON(http.StatusOK, indexService.QuerySixNewItems())
	} else {
		c.JSON(http.StatusBadRequest, ErrorResponse(err))
	}
}
