package api

import (
	"encoding/json"
	"github.com/gogf/gf/util/gconv"
	"github.com/stretchr/testify/assert"
	"go-foodie-shop/api"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	"go-foodie-shop/service"
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
	req, _ := http.NewRequest("GET", "/api/v1/address/list?userId="+userId, http.NoBody)

	header := http.Header{}
	header.Add("headerUserId", userId)
	header.Add("headerUserToken", *tokenImooc)
	req.Header = header
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
}

func TestQueryAllAddress_shouldErr_notLogin(t *testing.T) {
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/address/list?userId=1908189H7TNWDTXP", http.NoBody)
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, serializer.CodeCheckLogin, res.Status)
}

func TestAddAddress_shouldErr_byNoAuth(t *testing.T) {
	addAddressRequest := service.AddAddressRequest{
		UserId:   "1908189H7TNWDTXP",
		Receiver: "test",
		Mobile:   "15321341111",
		Province: "北京",
		City:     "北京",
		District: "东城区",
		Detail:   "test111111",
	}

	marshal, _ := json.Marshal(&addAddressRequest)
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/address/add", NewBuffer(marshal))
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, serializer.CodeCheckLogin, res.Status)
}

func TestAddAddress(t *testing.T) {
	addAddressRequest := service.AddAddressRequest{
		UserId:   "1908189H7TNWDTXP",
		Receiver: "test",
		Mobile:   "15321341111",
		Province: "北京",
		City:     "北京",
		District: "东城区",
		Detail:   "test111111",
	}
	userAddress := model.UserAddress{
		UserId:   addAddressRequest.UserId,
		Mobile:   addAddressRequest.Mobile,
		Receiver: addAddressRequest.Receiver,
		Detail:   addAddressRequest.Detail,
	}

	marshal, _ := json.Marshal(&addAddressRequest)
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/address/add", NewBuffer(marshal))

	header := http.Header{}
	header.Add("headerUserId", userId)
	header.Add("headerUserToken", *tokenImooc)
	req.Header = header

	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, api.Success, res.Status)

	// 删除数据
	defer func() {
		err := model.DB.
			Where("receiver = ? AND user_id = ?", userAddress.Receiver, userId).
			Delete(model.UserAddress{}).
			Error
		assert.Empty(t, err)
	}()

	// 查询数据库是否有正确数据
	err := model.DB.Model(&model.UserAddress{}).
		First(&userAddress).
		Error

	assert.Empty(t, err)
}
