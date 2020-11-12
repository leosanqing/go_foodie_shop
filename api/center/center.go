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
	var centerUserService = service.CenterUserService{}
	if err := c.ShouldBind(&centerUserService); err == nil {
		userInfo, err := centerUserService.QueryUserInfo()
		if err != nil {
			log.ServiceLog.Error(
				"search item by id err ",
				zap.Any("userId", centerUserService.UserId),
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
