package service

import (
	"go-foodie-shop/model"
	"strings"
)

type ShopCartService struct {
	ItemSpecIds string `form:"itemSpecIds" json:"itemSpecIds" binding:"required,min=1,max=1024"`
}

func (service *ShopCartService) QueryItemsBySpecIds() ([]model.ShopCartVO, error) {
	ids := strings.Split(service.ItemSpecIds, ",")
	var shopCartVOS []model.ShopCartVO
	err := model.DB.
		Table("items_spec t_items_spec").
		Select(
			"t_items.id as item_id,\n"+
				"t_items.item_name as item_name,\n"+
				"t_items_img.url as item_img_url,\n"+
				"t_items_spec.id as spec_id,\n"+
				"t_items_spec.`name` as spec_name,\n"+
				"t_items_spec.price_discount as price_discount,\n"+
				"t_items_spec.price_normal as price_normal").
		Joins("LEFT JOIN items t_items	ON	t_items.id = t_items_spec.item_id").
		Joins("LEFT JOIN	items_img t_items_img	ON	t_items_img.item_id = t_items.id").
		Where("t_items_img.is_main = 1").
		Where("t_items_spec.id IN (?)", ids).
		Find(&shopCartVOS).
		Error

	return shopCartVOS, err
}
