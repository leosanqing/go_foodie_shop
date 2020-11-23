package service

import (
	"encoding/json"
	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	"go-foodie-shop/util"
	"strconv"
	"time"
)

// RegisterRequest 管理用户注册服务
type RegisterRequest struct {
	LoginRequest
	PasswordConfirm string `form:"confirmPassword" json:"confirmPassword" binding:"eqcsfield=LoginRequest.Password"`
}
type LoginRequest struct {
	Username string `form:"username" json:"username" binding:"required,min=5,max=30"`
	Password string `form:"password" json:"password" binding:"required,min=6,max=40"`
}

// Register 用户注册
func UsernameExist(username string) serializer.Response {

	count := 0
	model.DB.Model(&model.Users{}).
		Where("username = ?", username).
		Count(&count)

	if count > 0 {
		return serializer.Response{
			Status: 40001,
			Msg:    "用户名已经注册",
		}
	}

	return serializer.Response{
		Status: 200,
		Msg:    "success",
	}
}

// setSession 设置session
func (service *RegisterRequest) setSession(c *gin.Context, user model.Users) {
	s := sessions.Default(c)
	s.Clear()
	s.Set("user_id", user.Id)
	s.Save()
}

// Login 用户登录函数
func (service *LoginRequest) Login(c *gin.Context) serializer.Response {
	var user model.Users

	if err := model.DB.
		Where("username = ?", service.Username).
		First(&user).
		Error; err != nil {
		return serializer.ParamErr("账号或密码错误", nil)
	}

	if !user.CheckPassword(service.Password) {
		return serializer.ParamErr("账号或密码错误", nil)
	}

	SetCookie(c, &user)
	return serializer.Response{
		Status: 200,
		Msg:    "登录成功",
	}
}

func SetCookie(c *gin.Context, user *model.Users) {
	id, _ := util.NextId()
	jsonStr, _ := json.Marshal(&model.Cookie{
		Id:              user.Id,
		Username:        user.Username,
		Nickname:        user.Nickname,
		Face:            user.Face,
		Sex:             user.Sex,
		UserUniqueToken: strconv.Itoa(int(id)),
	})

	c.SetCookie("user",
		string(jsonStr),
		3*2000,
		"/",
		"localhost",
		false,
		false,
	)
}

// valid 验证表单
func (service *RegisterRequest) valid() *serializer.Response {
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
func (service *RegisterRequest) Register(c *gin.Context) serializer.Response {
	// 表单验证
	if err := service.valid(); err != nil {
		return *err
	}

	if exist := UsernameExist(service.Username); exist.Status != 200 {
		return exist
	}

	id, err := util.NextId()
	if err != nil {
		return serializer.Err(
			serializer.GenerateIdFailed,
			"生成Id失败",
			err,
		)
	}

	var user = model.Users{
		Id:          strconv.Itoa(int(id)),
		Username:    service.Username,
		CreatedTime: time.Now(),
		UpdatedTime: time.Now(),
		Sex:         2,
		Nickname:    service.Username,
		//Birthday:    time.Date(1900, time.January, 1, 0, 0, 0, 0, time.UTC),
		Birthday: &model.LocalDate{},
	} // 加密密码
	if err := user.SetPassword(service.Password); err != nil {
		return serializer.Err(
			serializer.CodeEncryptError,
			"密码加密失败",
			err,
		)
	}

	// 创建用户
	if err := model.DB.Create(&user).Error; err != nil {
		return serializer.ParamErr("注册失败", err)
	}

	// TODO 整合Redis
	SetCookie(c, &user)
	return serializer.Response{Status: 200}
}
