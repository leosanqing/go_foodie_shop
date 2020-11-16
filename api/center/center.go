package center

import (
	"errors"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/api"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
	"go.uber.org/zap"
)

// QueryUserInfo 查询用户信息
func QueryUserInfo(c *gin.Context) {
	var userInfoRequest = service.QueryUserInfoRequest{}
	if err := c.ShouldBind(&userInfoRequest); err == nil {
		userInfo, err := userInfoRequest.QueryUserInfo()
		if err != nil {
			log.ServiceLog.Error(
				"查询用户信息失败",
				zap.Any("userId", userInfoRequest.UserId),
				zap.Error(err),
			)
			c.JSON(200, api.ErrorResponse(errors.New("查询用户信息失败")))
			return
		}
		log.ServiceLog.Info("查询用户信息成功", zap.Any("userInfo", userInfo))
		c.JSON(200, serializer.Response{
			Status: 200,
			Data:   userInfo,
		})
	} else {
		c.JSON(400, api.ErrorResponse(err))
	}
}

// UpdateUserInfo 更新用户信息
func UpdateUserInfo(c *gin.Context) {
	var updateUserInfoRequest = service.UpdateUserInfoRequest{}
	if err := c.ShouldBind(&updateUserInfoRequest); err == nil {
		userId := c.Query("userId")
		updateUserInfoRequest.UserId = userId

		userInfo, err := updateUserInfoRequest.UpdateUserInfo(c)
		if err != nil {
			log.ServiceLog.Error(
				"更新用户信息失败 ",
				zap.Any("userInfo", userInfo),
				zap.Error(err),
			)
			c.JSON(200, api.ErrorResponse(errors.New("更新用户信息失败")))
			return
		}
		log.ServiceLog.Info("更新用户信息成功", zap.Any("userInfo", userInfo))

		c.JSON(200, serializer.Response{
			Status: 200,
			Data:   userInfo,
		})
	} else {
		c.JSON(400, api.ErrorResponse(err))
	}
}
