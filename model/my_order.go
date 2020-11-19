package model

import "time"

// 我的订单展示对象
type MyOrderVO struct {
	OrderId          string             `json:"orderId"`
	CreatedTime      time.Time          `json:"createdTime"`
	PayMethod        int                `json:"payMethod"`
	RealPayAmount    int                `json:"realPayAmount"`
	PostAmount       int                `json:"postAmount"`
	IsComment        int                `json:"isComment"`
	OrderStatus      int                `json:"orderStatus"`
	SubOrderItemList []MySubOrderItemVO `json:"subOrderItemList"`
}

type MySubOrderItemVO struct {
	ItemId       string `json:"itemId"`
	ItemImg      string `json:"itemImg"`
	ItemName     string `json:"itemName"`
	ItemSpecName string `json:"itemSpecName"`
	BuyCounts    int    `json:"buyCounts"`
	Price        int    `json:"price"`
}

type OrderStatusCountsVO struct {
	WaitPayCounts     int64 `json:"waitPayCounts"`
	WaitDeliverCounts int64 `json:"waitDeliverCounts"`
	WaitReceiveCounts int64 `json:"waitReceiveCounts"`
	WaitCommentCounts int64 `json:"waitCommentCounts"`
}
