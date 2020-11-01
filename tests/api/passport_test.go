package api

import (
	"bytes"
	"encoding/json"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	_ "github.com/mattn/go-sqlite3"
	"github.com/stretchr/testify/assert"
	"go-foodie-shop/model"
	"go-foodie-shop/server"
	"go-foodie-shop/service"
	"io"
	"net/http"
	"net/http/httptest"
	"os"
	"testing"
)

// DB 数据库链接单例
var (
	r *gin.Engine
)

func setup() {
	db, err := gorm.Open("mysql", "root:123456@tcp(127.0.0.1:3306)/foodie-shop-dev?charset=utf8&parseTime=True&loc=Local")
	model.DB = db
	if err != nil {
		panic(err)
	}

	model.DB.AutoMigrate(&model.Users{})
	// 装载路由
	r = server.NewRouter()

}

func TestPingRoute(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/ping", nil)
	r.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)
	var dat map[string]interface{}

	json.Unmarshal([]byte(w.Body.String()), &dat)
	assert.Equal(t, "Pong", dat["msg"])
}

func TestResisterRoute(t *testing.T) {
	//bodyStr := `{"username":"pipizhu","password":"12345678","confirmPassword":"12345678"}`

	marshal, _ := json.Marshal(&service.PassportService{
		Username:        "pipizhu",
		Password:        "12345678",
		PasswordConfirm: "12345678",
	})
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/passport/regist", NewBuffer(marshal))
	r.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var user model.Users
	model.DB.Where("username=?", "pipizhu").First(&user)
	assert.Equal(t, user.Username, "pipizhu")
	model.DB.Where("username=?", "pipizhu").Delete(&user)
}

func TestUsernameExist(t *testing.T) {
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/passport/usernameIsExist?username=leosanqing", nil)
	r.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var dat map[string]interface{}

	json.Unmarshal([]byte(w.Body.String()), &dat)
	assert.Equal(t, "用户名已经注册", dat["msg"])

}

func TestLogin(t *testing.T) {
	marshal, _ := json.Marshal(&service.PassportService{
		Username: "leosanqing",
		Password: "123456",
	})
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/passport/login", NewBuffer(marshal))
	r.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var dat map[string]interface{}

	json.Unmarshal([]byte(w.Body.String()), &dat)
	assert.Equal(t, 200, dat["status"])

}

func NewBufferString(body string) io.Reader {
	return bytes.NewBufferString(body)
}
func NewBuffer(body []byte) io.Reader {
	return bytes.NewBuffer(body)
}

func TestMain(m *testing.M) {
	setup()
	fmt.Println("=====begin test======")
	code := m.Run() // 如果不加这句，只会执行Main
	os.Exit(code)
}
