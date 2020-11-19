package api

import (
	"encoding/json"
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

func TestQueryMyOrder(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/my_orders/query?userId=19120779W7TK6800&orderStatus=&page=1&pageSize=3", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal([]byte(w.Body.String()), &res)
	var result util.PageResult
	_ = gconv.Struct(res.Data, &result)

	var myOrderVOS []model.MyOrderVO
	_ = gconv.SliceStruct(result.Rows, &myOrderVOS)

	assert.Equal(t, 3, result.Total)
	assert.Equal(t, int64(8), result.Records)
	assert.Equal(t, 1, result.Page)

	assert.Equal(t, 3, len(myOrderVOS))

	firstItem := myOrderVOS[0]
	assert.Equal(t, "191215AM5260S894", firstItem.OrderId)
	assert.Equal(t, 1, firstItem.PayMethod)
	assert.Equal(t, 1, firstItem.IsComment)
	assert.Equal(t, 32040, firstItem.RealPayAmount)
	assert.Equal(t, 0, firstItem.PostAmount)
	assert.Equal(t, int(service.Success), firstItem.OrderStatus)
	assert.Equal(t, 2, len(firstItem.SubOrderItemList))

	vo := firstItem.SubOrderItemList[0]
	assert.Equal(t, "cake-1005", vo.ItemId)
	assert.Equal(t, "http://122.152.205.72:88/foodie/cake-1005/img1.png", vo.ItemImg)
	assert.Equal(t, "草莓水果", vo.ItemName)
	assert.Equal(t, "草莓水果", vo.ItemSpecName)
	assert.Equal(t, 1, vo.BuyCounts)
	assert.Equal(t, 14240, vo.Price)
}

func TestQueryTrend(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/my_orders/trend?userId=19120779W7TK6800&page=1&pageSize=3", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal([]byte(w.Body.String()), &res)
	var result util.PageResult
	_ = gconv.Struct(res.Data, &result)

	// fixme 字符串转指针对象问题
	//var orderStatuses []model.OrderStatus
	//err := gconv.SliceStruct(result.Rows, &orderStatuses)
	//fmt.Println(err)

}
