package service

import (
	"github.com/gin-gonic/gin"
)

type AddShopCatItemRequest struct {
	UserId string `form:"userId" json:"userId" binding:"max=30"`
	ShopCartBO
}

type ShopCartBO struct {
	ItemId        string `form:"itemId" json:"itemId" binding:"max=30"`
	ItemImgUrl    string `form:"itemImgUrl" json:"itemImgUrl"`
	ItemName      string `form:"itemName" json:"itemName"`
	SpecId        string `form:"specId" json:"specId"`
	SpecName      string `form:"specName" json:"specName"`
	BuyCounts     int    `form:"buyCounts" json:"buyCounts"`
	PriceDiscount string `form:"priceDiscount" json:"priceDiscount"`
	PriceNormal   string `form:"priceNormal" json:"priceNormal"`
}

func (r *AddShopCatItemRequest) AddItem(c *gin.Context) error {
	return nil
}
