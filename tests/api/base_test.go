package api

import (
	"github.com/jinzhu/gorm"
	_ "github.com/mattn/go-sqlite3"
	"go-foodie-shop/model"
	"go-foodie-shop/server"
)

func setup() {
	db, err := gorm.Open("mysql", "root:123456@tcp(127.0.0.1:3306)/foodie-shop-dev?charset=utf8&parseTime=True&loc=Local")
	model.DB = db
	if err != nil {
		panic(err)
	}

	db.SingularTable(true)
	model.DB.AutoMigrate(&model.Users{})
	// 装载路由
	r = server.NewRouter()

}
