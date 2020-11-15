package api

import (
	"bytes"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	_ "github.com/mattn/go-sqlite3"
	"go-foodie-shop/model"
	"go-foodie-shop/server"
	"io"
	"os"
	"testing"
)

// 链接单例
var (
	R *gin.Engine
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
	R = server.NewRouter()

}

func TestMain(m *testing.M) {
	setup()
	fmt.Println("=====begin test======")
	code := m.Run() // 如果不加这句，只会执行Main
	os.Exit(code)
}

func NewBufferString(body string) io.Reader {
	return bytes.NewBufferString(body)
}
func NewBuffer(body []byte) io.Reader {
	return bytes.NewBuffer(body)
}
