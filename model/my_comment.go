package model

import "time"

type MyCommentVO struct {
	CommentId   string    `json:"commentId"`
	Content     string    `json:"content"`
	ItemId      string    `json:"itemId"`
	ItemName    string    `json:"itemName"`
	SpecName    string    `json:"specName"`
	ItemImg     string    `json:"itemImg"`
	CreatedTime time.Time `json:"createdTime"`
}

type OrderItemsComment struct {
	CommentId    string       `json:"commentId"`
	Content      string       `json:"content"`
	ItemId       string       `json:"itemId"`
	ItemName     string       `json:"itemName"`
	ItemSpecName string       `json:"itemSpecName"`
	ItemSpecId   string       `json:"itemSpecId"`
	CommentLevel CommentLevel `json:"commentLevel"`
}
