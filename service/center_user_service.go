package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/model"
	"mime/multipart"
	"path/filepath"
	"strings"
	"time"
)

type QueryUserInfoRequest struct {
	UserId string `form:"userId" json:"userId" binding:"required,max=30"`
}

const (
	Png  = "png"
	Jpg  = "jpg"
	Jpeg = "jpeg"

	UserFaceImgLocation = "/Users/zhuerchong/go/src/go_foodie_shop/img"
)

type UpdateUserInfoRequest struct {
	//QueryUserInfoRequest
	UserId          string           `form:"userId" json:"userId" binding:"max=30"`
	Username        string           `form:"username" json:"username" binding:"max=12"`
	Password        string           `form:"password" json:"password" binding:"max=18,omitempty"`
	ConfirmPassword string           `form:"confirmPassword" json:"confirmPassword" binding:"max=18,required_with=Password,eqcsfield=Password"`
	Nickname        string           `form:"nickname" json:"nickname" binding:"required,max=12"`
	Realname        string           `form:"realname" json:"realname" binding:"max=12"`
	Mobile          string           `form:"mobile" json:"mobile" binding:"max=16"`
	Email           string           `form:"email" json:"email" binding:"required,email"`
	Sex             int              `form:"sex" json:"sex" binding:"oneof=0 1 2"`
	Birthday        *model.LocalDate `form:"birthday" json:"birthday"`
}

type UploadFaceRequest struct {
	UserId string                `form:"userId" json:"userId" binding:"max=30"`
	File   *multipart.FileHeader `form:"file" json:"file" binding:"required"`
}

func (service *QueryUserInfoRequest) QueryUserInfo() (model.Users, error) {
	user := model.Users{Id: service.UserId}
	err := model.DB.
		First(&user).
		Error
	user.Password = ""
	return user, err
}

func (service *UpdateUserInfoRequest) UpdateUserInfo(c *gin.Context) (model.Users, error) {
	var user = model.Users{
		Id:          service.UserId,
		Username:    service.Username,
		Password:    service.Password,
		Nickname:    service.Nickname,
		Realname:    service.Realname,
		Mobile:      service.Mobile,
		Email:       service.Email,
		Sex:         service.Sex,
		Birthday:    service.Birthday,
		UpdatedTime: time.Now(),
	}

	// TODO 增加令牌，整合redis
	err := model.DB.Model(&user).Update(&user).Error
	if err != nil {
		setCookie(c, &user)
	}

	return user, err
}

func (service *UploadFaceRequest) UploadFace(c *gin.Context) (model.Users, error) {
	var user model.Users
	user.Id = service.UserId

	userFaceImgPrefix := string(filepath.Separator) + service.UserId
	filename := service.File.Filename

	if filename == "" {
		return user, errors.New("未获取到文件名")
	}
	split := strings.Split(filename, `.`)
	suffix := split[len(split)-1]

	// 判断文件格式
	if !strings.EqualFold(suffix, Png) &&
		!strings.EqualFold(suffix, Jpg) &&
		!strings.EqualFold(suffix, Jpeg) {
		return user, errors.New("图片格式不正确")
	}

	// 生成新文件名
	newFileName := "face-" + service.UserId + "." + split[len(split)-1]

	//finalPath := UserFaceImgLocation + userFaceImgPrefix + string(filepath.Separator) + newFileName
	finalPath := UserFaceImgLocation + string(filepath.Separator) + newFileName

	finalUserServerUrl := "http://localhost:8088/img/" + newFileName + "?t=" + time.Now().Format("20060102150405")
	// 用于提供给 web服务
	userFaceImgPrefix = userFaceImgPrefix + "/" + newFileName

	err := c.SaveUploadedFile(service.File, finalPath)
	if err != nil {
		return model.Users{}, err
	}
	user.Face = finalUserServerUrl
	err = model.DB.
		Model(&user).
		Update(&user).
		Error

	if err != nil {
		return model.Users{}, err
	}

	queryUserInfoRequest := QueryUserInfoRequest{UserId: service.UserId}
	info, err := queryUserInfoRequest.QueryUserInfo()
	setCookie(c, &info)
	return info, err
}

func UpdateUserFace() {

}
