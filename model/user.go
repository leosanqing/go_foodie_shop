package model

import (
	"time"
)

// Users 用户模型
type Users struct {
	//gorm.Model
	Id         string `gorm:"primary_key;not null"`
	Username   string
	Password   string
	Nickname   string
	Realname   string
	Face       string
	Mobile     string
	Email      string
	Sex        int
	Birthday   time.Time
	CreateTime time.Time
	UpdateTime time.Time
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
	user.Password = password
	return nil
}

// CheckPassword 校验密码
func (user *Users) CheckPassword(password string) bool {
	//err := bcrypt.CompareHashAndPassword([]byte(user.PasswordDigest), []byte(password))
	return user.Password == password
}
