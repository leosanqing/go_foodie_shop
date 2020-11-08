package model

import "time"

type ItemInfoVO struct {
	Item         Items       `json:"item"`
	ItemImgList  []ItemsImg  `json:"itemImgList"`
	ItemParam    ItemsParam  `json:"itemParams"`
	ItemSpecList []ItemsSpec `json:"itemSpecList"`
}

type Items struct {
	Id          string `gorm:"primary_key;not null" json:"id"`
	ItemName    string `json:"itemName"`
	CatId       int    `json:"catId"`       // 分类外键
	RootCatId   int    `json:"rootCatId"`   // 一级分类外键
	SellCounts  int    `json:"sellCounts"`  // 累计销量
	OnOffStatus int    `json:"onOffStatus"` // 上下架状态 1.上架 2.下架
	Content     string `json:"content"`     // 商品内容

	CreatedTime time.Time `json:"createdTime"`
	UpdatedTime time.Time `json:"updatedTime"`
}
