package model

type OrderItems struct {
	Id           string `gorm:"primary_key;not null" json:"id"`
	OrderId      string `json:"orderId"`
	ItemId       string `json:"itemId"`
	ItemImg      string `json:"itemImg"`
	ItemName     string `json:"itemName"`
	ItemSpecId   string `json:"itemSpecId"`
	ItemSpecName string `json:"itemSpecName"`
	Price        int    `json:"price"`
	BuyCounts    int    `json:"buyCounts"`
}
