package model

import "time"

type ItemsParam struct {
	Id              string `gorm:"primary_key;not null" json:"id"`
	ItemId          string `json:"itemId"`          // 商品Id 外键
	ProductPlace    string `json:"productPlace"`    // 生产地
	FootPeriod      string `json:"footPeriod"`      // 保质期
	Brand           string `json:"brand"`           // 品牌名
	FactoryName     string `json:"factoryName"`     // 工厂名
	FactoryAddress  string `json:"factoryAddress"`  // 工厂地址
	StorageMethod   string `json:"storageMethod"`   // 存储方法
	Weight          string `json:"weight"`          // 规格重量
	PackagingMethod string `json:"packagingMethod"` // 包装方式
	EatMethod       string `json:"eatMethod"`       // 食用方式

	CreatedTime time.Time `json:"createdTime"`
	UpdatedTime time.Time `json:"updatedTime"`
}
