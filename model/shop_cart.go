package model

type ShopCartVO struct {
	ItemId        string `json:"itemId"`
	ItemImgUrl    string `json:"itemImgUrl"`
	ItemName      string `json:"itemName"`
	SpecId        string `json:"specId"`
	SpecName      string `json:"specName"`
	PriceDiscount string `json:"priceDiscount"`
	PriceNormal   string `json:"priceNormal"`
}
