package api

import (
	"encoding/json"
	"fmt"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/cache"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
)

const ShopCart = "shopcart"

// Add 添加购物车，如果用户如果登录才会调用这个接口，如果没有登录 只会在前端进行控制
func Add(c *gin.Context) {
	var addShopCatItemRequest service.AddShopCatItemRequest
	if err := c.ShouldBind(&addShopCatItemRequest); err == nil {
		userId, b := c.GetQuery("userId")
		if !b {
			c.JSON(400, ErrorResponse(err))
		}
		addShopCatItemRequest.UserId = userId

		var shopCartBOS []service.ShopCartBO

		redisShopCartKey := cache.RedisClient.Get(ShopCart + ":" + userId).Val()
		if len(redisShopCartKey) == 0 {
			shopCartBOS = append(shopCartBOS, addShopCatItemRequest.ShopCartBO)

		} else {

			//}
			//cookie, err := c.Cookie(ShopCart)
			//if len(cookie) == 0 {
			//	shopCartBOS = append(shopCartBOS, addShopCatItemRequest.ShopCartBO)
			//} else {
			err = json.Unmarshal([]byte(redisShopCartKey), &shopCartBOS)
			if err != nil {
				c.JSON(400, ErrorResponse(err))
				return
			}
			isExist := false
			for i, bo := range shopCartBOS {
				if bo.SpecId == addShopCatItemRequest.SpecId {
					shopCartBOS[i].BuyCounts += addShopCatItemRequest.BuyCounts
					isExist = true
				}
			}
			if !isExist {
				shopCartBOS = append(shopCartBOS, addShopCatItemRequest.ShopCartBO)
			}
		}
		jsonStr, _ := json.Marshal(&shopCartBOS)

		cache.RedisClient.Set(ShopCart+":"+userId, jsonStr, 0)

		//c.SetCookie(ShopCart,
		//	string(jsonStr),
		//	3*2000,
		//	"/",
		//	"localhost",
		//	false,
		//	false,
		//)

		if err != nil {
			c.JSON(200, ErrorResponse(err))
			return
		}

		fmt.Println(err)
		c.JSON(200, serializer.Response{
			Status: 200,
		})
	} else {
		c.JSON(400, ErrorResponse(err))
	}
}
