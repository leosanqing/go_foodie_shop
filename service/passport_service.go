package service

import (
	"encoding/json"
	"errors"
	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/model"
	"go-foodie-shop/util"
	"go.uber.org/zap"
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
func UsernameExist(username string) error {

	count := 0
	model.DB.Model(&model.Users{}).
		Where("username = ?", username).
		Count(&count)

	if count > 0 {
		log.ServiceLog.Info("用户名已经注册", zap.String("username", username))
		return errors.New("用户名已经注册")
	}

	return nil
}

// setSession 设置session
func (r *RegisterRequest) setSession(c *gin.Context, user model.Users) {
	s := sessions.Default(c)
	s.Clear()
	s.Set("user_id", user.Id)
	s.Save()
}

// Login 用户登录函数
func (r *LoginRequest) Login(c *gin.Context) (model.Users, error) {
	var user model.Users

	if err := model.DB.
		Where("username = ?", r.Username).
		First(&user).
		Error; err != nil {
		log.ServiceLog.Error("账号或密码错误", zap.Any("LoginRequest", r), zap.Error(err))
		return user, errors.New("账号或密码错误")
	}

	if !user.CheckPassword(r.Password) {
		log.ServiceLog.Error("账号或密码错误", zap.Any("LoginRequest", r))
		return user, errors.New("账号或密码错误")
	}

	SetCookie(c, &user)

	return user, nil
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
func (r *RegisterRequest) valid() error {
	if r.PasswordConfirm != r.Password {
		return errors.New("两次输入的密码不相同")
	}

	count := 0
	model.DB.Model(&model.Users{}).Where("username = ?", r.Username).Count(&count)
	if count > 0 {
		return errors.New("用户名被占用")
	}

	count = 0
	model.DB.Model(&model.Users{}).Where("username = ?", r.Username).Count(&count)
	if count > 0 {
		return errors.New("用户名已经注册")
	}

	return nil
}

// Register 用户注册
func (r *RegisterRequest) Register(c *gin.Context) (model.Users, error) {
	// 表单验证
	if err := r.valid(); err != nil {
		return model.Users{}, err
	}

	if exist := UsernameExist(r.Username); exist != nil {
		return model.Users{}, exist
	}

	id, err := util.NextId()
	if err != nil {
		return model.Users{}, err
	}

	var user = model.Users{
		Id:          strconv.Itoa(int(id)),
		Username:    r.Username,
		CreatedTime: time.Now(),
		UpdatedTime: time.Now(),
		Sex:         2,
		Nickname:    r.Username,
		//Birthday:    time.Date(1900, time.January, 1, 0, 0, 0, 0, time.UTC),
		Birthday: &model.LocalDate{},
	} // 加密密码
	if err := user.SetPassword(r.Password); err != nil {
		return model.Users{}, errors.New("密码加密失败")
	}

	// 创建用户
	if err := model.DB.Create(&user).Error; err != nil {
		log.ServiceLog.Error("创建用户失败", zap.Any("user", user), zap.Error(err))
		return model.Users{}, errors.New("创建用户失败")
	}

	// TODO 整合Redis
	SetCookie(c, &user)
	return user, nil
}
