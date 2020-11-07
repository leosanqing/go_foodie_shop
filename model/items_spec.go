package model

import (
	"github.com/shopspring/decimal"
	"time"
)

type ItemsSpec struct {
	Id            string          `gorm:"primary_key;not null" json:"id"`
	ItemId        string          `json:"itemId"`
	Name          string          `json:"name"`
	Stock         int             `json:"stock"`
	Discounts     decimal.Decimal `json:"discounts" type:"decimal(4,2)"`
	PriceDiscount int             `json:"priceDiscount"`
	PriceNormal   int             `json:"priceNormal"`
	CreatedTime   time.Time       `json:"createdTime"`
	UpdatedTime   time.Time       `json:"updatedTime"`
}
