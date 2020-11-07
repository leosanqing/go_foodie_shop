package model

import "time"

type ItemsImg struct {
	Id          string    `gorm:"primary_key;not null" json:"id"`
	ItemId      string    `json:"itemId"`
	Url         string    `json:"url"`
	Sort        int       `json:"sort"`
	IsMain      int       `json:"isMain"`
	CreatedTime time.Time `json:"createdTime"`
	UpdatedTime time.Time `json:"updatedTime"`
}
