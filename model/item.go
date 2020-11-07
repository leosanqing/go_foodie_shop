package model

import "time"

type ItemInfoVO struct {
	Item         Items       `json:"item"`
	ItemImgList  []ItemsImg  `json:"itemImgList"`
	ItemParam    ItemsParam  `json:"itemParam"`
	ItemSpecList []ItemsSpec `json:"itemSpecList"`
}

type Items struct {
	Id       string `gorm:"primary_key;not null" json:"id"`
	ItemName string `json:"itemName"`
	// 分类外键
	CatId int `json:"catId"`
	// 一级分类外键
	RootCatId int `json:"rootCatId"`
	// 累计销量
	SellCounts int `json:"sellCounts"`
	// 上下架状态 1.上架 2.下架
	OnOffStatus int `json:"onOffStatus"`
	// 商品内容
	Content string `json:"content"`

	CreatedTime time.Time `json:"createdTime"`
	UpdatedTime time.Time `json:"updatedTime"`
}
