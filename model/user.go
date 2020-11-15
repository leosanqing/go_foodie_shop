package model

import (
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
	Birthday    *LocalDate `gorm:"not null" json:"birthday"`
	CreatedTime time.Time  `json:"createdTime"`
	UpdatedTime time.Time  `json:"updatedTime"`
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
