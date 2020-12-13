package api

import (
	"bytes"
	"encoding/json"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	_ "github.com/mattn/go-sqlite3"
	"go-foodie-shop/cache"
	"go-foodie-shop/model"
	"go-foodie-shop/server"
	"go-foodie-shop/service"
	"io"
	"net/http"
	"net/http/httptest"
	"os"
	"testing"
)

// 链接单例
var (
	R               *gin.Engine
	tokenImooc      *string
	tokenLeosanqing *string
)

const (
	userId            = "1908189H7TNWDTXP"
	userIdLeosanqing  = "19120779W7TK6800"
	orderIdLeosanqing = "191215AN25128BR4"
)

func Setup() {
	// DB 配置
	db, err := gorm.Open("mysql", "root:123456@tcp(127.0.0.1:3306)/foodie-shop-dev?charset=utf8&parseTime=True&loc=Local")
	model.DB = db
	if err != nil {
		panic(err)
	}
	db.SingularTable(true)
	model.DB.AutoMigrate(&model.Users{})

	// redis 初始化
	cache.Redis()
	// 装载路由
	R = server.NewRouter()

}

func TestMain(m *testing.M) {
	Setup()
	fmt.Println("=====begin test======")
	Login("imooc123", "123456")
	tokenStr := cache.RedisClient.Get(cache.RedisUserToken + userId).Val()
	tokenImooc = &tokenStr
	Login("leosanqing", "123456")
	tokenStr2 := cache.RedisClient.Get(cache.RedisUserToken + userIdLeosanqing).Val()
	tokenLeosanqing = &tokenStr2
	code := m.Run() // 如果不加这句，只会执行Main
	os.Exit(code)
}

func NewBufferString(body string) io.Reader {
	return bytes.NewBufferString(body)
}

func NewBuffer(body []byte) io.Reader {
	return bytes.NewBuffer(body)
}

func Login(username, password string) {
	marshal, _ := json.Marshal(&service.LoginRequest{
		Username: username,
		Password: password,
	})
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/passport/login", NewBuffer(marshal))
	R.ServeHTTP(w, req)
}
