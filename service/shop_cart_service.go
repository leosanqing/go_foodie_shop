package service

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
	PriceDiscount int    `form:"priceDiscount" json:"priceDiscount"`
	PriceNormal   int    `form:"priceNormal" json:"priceNormal"`
}
