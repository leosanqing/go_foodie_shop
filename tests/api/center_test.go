package api

import (
	"encoding/json"
	"fmt"
	"github.com/gogf/gf/util/gconv"
	"github.com/stretchr/testify/assert"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
	"go-foodie-shop/util"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestQueryUserInfo(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/center/userInfo?userId=1327842402731298816", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal([]byte(w.Body.String()), &res)
	var users model.Users
	err := gconv.Struct(res.Data, &users)
	fmt.Println(err)

	assert.Equal(t, "1327842402731298816", users.Id)
	assert.Equal(t, "leosanqing", users.Username)
	assert.Equal(t, "", users.Password)
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

	req, _ := http.NewRequest("POST", "/api/v1/userInfo/update?userId=1327842402731298816", NewBuffer(marshal))
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal([]byte(w.Body.String()), &res)
	var users model.Users
	err := gconv.Struct(res.Data, &users)
	fmt.Println(err)

	assert.Equal(t, "1327842402731298816", users.Id)
	assert.Equal(t, "leosanqing", users.Username)
	assert.Equal(t, "", users.Password)
}
