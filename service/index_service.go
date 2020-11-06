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

func QueryAllRootLevelCats() serializer.Response {
	var cats []model.Category
	if err := model.DB.
		Where("type = ?", 1).
		Find(&cats).
		Error; err != nil {
		return serializer.ParamErr("查询分类出错", nil)
	}

	return serializer.Response{
		Status: 200,
		Msg:    "success",
		Data:   cats,
	}
}

//
//func QuerySecondCats(id int) serializer.Response {
//	var catVOS []model.CategoryVO
//	model.DB.
//		Raw(
//			"SELECT\n"+
//				"	f.id as id,\n"+
//				"	f.`name` as `name`,\n"+
//				"	f.type as type,\n"+
//				"	f.father_id as father_id\n"+
//				"FROM\n"+
//				"	category f\n"+
//				"	WHERE f.father_id = ?",
//			id).
//		Scan(&catVOS)
//	for i, vo := range catVOS {
//		cat, err := QueryThirdCat(vo.Id)
//		if err == nil {
//			catVOS[i].SubCatList = cat
//		} else {
//			return serializer.ParamErr("查询子分类出错", nil)
//		}
//	}
//	return serializer.Response{
//		Status: 200,
//		Data:   catVOS,
//		Msg:    "查询子分类成功",
//	}
//}

func QuerySubCats(id int) serializer.Response {
	var catVOS []model.SubCategory
	err := model.DB.
		Raw(
			"SELECT\n"+
				"	f.id as id,\n"+
				"	f.`name` as `name`,\n"+
				"	f.type as type,\n"+
				"	f.father_id as father_id,\n"+
				"	c.id as sub_id,\n"+
				"	c.`name` as sub_name,\n"+
				"	c.type as sub_type,\n"+
				"	c.father_id as sub_father_id\n"+
				"FROM\n"+
				"	category f\n"+
				"LEFT JOIN\n"+
				"	category c	on f.id = c.father_id\n"+
				"WHERE f.father_id = ?", id).
		Scan(&catVOS).Error

	if err != nil {
		return serializer.Response{
			Status: 400,
			Data:   nil,
			Msg:    "查询子分类异常",
		}
	}
	cats := handleSubCats(catVOS)
	return serializer.Response{
		Status: 200,
		Data:   cats,
		Msg:    "查询子分类成功",
	}
}

func handleSubCats(subCats []model.SubCategory) []model.CategoryVO {
	var catVOS []model.CategoryVO
	var subCatVOS []model.SubCategoryVO

	var catVO model.CategoryVO
	var subCatVO model.SubCategoryVO
	id := -1
	// 处理二级
	for _, cat := range subCats {
		if id != cat.Id {
			id = cat.Id
			catVO.Id = cat.Id
			catVO.Name = cat.Name
			catVO.Type = cat.Type
			catVO.FatherId = cat.FatherId
			catVOS = append(catVOS, catVO)
		}
	}

	if catVOS == nil {
		return nil
	}
	count := 0
	// 处理三级
	for _, cat := range subCats {
		if cat.Id == catVOS[count].Id {
			subCatVO.SubId = cat.SubId
			subCatVO.SubName = cat.SubName
			subCatVO.SubType = cat.SubType
			subCatVO.SubFatherId = cat.SubFatherId

			subCatVOS = append(subCatVOS, subCatVO)
		} else {
			catVOS[count].SubCatList = subCatVOS
			count++

			subCatVO.SubId = cat.SubId
			subCatVO.SubName = cat.SubName
			subCatVO.SubType = cat.SubType
			subCatVO.SubFatherId = cat.SubFatherId

			subCatVOS = nil
			subCatVOS = append(subCatVOS, subCatVO)
		}
	}

	// 把最后一个二级目录的加上
	catVOS[count].SubCatList = subCatVOS
	return catVOS
}

func QuerySixNewItems(id int) serializer.Response {
	var newItems []model.NewItems
	err := model.DB.
		Raw(
			"SELECT\n"+
				"	f.id as root_cat_id,\n"+
				"	f.`name` as root_cat_name,\n"+
				"	f.slogan as slogan,\n"+
				"	f.cat_image as cat_image,\n"+
				"	f.bg_color as bg_color,\n"+
				"	i.id as item_id,\n"+
				"	i.item_name as item_name,\n"+
				"	ii.url as item_url,\n"+
				"	i.created_time as created_time\n"+
				"FROM\n"+
				"	category f\n"+
				"LEFT join	items i	on 	f.id = i.root_cat_id\n"+
				"LEFT join	items_img ii on	i.id = ii.item_id\n"+
				"WHERE\n"+
				"	f.type = 1\n"+
				"	and i.root_cat_id = ?\n"+
				"	and ii.is_main = 1\n"+
				"	order by i.created_time	DESC\n"+
				"LIMIT 0,6", id).
		Scan(&newItems).Error

	if err != nil {
		return serializer.Response{
			Status: 400,
			Data:   nil,
			Msg:    "查询子分类异常",
		}
	}
	cats := handleItems(newItems)
	return serializer.Response{
		Status: 200,
		Data:   cats,
		Msg:    "查询子分类成功",
	}
	//return subCatVOS, err
}

func handleItems(newItems []model.NewItems) []model.NewItemsVO {
	if len(newItems) == 0 {
		return nil
	}
	var newItemsVOS []model.NewItemsVO
	var newItemsVO model.NewItemsVO

	var simpleItems []model.SimpleItemVO
	var simpleItem model.SimpleItemVO
	for _, item := range newItems {
		simpleItem.ItemId = item.ItemId
		simpleItem.ItemName = item.ItemName
		simpleItem.ItemUrl = item.ItemUrl
		simpleItems = append(simpleItems, simpleItem)
	}
	// 只会有一个分类
	items := newItems[0]
	newItemsVO.BgColor = items.BgColor
	newItemsVO.CatImage = items.CatImage
	newItemsVO.RootCatId = items.RootCatId
	newItemsVO.RootCatName = items.RootCatName
	newItemsVO.Slogan = items.Slogan
	newItemsVO.SimpleItemList = simpleItems
	return append(newItemsVOS, newItemsVO)
}