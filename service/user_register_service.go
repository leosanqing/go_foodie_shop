package service

import (
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	"go-foodie-shop/util"
	"strconv"
	"time"
)

// UserRegisterService 管理用户注册服务
type UserRegisterService struct {
	Username        string `form:"username" json:"username" binding:"required,min=5,max=30"`
	Password        string `form:"password" json:"password" binding:"required,min=6,max=40"`
	PasswordConfirm string `form:"confirmPassword" json:"confirmPassword" binding:"required,min=6,max=40"`
}

// valid 验证表单
func (service *UserRegisterService) valid() *serializer.Response {
	if service.PasswordConfirm != service.Password {
		return &serializer.Response{
			Status: 500,
			Msg:    "两次输入的密码不相同",
		}
	}

	count := 0
	model.DB.Model(&model.Users{}).Where("username = ?", service.Username).Count(&count)
	if count > 0 {
		return &serializer.Response{
			Status: 500,
			Msg:    "用户名被占用",
		}
	}

	count = 0
	model.DB.Model(&model.Users{}).Where("username = ?", service.Username).Count(&count)
	if count > 0 {
		return &serializer.Response{
			Status: 40001,
			Msg:    "用户名已经注册",
		}
	}

	return nil
}

// Register 用户注册
func (service *UserRegisterService) Register() (*model.Users, serializer.Response) {
	// 表单验证
	if err := service.valid(); err != nil {
		return nil, *err
	}

	if exist := UsernameExist(service.Username); exist.Status != 200 {
		return nil, exist
	}

	id, err := util.NextId()
	if err != nil {
		return nil, serializer.Err(
			serializer.GenerateIdFailed,
			"生成Id失败",
			err,
		)
	}
	var (
		user = model.Users{
			Id:          strconv.Itoa(int(id)),
			Username:    service.Username,
			CreatedTime: time.Now(),
			UpdatedTime: time.Now(),
			Sex:         2,
			Nickname:    service.Username,
		} // 加密密码
	)
	if err := user.SetPassword(service.Password); err != nil {
		return nil, serializer.Err(
			serializer.CodeEncryptError,
			"密码加密失败",
			err,
		)
	}

	// 创建用户
	if err := model.DB.Create(&user).Error; err != nil {
		return nil, serializer.ParamErr("注册失败", err)
	}

	return &user, serializer.Response{Status: 200}
}
