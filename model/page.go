package model

type Page struct {
	Page     int `form:"page" json:"page" binding:"required,min=1,max=30"`
	PageSize int `form:"pageSize" json:"pageSize" binding:"required,min=1,max=100"`
}
