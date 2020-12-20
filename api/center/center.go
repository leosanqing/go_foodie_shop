package center

import (
	"errors"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/api"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
	"go.uber.org/zap"
	"net/http"
)

// QueryUserInfo 查询用户信息
func QueryUserInfo(c *gin.Context) {
	var userInfoRequest = service.QueryUserInfoRequest{}
	if err := c.ShouldBind(&userInfoRequest); err == nil {
		userInfo, err := userInfoRequest.QueryUserInfo()
		if err != nil {
			log.ServiceLog.Error(
				"查询用户信息失败",
				zap.String("userId", userInfoRequest.UserId),
				zap.Error(err),
			)
			c.JSON(http.StatusOK, serializer.DBErr("查询用户信息失败", err))
			return
		}
		log.ServiceLog.Info("查询用户信息成功", zap.Any("userInfo", userInfo))
		c.JSON(http.StatusOK, api.SuccessResponse(userInfo))
	} else {
		c.JSON(http.StatusBadRequest, api.ErrorResponse(err))
	}
}

// UpdateUserInfo 更新用户信息
func UpdateUserInfo(c *gin.Context) {
	var updateUserInfoRequest = service.UpdateUserInfoRequest{}
	if err := c.BindJSON(&updateUserInfoRequest); err == nil {
		userId := c.Query("userId")
		updateUserInfoRequest.UserId = userId

		userInfo, err := updateUserInfoRequest.UpdateUserInfo(c)
		if err != nil {
			log.ServiceLog.Error(
				"更新用户信息失败 ",
				zap.Any("userInfo", userInfo),
				zap.Error(err),
			)
			c.JSON(http.StatusOK, api.ErrorResponse(errors.New("更新用户信息失败")))
			return
		}
		log.ServiceLog.Info("更新用户信息成功", zap.Any("userInfo", userInfo))

		c.JSON(http.StatusOK, api.SuccessResponse(userInfo))
	} else {
		c.JSON(http.StatusBadRequest, api.ErrorResponse(err))
	}
}

func UploadFace(c *gin.Context) {
	var uploadFaceRequest = service.UploadFaceRequest{}
	if err := c.ShouldBind(&uploadFaceRequest); err == nil {
		userId := c.Query("userId")
		if "" == userId {
			c.JSON(http.StatusBadRequest, api.ErrorResponse(errors.New("userId 不能为空")))
			return
		}

		uploadFaceRequest.UserId = userId
		userInfo, err := uploadFaceRequest.UploadFace(c)
		if err != nil {
			log.ServiceLog.Error(
				"用户上传头像失败",
				zap.String("userId", uploadFaceRequest.UserId),
				zap.Error(err),
			)
			c.JSON(http.StatusOK, api.ErrorResponse(errors.New("上传头像失败")))
			return
		}
		log.ServiceLog.Info("用户上传头像成功", zap.Any("userInfo", userInfo))
		c.JSON(http.StatusOK, api.SuccessResponse(userInfo))
	} else {
		c.JSON(http.StatusBadRequest, api.ErrorResponse(err))
	}
}
