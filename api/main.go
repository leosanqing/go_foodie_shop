package api

import (
	"encoding/json"
	"fmt"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/configs"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	validator "gopkg.in/go-playground/validator.v8"
)

const (
	Success = 200
)

// Ping 状态检查页面
func Ping(c *gin.Context) {
	c.JSON(200, serializer.Response{
		Status: 0,
		Msg:    "Pong",
	})
}

// CurrentUser 获取当前用户
func CurrentUser(c *gin.Context) *model.Users {
	if user, _ := c.Get("user"); user != nil {
		if u, ok := user.(*model.Users); ok {
			return u
		}
	}
	return nil
}

// ErrorResponse 返回错误消息
func ErrorResponse(err error) serializer.Response {
	if ve, ok := err.(validator.ValidationErrors); ok {
		for _, e := range ve {
			field := configs.T(fmt.Sprintf("Field.%s", e.Field))
			tag := configs.T(fmt.Sprintf("Tag.Valid.%s", e.Tag))
			return serializer.ParamErr(
				fmt.Sprintf("%s%s", field, tag),
				err,
			)
		}
	}
	if _, ok := err.(*json.UnmarshalTypeError); ok {
		return serializer.ParamErr("JSON类型不匹配", err)
	}

	return serializer.ParamErr("参数错误", err)
}
