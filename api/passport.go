package api

import (
	"encoding/json"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/model"
	"go-foodie-shop/service"
	"go-foodie-shop/util"
	"strconv"
)

// UserRegister 用户注册接口
func UserRegister(c *gin.Context) {
	var registerService service.UserRegisterService
	if err := c.ShouldBindJSON(&registerService); err == nil {
		user, res := registerService.Register()
		if nil == user {
			c.JSON(200, res)
			return
		}
		// 注册成功
		id, err := util.NextId()
		if err != nil {
			c.JSON(200, ErrorResponse(err))
			return
		}
		jsonStr, err := json.Marshal(&model.Cookie{
			Id:              user.Id,
			Username:        user.Username,
			Nickname:        user.Nickname,
			Face:            user.Face,
			Sex:             user.Sex,
			UserUniqueToken: strconv.Itoa(int(id)),
		})
		//values:= url.Values{}
		//values.Add()
		c.SetCookie("user",
			string(jsonStr),
			3*2000,
			"/",
			"localhost",
			false,
			false,
		)
		c.JSON(200, res)
	} else {
		c.JSON(200, ErrorResponse(err))
	}
}

// 判断用户名是否存在
func UsernameIsExist(c *gin.Context) {
	username := c.Query("username")
	exist := service.UsernameExist(username)
	c.JSON(200, exist)
}
