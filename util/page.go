package util

import (
	"github.com/jinzhu/gorm"
)

//分页封装
func Paginate(page int, pageSize int) func(db *gorm.DB) *gorm.DB {
	return func(db *gorm.DB) *gorm.DB {
		if page == 0 {
			page = 1
		}
		switch {
		case pageSize > 100:
			pageSize = 100
		case pageSize <= 0:
			pageSize = 10
		}
		offset := (page - 1) * pageSize
		return db.Offset(offset).Limit(pageSize)
	}
}

type PageResult struct {
	Page    int         `json:"page"`    // 当前页数
	Total   int         `json:"total"`   // 总页数
	Records int64       `json:"records"` // 总条数
	Rows    interface{} `json:"rows"`    // 当前页信息
}

func PagedGridResult(vo interface{}, total int64, page, pageSize int) PageResult {
	var result PageResult

	result.Page = page
	result.Rows = vo
	result.Records = total
	result.Total = int(total/int64(pageSize)) + 1

	return result
}
