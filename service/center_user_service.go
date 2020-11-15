package service

import (
	"fmt"
	"go-foodie-shop/model"
	"time"
)

type QueryUserInfoRequest struct {
	UserId string `form:"userId" json:"userId" binding:"required,max=30"`
}

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

func (service *QueryUserInfoRequest) QueryUserInfo() (model.Users, error) {
	user := model.Users{Id: service.UserId}
	err := model.DB.
		First(&user).
		Error
	user.Password = ""
	return user, err
}

func (service *UpdateUserInfoRequest) UpdateUserInfo() (model.Users, error) {
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

	var user2 = model.Users{Email: "asdfasdf"}
	fmt.Println(user2)
	return user, model.DB.Model(&user).Update(&user).Error
}
