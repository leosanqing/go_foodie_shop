package api

import (
	"encoding/json"
	"fmt"
	"github.com/gogf/gf/util/gconv"
	"github.com/stretchr/testify/assert"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
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
	_ = json.Unmarshal([]byte(w.Body.String()), &res)
	var users model.Users
	err := gconv.Struct(res.Data, &users)
	fmt.Println(err)

	assert.Equal(t, "19120779W7TK6800", users.Id)
	assert.Equal(t, "leosanqing", users.Username)
	assert.Equal(t, "", users.Password)
}
