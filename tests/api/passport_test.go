package api

import (
	"bytes"
	"encoding/json"
	_ "github.com/mattn/go-sqlite3"
	"github.com/stretchr/testify/assert"
	"go-foodie-shop/model"
	"go-foodie-shop/service"
	"io"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestPingRoute(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/ping", nil)
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)
	var dat map[string]interface{}

	json.Unmarshal([]byte(w.Body.String()), &dat)
	assert.Equal(t, "Pong", dat["msg"])
}

func TestResisterRoute(t *testing.T) {
	//bodyStr := `{"username":"pipizhu","password":"12345678","confirmPassword":"12345678"}`

	marshal, _ := json.Marshal(&service.RegisterRequest{
		LoginRequest: service.LoginRequest{
			Username: "pipizhu",
			Password: "12345678",
		},
		PasswordConfirm: "12345678",
	})
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/passport/regist", NewBuffer(marshal))
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var user model.Users
	model.DB.Where("username=?", "pipizhu").First(&user)

	defer model.DB.Where("username=?", "pipizhu").Delete(&user)
	assert.Equal(t, "pipizhu", user.Username)
}

func TestResister_fail(t *testing.T) {
	//bodyStr := `{"username":"pipizhu","password":"12345678","confirmPassword":"12345678"}`

	marshal, _ := json.Marshal(&service.RegisterRequest{
		LoginRequest: service.LoginRequest{
			Username: "pipizhu",
			Password: "12345678",
		},
		PasswordConfirm: "1234567",
	})
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/passport/regist", NewBuffer(marshal))
	R.ServeHTTP(w, req)

	assert.Equal(t, 400, w.Code)
}

func TestUsernameExist(t *testing.T) {
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/passport/usernameIsExist?username=leosanqing", nil)
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var dat map[string]interface{}

	json.Unmarshal([]byte(w.Body.String()), &dat)
	assert.Equal(t, "用户名已经注册", dat["msg"])

}

func TestLogin(t *testing.T) {
	marshal, _ := json.Marshal(&service.LoginRequest{
		Username: "leosanqing",
		Password: "123456",
	})
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/passport/login", NewBuffer(marshal))
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var dat map[string]interface{}

	json.Unmarshal([]byte(w.Body.String()), &dat)
	assert.Equal(t, "登录成功", dat["msg"])

}

func TestLogout(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("DELETE", "/api/v1/passport/logout", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var dat map[string]interface{}

	json.Unmarshal([]byte(w.Body.String()), &dat)
	assert.Equal(t, "登出成功", dat["msg"])

}

func NewBufferString(body string) io.Reader {
	return bytes.NewBufferString(body)
}
func NewBuffer(body []byte) io.Reader {
	return bytes.NewBuffer(body)
}
