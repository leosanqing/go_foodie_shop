package api

import (
	"github.com/gin-gonic/gin"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
)

// UserRegister 用户注册接口
func UserRegister(c *gin.Context) {
	var registerService service.RegisterRequest
	if err := c.ShouldBindJSON(&registerService); err == nil {
		res := registerService.Register(c)
		c.JSON(200, res)
	} else {
		c.JSON(400, ErrorResponse(err))
	}
}

// 判断用户名是否存在
func UsernameIsExist(c *gin.Context) {
	username := c.Query("username")
	exist := service.UsernameExist(username)
	c.JSON(200, exist)
}

// UserLogin 用户登录接口
func UserLogin(c *gin.Context) {
	var loginService service.LoginRequest
	if err := c.ShouldBindJSON(&loginService); err == nil {
		res := loginService.Login(c)
		c.JSON(200, res)
	} else {
		c.JSON(200, ErrorResponse(err))
	}
}

// UserLogout 用户退出
func UserLogout(c *gin.Context) {
	deleteCookie(c)
	c.JSON(200, serializer.Response{
		Status: 200,
		Msg:    "登出成功",
	})
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
