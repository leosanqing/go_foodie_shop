package service

import (
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
)

func QueryCarouselList() serializer.Response {
	var carousel []model.Carousel

	if err := model.DB.
		Where("is_show = ?", 1).
		Order("sort").
		Find(&carousel).
		Error; err != nil {
		return serializer.ParamErr("查询轮播图出错", nil)
	}

	return serializer.Response{
		Status: 200,
		Msg:    "success",
		Data:   carousel,
	}
}
