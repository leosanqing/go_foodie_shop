package model

import "time"

type ItemsParam struct {
	Id string `gorm:"primary_key;not null" json:"id"`
	// 商品Id 外键
	ItemId string `json:"itemId"`
	// 生产地
	ProductPlace string `json:"productPlace"`
	// 保质期
	FootPeriod string `json:"footPeriod"`
	// 品牌名
	Brand string `json:"brand"`
	// 工厂名
	FactoryName string `json:"factoryName"`
	// 工厂地址
	FactoryAddress string `json:"factoryAddress"`
	// 存储方法
	StorageMethod string `json:"storageMethod"`
	// 规格重量
	Weight string `json:"weight"`
	// 包装方式
	PackagingMethod string `json:"packagingMethod"`
	// 食用方式
	EatMethod string `json:"eatMethod"`

	CreatedTime time.Time `json:"createdTime"`
	UpdatedTime time.Time `json:"updatedTime"`
}
