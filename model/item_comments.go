package model

import "time"

type CommentLevel int

const (
	Good CommentLevel = iota + 1
	Normal
	Bad
)

type ItemsComments struct {
	Id           string    `gorm:"primary_key;not null" json:"id"`
	UserId       string    `json:"userId"`
	ItemId       string    `json:"itemId"`
	ItemName     string    `json:"itemName"`
	ItemSpecId   string    `json:"itemSpecId"`
	SpecName     string    `json:"specName"`
	CommentLevel int       `json:"commentLevel"`
	Content      string    `json:"content"`
	CreatedTime  time.Time `json:"createdTime"`
	UpdatedTime  time.Time `json:"updatedTime"`
}

type CommentLevelCountsVO struct {
	TotalCounts  int64 `json:"totalCounts"`
	GoodCounts   int64 `json:"goodCounts"`
	NormalCounts int64 `json:"normalCounts"`
	BadCounts    int64 `json:"badCounts"`
}

func (c *ItemsComments) GetCommentCounts(itemId string, level CommentLevel) (int64, error) {
	var count int64
	err := DB.
		Model(c).
		Where("item_id =? AND comment_level = ?", itemId, level).
		Count(&count).Error
	return count, err
}
