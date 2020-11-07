package service

import (
	"go-foodie-shop/model"
)

type QueryItemService struct {
}

func (service *QueryItemService) QueryItemsById(id string) (error, model.Items) {
	var item model.Items
	err := model.DB.
		Where("id = ?", id).
		First(&item).
		Error

	return err, item
}

func (service *QueryItemService) QueryItemsImgById(id string) (error, []model.ItemsImg) {
	var itemImg []model.ItemsImg
	err := model.DB.
		Where("item_id = ?", id).
		Find(&itemImg).
		Error
	return err, itemImg
}

func (service *QueryItemService) QueryItemSpec(itemId string) (error, []model.ItemsSpec) {
	var itemSpec []model.ItemsSpec
	err := model.DB.
		Where("item_id = ?", itemId).
		Find(&itemSpec).
		Error
	return err, itemSpec
}

func (service *QueryItemService) QueryItemsParam(itemId string) (error, model.ItemsParam) {
	var itemImg model.ItemsParam
	err := model.DB.
		Where("item_id = ?", itemId).
		First(&itemImg).
		Error
	return err, itemImg
}
