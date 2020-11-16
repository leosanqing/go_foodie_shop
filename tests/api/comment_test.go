package api

import (
	"encoding/json"
	"github.com/gogf/gf/util/gconv"
	"github.com/stretchr/testify/assert"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestQueryPending(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/mycomment/pending?userId=19120779W7TK6800&orderId=191215AN25128BR4", http.NoBody)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal([]byte(w.Body.String()), &res)
	var orderItems []model.OrderItems
	_ = gconv.SliceStruct(res.Data, &orderItems)

	for _, item := range orderItems {
		assert.Equal(t, "191215AN25128BR4", item.OrderId)
	}

	firstItem := orderItems[0]
	assert.Equal(t, 2, len(orderItems))
	assert.Equal(t, "191215AN2537P0M8", firstItem.Id)
	assert.Equal(t, "cake-1005", firstItem.ItemId)
	assert.Equal(t, "http://122.152.205.72:88/foodie/cake-1005/img1.png", firstItem.ItemImg)
	assert.Equal(t, "草莓水果", firstItem.ItemName)
	assert.Equal(t, "cake-1005-spec-2", firstItem.ItemSpecId)
	assert.Equal(t, "草莓水果", firstItem.ItemSpecName)
	assert.Equal(t, 14240, firstItem.Price)
	assert.Equal(t, 1, firstItem.BuyCounts)

}
