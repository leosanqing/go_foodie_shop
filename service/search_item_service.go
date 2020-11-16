package service

import (
	"go-foodie-shop/model"
	"go-foodie-shop/util"
)

type SearchItemService struct {
	Keywords string   `form:"keywords" json:"keywords" binding:"max=30"`
	CatId    int      `form:"catId" json:"catId" `
	Sort     SortType `form:"sort" json:"sort"`
	model.Page
}

type SortType string

const (
	SellCount     SortType = "c"
	PriceDiscount SortType = "p"
)

func (service *SearchItemService) SearchItems() ([]model.SearchItemsVO, int64, error) {
	var searchItems []model.SearchItemsVO
	db := model.DB.
		Table("items as i").
		Select(
			"i.id as id,\n" +
				"i.item_name as item_name,\n" +
				"i.sell_counts as sell_counts,\n" +
				"ii.url as img_url,\n" +
				"tempSpec.price_discount as price").
		Joins("LEFT JOIN	items_img AS ii ON i.id = ii.item_id").
		Joins(
			"LEFT JOIN \n" +
				"	(\n" +
				"		SELECT\n" +
				"		item_id,min(price_discount) as price_discount\n" +
				"		FROM\n" +
				"		items_spec\n" +
				"		GROUP BY item_id\n" +
				"	) tempSpec\n" +
				"on i.id  = tempSpec.item_id").
		Where("ii.is_main = 1")

	if service.Keywords != "" {
		db = db.Where("i.item_name like ?", "%"+service.Keywords+"%")
	}

	if service.Sort == PriceDiscount {
		db = db.Order("tempSpec.price_discount ASC")
	} else if service.Sort == SellCount {
		db = db.Order("i.sell_counts DESC")
	} else {
		db = db.Order("i.item_name ASC")
	}

	var count int64
	if err := db.Count(&count).Error; err != nil {
		return nil, 0, err
	}

	err := db.
		Scopes(util.Paginate(service.Page.Page, service.PageSize)).
		Find(&searchItems).
		Error

	return searchItems, count, err
}

func (service *SearchItemService) SearchItemsByCatId() ([]model.SearchItemsVO, int64, error) {
	var searchItems []model.SearchItemsVO
	db := model.DB.
		Table("items as i").
		Select(
			"i.id as id,\n"+
				"i.item_name as item_name,\n"+
				"i.sell_counts as sell_counts,\n"+
				"ii.url as img_url,\n"+
				"tempSpec.price_discount as price").
		Joins("LEFT JOIN	items_img AS ii ON i.id = ii.item_id").
		Joins(
			"LEFT JOIN \n"+
				"	(\n"+
				"		SELECT\n"+
				"		item_id,min(price_discount) as price_discount\n"+
				"		FROM\n"+
				"		items_spec\n"+
				"		GROUP BY item_id\n"+
				"	) tempSpec\n"+
				"on i.id  = tempSpec.item_id").
		Where("ii.is_main = 1 AND i.cat_id = ?", service.CatId)

	if service.Sort == PriceDiscount {
		db = db.Order("tempSpec.price_discount ASC")
	} else if service.Sort == SellCount {
		db = db.Order("i.sell_counts DESC")
	} else {
		db = db.Order("i.item_name ASC")
	}

	var count int64
	if err := db.Count(&count).Error; err != nil {
		return nil, 0, err
	}

	err := db.
		Scopes(util.Paginate(service.Page.Page, service.PageSize)).
		Find(&searchItems).
		Error

	return searchItems, count, err
}
