package model

import (
	"github.com/gogf/gf/util/gconv"
	"go-foodie-shop/cache"
	"go-foodie-shop/util"
	"golang.org/x/crypto/bcrypt"
	"time"
)

// Users 用户模型
type Users struct {
	//gorm.Model
	Id          string     `gorm:"primary_key;not null" json:"id"`
	Username    string     `json:"username"`
	Password    string     `json:"password"`
	Nickname    string     `json:"nickname"`
	Realname    string     `json:"realname"`
	Face        string     `json:"face"`
	Mobile      string     `json:"mobile"`
	Email       string     `json:"email"`
	Sex         int        `json:"sex"`
	Birthday    *LocalDate `json:"birthday"`
	CreatedTime time.Time  `json:"createdTime"`
	UpdatedTime time.Time  `json:"updatedTime"`
}

type UserVO struct {
	Id              string `json:"id"`
	Username        string `json:"username"`
	Nickname        string `json:"nickname"`
	Face            string `json:"face"`
	Sex             int    `json:"sex"`
	UserUniqueToken string `json:"userUniqueToken"`
}

const (
	// PassWordCost 密码加密难度
	PassWordCost = 12
	// Active 激活用户
	Active string = "active"
	// Inactive 未激活用户
	Inactive string = "inactive"
	// Suspend 被封禁用户
	Suspend string = "suspend"
)

// GetUser 用ID获取用户
func GetUser(ID interface{}) (Users, error) {
	var user Users
	result := DB.First(&user, ID)
	return user, result.Error
}

// SetPassword 设置密码
func (user *Users) SetPassword(password string) error {
	bytes, err := bcrypt.GenerateFromPassword([]byte(password), PassWordCost)
	if err != nil {
		return err
	}
	user.Password = string(bytes)
	return nil

}

// CheckPassword 校验密码
func (user *Users) CheckPassword(password string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password))
	return err == nil
}

// ConvertUsersVO 将其转化为 UserVO 对象，并且存放令牌至 redis
func (user *Users) ConvertUsersVO() UserVO {
	id, _ := util.NextId()
	cache.RedisClient.Set(cache.RedisUserToken+user.Id, gconv.String(id), 0)

	return UserVO{
		Id:              user.Id,
		Username:        user.Username,
		Nickname:        user.Nickname,
		Face:            user.Face,
		Sex:             user.Sex,
		UserUniqueToken: gconv.String(id),
	}
}
