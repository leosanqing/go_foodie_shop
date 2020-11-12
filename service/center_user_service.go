package service

import "go-foodie-shop/model"

type CenterUserService struct {
	UserId string `form:"userId" json:"userId" binding:"required,max=30"`
}

func (service *CenterUserService) QueryUserInfo() (model.Users, error) {
	user := model.Users{Id: service.UserId}
	err := model.DB.
		First(&user).
		Error
	user.Password = ""
	return user, err
}
