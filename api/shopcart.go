package api

import (
	"github.com/gin-gonic/gin"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
)

const ShopCart = "shopcart"

// Add 查询商品
func Add(c *gin.Context) {
	var addShopCatItemRequest service.AddShopCatItemRequest
	if err := c.ShouldBind(&addShopCatItemRequest); err == nil {
		userId, b := c.GetQuery("userId")
		if !b {
			c.JSON(400, ErrorResponse(err))
		}
		addShopCatItemRequest.UserId = userId
		//
		//err := addShopCatItemRequest.AddItem(c)
		//
		//var shopCartBOS []service.ShopCartBO
		//cookie, err := c.Cookie(ShopCart)
		//if len(cookie) == 0{
		//	shopCartBOS = append(shopCartBOS, addShopCatItemRequest.ShopCartBO)
		//}else {
		//	err = json.Unmarshal([]byte(cookie), &shopCartBOS)
		//	if err != nil{
		//		c.JSON(400, ErrorResponse(err))
		//		return
		//	}
		//	isExist := false
		//	for i, bo := range shopCartBOS {
		//		if bo.SpecId == addShopCatItemRequest.SpecId{
		//			shopCartBOS[i].BuyCounts += addShopCatItemRequest.BuyCounts
		//			isExist = true
		//		}
		//	}
		//	if !isExist{
		//		shopCartBOS = append(shopCartBOS, addShopCatItemRequest.ShopCartBO)
		//	}
		//}
		//jsonStr, _ := json.Marshal(&shopCartBOS)
		//
		//c.SetCookie("shopcart",
		//	string(jsonStr),
		//	3*2000,
		//	"/",
		//	"localhost",
		//	false,
		//	false,
		//)
		//
		//if err != nil {
		//	c.JSON(200, ErrorResponse(err))
		//	return
		//}
		//
		//fmt.Println(err)
		c.JSON(200, serializer.Response{
			Status: 200,
			Data:   nil,
			Msg:    "success",
		})
	} else {
		c.JSON(400, ErrorResponse(err))
	}
}
