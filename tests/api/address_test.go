package api

import (
	"encoding/json"
	"github.com/gogf/gf/util/gconv"
	"github.com/stretchr/testify/assert"
	"go-foodie-shop/api"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	"net/http"
	"net/http/httptest"
	"testing"
)

type UserAddressBO struct {
	model.UserAddress
	CreatedTime string `json:"createdTime"`
	UpdatedTime string `json:"updatedTime"`
}

func TestQueryAllAddress(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/address/list?userId=1908189H7TNWDTXP", http.NoBody)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, api.Success, res.Status)

	var userAddressBOS []UserAddressBO
	_ = gconv.SliceStruct(res.Data, &userAddressBOS)

	assert.Equal(t, 2, len(userAddressBOS)) //

	for _, bo := range userAddressBOS {
		assert.Equal(t, "1908189H7TNWDTXP", bo.UserId)
	}

	firstItem := userAddressBOS[0]
	assert.Equal(t, "190825CG3AA14Y3C", firstItem.Id)
	assert.Equal(t, "jack", firstItem.Receiver)
	assert.Equal(t, "13333333333", firstItem.Mobile)
	assert.Equal(t, "北京", firstItem.Province)
	assert.Equal(t, "北京", firstItem.City)
	assert.Equal(t, "东城区", firstItem.District)
	assert.Equal(t, "123", firstItem.Detail)
	assert.Equal(t, "123213", firstItem.Extend)
	assert.Equal(t, 1, firstItem.IsDefault)
	assert.Equal(t, "2019-08-25 17:34:14", firstItem.CreatedTime)

	//assert.Equal(t, "1327842402731298816", userAddressBOS.Id)
	//assert.Equal(t, "leosanqing", userAddressBOS.Username)
	//assert.Equal(t, "", userAddressBOS.Password)
}
