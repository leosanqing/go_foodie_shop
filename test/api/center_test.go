package api

import (
	"encoding/json"
	"fmt"
	"github.com/gogf/gf/util/gconv"
	"github.com/stretchr/testify/assert"
	"go-foodie-shop/api"
	"go-foodie-shop/cache"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
	"go-foodie-shop/util"
	"net/http"
	"net/http/httptest"
	"testing"
)

type Users struct {
	model.Users
	Birthday    string `json:"birthday"`
	CreatedTime string `json:"createdTime"`
	UpdatedTime string `json:"updatedTime"`
}

func TestQueryUserInfo(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/center/userInfo?userId="+userId, nil)
	//cookie, err := req.Cookie("user")
	header := http.Header{}
	header.Add("headerUserId", userId)
	header.Add("headerUserToken", *token)
	req.Header = header
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	// TODO 指针类型转换异常
	var users Users
	err := gconv.Struct(res.Data, &users)
	fmt.Println(err)

	assert.Equal(t, "1908189H7TNWDTXP", users.Id)
	assert.Equal(t, "imooc123", users.Username)
	assert.Equal(t, "", users.Password)
}

func TestQueryUserInfo_shouldErr_byNoAuth(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/center/userInfo?userId=19120779W7TK6800", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, serializer.CodeCheckLogin, res.Status)
}

func TestUpdateUserInfo(t *testing.T) {
	Login("leosanqing", "123456")
	userId := "19120779W7TK6800"
	token := cache.RedisClient.Get(cache.RedisUserToken + userId).Val()
	w := httptest.NewRecorder()
	runes := util.RandStringRunes(2)
	realName := "leo" + runes
	nickName := "leosanqing" + runes
	email := "leosanqing" + runes + "@qq.com"

	marshal, _ := json.Marshal(&service.UpdateUserInfoRequest{
		Realname: realName,
		Nickname: nickName,
		Email:    email,
	})

	req, _ := http.NewRequest("POST", "/api/v1/userInfo/update?userId="+userId, NewBuffer(marshal))
	//cookie, err := req.Cookie("user")
	header := http.Header{}
	header.Add("headerUserId", userId)
	header.Add("headerUserToken", token)
	req.Header = header

	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)

	var users Users
	_ = gconv.Struct(res.Data, &users)

	assert.Equal(t, userId, users.Id)
	assert.Equal(t, realName, users.Realname)
	assert.Equal(t, nickName, users.Nickname)
	assert.Equal(t, email, users.Email)
	assert.Equal(t, "", users.Password)
}

func TestUploadFace_shouldErr_byNoAuth(t *testing.T) {
	w := httptest.NewRecorder()
	runes := util.RandStringRunes(2)
	realName := "leo" + runes
	nickName := "leosanqing" + runes
	email := "leosanqing" + runes + "@qq.com"

	marshal, _ := json.Marshal(&service.UpdateUserInfoRequest{
		Realname: realName,
		Nickname: nickName,
		Email:    email,
	})

	req, _ := http.NewRequest("POST", "/api/v1/userInfo/update?userId=19120779W7TK6800", NewBuffer(marshal))
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, serializer.CodeCheckLogin, res.Status)
}

// TODO 上传用户头像
func TestUploadFace(t *testing.T) {

	w := httptest.NewRecorder()
	runes := util.RandStringRunes(2)
	realName := "leo" + runes
	nickName := "leosanqing" + runes
	email := "leosanqing" + runes + "@qq.com"

	marshal, _ := json.Marshal(&service.UpdateUserInfoRequest{
		Realname: realName,
		Nickname: nickName,
		Email:    email,
	})

	req, _ := http.NewRequest("POST", "/api/v1/userInfo/update?userId=19120779W7TK6800", NewBuffer(marshal))
	//cookie, err := req.Cookie("user")
	header := http.Header{}
	header.Add("headerUserId", userId)
	header.Add("headerUserToken", *token)
	req.Header = header

	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, api.Success, res.Status)
	// FIXME 指针转换异常问题
	//var users model.Users
	//err := gconv.Struct(res.Data, &users)
	//fmt.Println(err)
	//
	//assert.Equal(t, "1327842402731298816", users.Id)
	//assert.Equal(t, "leosanqing", users.Username)
	//assert.Equal(t, "", users.Password)
}
