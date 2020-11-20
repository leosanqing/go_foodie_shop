package model

type OrderStatus struct {
	OrderId     string     `gorm:"primary_key;not null" json:"orderId"`
	OrderStatus int        `json:"orderStatus"`
	CreatedTime *LocalTime `json:"createdTime"`
	PayTime     *LocalTime `json:"payTime"`
	SuccessTime *LocalTime `json:"successTime"`
	DeliverTime *LocalTime `json:"deliverTime"`
	CloseTime   *LocalTime `json:"closeTime"`
	CommentTime *LocalTime `json:"commentTime"`
}
