package api

import (
	"encoding/json"
	"fmt"
	"github.com/gogf/gf/util/gconv"
	"github.com/stretchr/testify/assert"
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
	header.Add("headerUserToken", *tokenImooc)
	req.Header = header
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)

	var users Users
	err := gconv.Struct(res.Data, &users)
	fmt.Println(err)

	assert.Equal(t, "1908189H7TNWDTXP", users.Id)
	assert.Equal(t, "imooc123", users.Username)
	assert.Equal(t, "", users.Password)
}

func TestQueryUserInfo_shouldFail_byErrorUserId(t *testing.T) {
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/center/userInfo?userId=123233222", nil)
	//cookie, err := req.Cookie("user")
	header := http.Header{}
	header.Add("headerUserId", userId)
	header.Add("headerUserToken", *tokenImooc)
	req.Header = header
	R.ServeHTTP(w, req)

	assert.Equal(t, http.StatusOK, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)

	assert.Equal(t, serializer.CodeDBError, res.Status)
}

func TestQueryUserInfo_shouldFail_byWithoutUserId(t *testing.T) {
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/center/userInfo?userId=", nil)
	//cookie, err := req.Cookie("user")
	header := http.Header{}
	header.Add("headerUserId", userId)
	header.Add("headerUserToken", *tokenImooc)
	req.Header = header
	R.ServeHTTP(w, req)

	assert.Equal(t, http.StatusBadRequest, w.Code)
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

	req, _ := http.NewRequest("POST", "/api/v1/user-info/update?userId="+userIdLeosanqing, NewBuffer(marshal))
	//cookie, err := req.Cookie("user")
	header := http.Header{}
	header.Add("headerUserId", userIdLeosanqing)
	header.Add("headerUserToken", *tokenLeosanqing)
	req.Header = header

	R.ServeHTTP(w, req)

	assert.Equal(t, http.StatusOK, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)

	var users Users
	_ = gconv.Struct(res.Data, &users)

	assert.Equal(t, userIdLeosanqing, users.Id)
	assert.Equal(t, realName, users.Realname)
	assert.Equal(t, nickName, users.Nickname)
	assert.Equal(t, email, users.Email)
	assert.Equal(t, "", users.Password)

	*tokenLeosanqing = cache.RedisClient.Get(cache.RedisUserToken + userIdLeosanqing).Val()
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

	req, _ := http.NewRequest("POST", "/api/v1/user-info/update?userId=19120779W7TK6800", NewBuffer(marshal))
	R.ServeHTTP(w, req)

	assert.Equal(t, http.StatusOK, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, serializer.CodeCheckLogin, res.Status)
}
