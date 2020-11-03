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

func QuerySecondCats(id int) serializer.Response {
	var catVOS []model.CategoryVO
	model.DB.
		Raw(
			"SELECT\n"+
				"	f.id as id,\n"+
				"	f.`name` as `name`,\n"+
				"	f.type as type,\n"+
				"	f.father_id as father_id\n"+
				"FROM\n"+
				"	category f\n"+
				"	WHERE f.father_id = ?",
			id).
		Scan(&catVOS)
	for i, vo := range catVOS {
		cat, err := QueryThirdCat(vo.Id)
		if err == nil {
			catVOS[i].SubCatList = cat
		} else {
			return serializer.ParamErr("查询子分类出错", nil)
		}
	}
	return serializer.Response{
		Status: 200,
		Data:   catVOS,
		Msg:    "查询子分类成功",
	}
}

func QueryThirdCat(id int) ([]model.SubCategoryVO, error) {
	var subCatVOS []model.SubCategoryVO
	err := model.DB.
		Raw(
			"SELECT\n"+
				"	f.id as sub_id,\n"+
				"	f.`name` as `sub_name`,\n"+
				"	f.type as sub_type,\n"+
				"	f.father_id as sub_father_id\n"+
				"FROM\n"+
				"	category f\n"+
				"	WHERE f.father_id = ?",
			id).
		Scan(&subCatVOS).Error

	return subCatVOS, err
}
