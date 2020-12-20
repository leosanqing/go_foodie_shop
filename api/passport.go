package api

import (
	"errors"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/cache"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
	"net/http"
)

// UserRegister 用户注册接口
func UserRegister(c *gin.Context) {
	var registerService service.RegisterRequest
	if err := c.ShouldBindJSON(&registerService); err == nil {
		users, err := registerService.Register(c)
		if err != nil {
			c.JSON(http.StatusOK, ErrorResponse(err))
			return
		}
		syncShopCartData(users.Id, c)
		c.JSON(http.StatusOK, serializer.Response{Status: Success, Data: users})
	} else {
		c.JSON(http.StatusBadRequest, ErrorResponse(err))
	}
}

// 判断用户名是否存在
func UsernameIsExist(c *gin.Context) {
	username := c.Query("username")
	err := service.UsernameExist(username)
	if err != nil {
		c.JSON(http.StatusOK, serializer.Response{Status: http.StatusBadRequest, Msg: "用户名已经注册", Error: err.Error()})
		return
	}
	c.JSON(http.StatusOK, serializer.Response{Status: Success})
}

// UserLogin 用户登录接口
func UserLogin(c *gin.Context) {
	var loginService service.LoginRequest
	if err := c.ShouldBindJSON(&loginService); err == nil {
		users, err := loginService.Login(c)
		if err != nil {
			c.JSON(http.StatusOK, ErrorResponse(err))
			return
		}
		syncShopCartData(users.Id, c)
		c.JSON(http.StatusOK, serializer.Response{Status: Success, Data: users})
	} else {
		c.JSON(http.StatusBadRequest, ErrorResponse(err))
	}
}

// UserLogout 用户退出
func UserLogout(c *gin.Context) {

	userId, exist := c.GetQuery("userId")
	if !exist {
		c.JSON(http.StatusBadRequest, ErrorResponse(errors.New("userId 不能为空")))
	} else {
		cache.RedisClient.Del(cache.RedisUserToken + userId)
		deleteCookie(c)
		c.JSON(http.StatusOK, SuccessResponse(nil))
	}

}

func deleteCookie(c *gin.Context) {
	c.SetCookie("user",
		"",
		-1,
		"/",
		"localhost",
		false,
		false)
}

func syncShopCartData(userId string, c *gin.Context) {
	shopCartRedisStr := cache.RedisClient.Get(ShopCart + ":" + userId).Val()
	cookie, _ := c.Cookie(ShopCart)
	if len(shopCartRedisStr) == 0 {
		if cookie != "" {
			cache.RedisClient.Set(ShopCart+":"+userId, cookie, 0)
		}
	} else {
		if cookie == "" {
			c.SetCookie(ShopCart,
				shopCartRedisStr,
				3*3600,
				"/",
				"localhost",
				false,
				false)
		}
	}
}
