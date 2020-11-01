package service

import (
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
)

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
