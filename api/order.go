package api

import (
	"encoding/json"
	"errors"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
	"go.uber.org/zap"
	"net/http"
)

func CreateOrder(c *gin.Context) {
	var registerService service.CreateOrderRequest
	if err := c.ShouldBindJSON(&registerService); err == nil {
		// 获取cookie 内容
		cookie, err := c.Cookie(ShopCart)
		if err != nil {
			log.ServiceLog.Error(
				"获取购物车信息失败",
				zap.Error(err),
			)
			c.JSON(http.StatusOK, ErrorResponse(errors.New("获取购物车信息失败")))
			return
		}

		log.ServiceLog.Info(
			"获取购物车信息成功",
			zap.String("shopCartCookie", cookie),
		)

		var shopCartBOS []service.ShopCartBO
		err = json.Unmarshal([]byte(cookie), &shopCartBOS)

		if err != nil {
			log.ServiceLog.Error(
				"解析购物车Json异常",
				zap.Error(err),
			)
			c.JSON(http.StatusOK, ErrorResponse(errors.New("解析购物车Json异常")))
			return
		}

		// 1.创建订单
		orderVO, err := registerService.CreateOrder(shopCartBOS)
		if err != nil {
			c.JSON(http.StatusOK, ErrorResponse(err))
			return
		}

		list := orderVO.ToBeRemovedList
		var dic = make(map[string]interface{})
		for _, bo := range list {
			dic[bo.SpecId] = bo
		}

		var shopCartItems []service.ShopCartBO
		for _, bo := range shopCartBOS {
			if dic[bo.SpecId] == nil {
				shopCartItems = append(shopCartItems, bo)
			}
		}

		jsonStr, _ := json.Marshal(&shopCartItems)
		c.SetCookie(
			ShopCart,
			string(jsonStr),
			3*2000,
			"/",
			"localhost",
			false,
			false,
		)

		log.ServiceLog.Info(
			"设置购物车cookie成功",
			zap.String("shopCartCookie", string(jsonStr)),
		)
		// 2.创建订单以后，移除购物车中已结算的商品
		c.JSON(http.StatusOK, serializer.Response{Status: Success, Data: orderVO.OrderId})
	} else {
		c.JSON(http.StatusBadRequest, ErrorResponse(err))
	}
}

// 查询支付状态
func GetPaidOrderInfo(c *gin.Context) {
	var orderInfoRequest service.QueryPaidOrderInfoRequest
	if err := c.ShouldBindQuery(&orderInfoRequest); err == nil {
		info, err := orderInfoRequest.QueryPaidOrderInfo()
		if err != nil {
			c.JSON(http.StatusOK, ErrorResponse(err))
			return
		}
		c.JSON(http.StatusOK, SuccessResponse(info))
	} else {
		c.JSON(http.StatusBadRequest, ErrorResponse(err))
	}
}
