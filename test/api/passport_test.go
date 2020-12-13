package api

import (
	"encoding/json"
	_ "github.com/mattn/go-sqlite3"
	"github.com/stretchr/testify/assert"
	"go-foodie-shop/api"
	"go-foodie-shop/cache"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
	"net/http"
	"net/http/httptest"
	"testing"
)

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

	assert.Equal(t, http.StatusOK, w.Code)

	var user model.Users
	model.DB.Where("username=?", "pipizhu").First(&user)

	defer model.DB.Where("username=?", "pipizhu").Delete(&user)
	assert.Equal(t, "pipizhu", user.Username)
}

func TestResister_fail_byErrConfirmPassword(t *testing.T) {
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

	assert.Equal(t, http.StatusOK, w.Code)

	var dat map[string]interface{}

	_ = json.Unmarshal(w.Body.Bytes(), &dat)
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

	assert.Equal(t, http.StatusOK, w.Code)

	res := serializer.Response{}
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, api.Success, res.Status)
	*tokenLeosanqing = cache.RedisClient.Get(cache.RedisUserToken + userIdLeosanqing).Val()
}

func TestLogout(t *testing.T) {
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("DELETE", "/api/v1/passport/logout?userId="+userIdLeosanqing, nil)
	header := http.Header{}
	header.Add("headerUserId", userIdLeosanqing)
	header.Add("headerUserToken", *tokenLeosanqing)
	req.Header = header

	R.ServeHTTP(w, req)

	assert.Equal(t, http.StatusOK, w.Code)

	res := serializer.Response{}
	_ = json.Unmarshal(w.Body.Bytes(), &res)

	assert.Equal(t, api.Success, res.Status)
	assert.Empty(t, cache.RedisClient.Get(cache.RedisUserToken+userIdLeosanqing).Val())

	Login("leosanqing", "123456")
}

func TestLogout_shouldFail_needToLogin(t *testing.T) {
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("DELETE", "/api/v1/passport/logout?userId=191207C12Y7CZ1GC", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, http.StatusOK, w.Code)

	res := serializer.Response{}
	_ = json.Unmarshal(w.Body.Bytes(), &res)

	assert.Equal(t, serializer.CodeCheckLogin, res.Status)
}
