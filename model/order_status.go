package model

import "time"

type OrderStatus struct {
	OrderId     string    `gorm:"primary_key;not null" json:"orderId"`
	OrderStatus string    `json:"orderStatus"`
	CreatedTime time.Time `json:"createdTime"`
	PayTime     time.Time `json:"payTime"`
	DeliverTime time.Time `json:"deliverTime"`
	SuccessTime time.Time `json:"successTime"`
	CloseTime   time.Time `json:"closeTime"`
	CommentTime time.Time `json:"commentTime"`
}
