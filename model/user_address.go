package model

type UserAddress struct {
	Id        string `gorm:"primary_key;not null" json:"id"`
	UserId    string `json:"userId"`
	Receiver  string `json:"receiver"`
	Mobile    string `json:"mobile"`
	Province  string `json:"province"`
	City      string `json:"city"`
	District  string `json:"district"`
	Detail    string `json:"detail"`
	Extend    string `json:"extend"`
	IsDefault int    `json:"isDefault"`

	CreatedTime *LocalTime `json:"createdTime"`
	UpdatedTime *LocalTime `json:"updatedTime"`
}
