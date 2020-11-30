package api

import (
	"encoding/json"
	"github.com/stretchr/testify/assert"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
	"go-foodie-shop/util"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestQueryUserInfo(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/center/userInfo?userId=19120779W7TK6800", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	// TODO 指针类型转换异常
	//var users model.Users
	//err := gconv.Struct(res.Data, &users)
	//fmt.Println(err)
	//
	//assert.Equal(t, "1327842402731298816", users.Id)
	//assert.Equal(t, "leosanqing", users.Username)
	//assert.Equal(t, "", users.Password)
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

	req, _ := http.NewRequest("POST", "/api/v1/userInfo/update?userId=19120779W7TK6800", NewBuffer(marshal))
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	// FIXME 指针转换异常
	//var users model.Users
	//err := gconv.Struct(res.Data, &users)
	//fmt.Println(err)
	//
	//assert.Equal(t, "1327842402731298816", users.Id)
	//assert.Equal(t, "leosanqing", users.Username)
	//assert.Equal(t, "", users.Password)
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
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	// FIXME 指针转换异常问题
	//var users model.Users
	//err := gconv.Struct(res.Data, &users)
	//fmt.Println(err)
	//
	//assert.Equal(t, "1327842402731298816", users.Id)
	//assert.Equal(t, "leosanqing", users.Username)
	//assert.Equal(t, "", users.Password)
}
