package model

import "time"

type Carousel struct {
	Id              string     `gorm:"primary_key;not null" json:"id"`
	ImageUrl        string     `gorm:"not null" json:"imageUrl"`
	BackgroundColor string     `json:"backgroundColor"`
	ItemId          string     `json:"itemId"`
	CatId           string     `json:"catId"`
	Type            int        `gorm:"not null" json:"type"`
	Sort            int        `gorm:"not null" json:"sort"`
	IsShow          int        `gorm:"not null" json:"isShow"`
	CreateTime      *time.Time `gorm:"not null" json:"createTime"`
	UpdateTime      *time.Time `gorm:"not null" json:"updateTime"`
}
