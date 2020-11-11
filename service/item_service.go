package service

import (
	"go-foodie-shop/model"
)

type QueryItemService struct {
}

func (service *QueryItemService) QueryItemsById(id string) (model.Items, error) {
	var item model.Items
	err := model.DB.
		Where("id = ?", id).
		First(&item).
		Error

	return item, err
}

func (service *QueryItemService) QueryItemsImgById(id string) ([]model.ItemsImg, error) {
	var itemImg []model.ItemsImg
	err := model.DB.
		Where("item_id = ?", id).
		Find(&itemImg).
		Error
	return itemImg, err
}

func (service *QueryItemService) QueryItemSpec(itemId string) ([]model.ItemsSpec, error) {
	var itemSpec []model.ItemsSpec
	err := model.DB.
		Where("item_id = ?", itemId).
		Find(&itemSpec).
		Error
	return itemSpec, err
}

func (service *QueryItemService) QueryItemsParam(itemId string) (error, model.ItemsParam) {
	var itemImg model.ItemsParam
	err := model.DB.
		Where("item_id = ?", itemId).
		First(&itemImg).
		Error
	return err, itemImg
}
