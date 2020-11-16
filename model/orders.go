package model

import "time"

type Orders struct {
	Id              string    `gorm:"primary_key;not null" json:"id"`
	UserId          string    `json:"userId"`
	ReceiverName    string    `json:"receiverName"` // 收件人名称
	ReceiverMobile  string    `json:"receiverMobile"`
	ReceiverAddress string    `json:"receiverAddress"`
	TotalAmount     int       `json:"totalAmount"`
	RealPayAmount   int       `json:"realPayAmount"`
	PostAmount      int       `json:"postAmount"`
	PayMethod       int       `json:"payMethod"`
	LeftMsg         string    `json:"leftMsg"`
	Extend          string    `json:"extend"`
	IsComment       int       `json:"isComment"` // 买家是否评价;1：已评价，0：未评价
	IsDelete        int       `json:"isDelete"`  // 逻辑删除状态;1: 删除 0:未删除
	CreatedTime     time.Time `json:"createdTime"`
	UpdatedTime     time.Time `json:"updatedTime"`
}
