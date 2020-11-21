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
	req, _ := http.NewRequest("GET", "/api/v1/my_orders/query?userId=1908189H7TNWDTXP&orderStatus=&page=1&pageSize=3", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	var result util.PageResult
	_ = gconv.Struct(res.Data, &result)

	var myOrderVOS []model.MyOrderVO
	_ = gconv.SliceStruct(result.Rows, &myOrderVOS)

	assert.Equal(t, 9, result.Total)
	assert.Equal(t, int64(26), result.Records)
	assert.Equal(t, 1, result.Page)

	assert.Equal(t, 3, len(myOrderVOS))

	firstItem := myOrderVOS[0]
	assert.Equal(t, "190827F2R9A6ZT2W", firstItem.OrderId)
	assert.Equal(t, 1, firstItem.PayMethod)
	assert.Equal(t, 0, firstItem.IsComment)
	assert.Equal(t, 15000, firstItem.RealPayAmount)
	assert.Equal(t, 0, firstItem.PostAmount)
	assert.Equal(t, int(service.WaitDeliver), firstItem.OrderStatus)
	assert.Equal(t, 1, len(firstItem.SubOrderItemList))

	vo := firstItem.SubOrderItemList[0]
	assert.Equal(t, "bingan-1001", vo.ItemId)
	assert.Equal(t, "http://122.152.205.72:88/foodie/bingan-1001/img1.png", vo.ItemImg)
	assert.Equal(t, "【天天吃货】彩虹马卡龙 下午茶 美眉最爱", vo.ItemName)
	assert.Equal(t, "芒果口味", vo.ItemSpecName)
	assert.Equal(t, 1, vo.BuyCounts)
	assert.Equal(t, 15000, vo.Price)
}

func TestQueryTrend(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/my_orders/trend?userId=19120779W7TK6800&page=1&pageSize=3", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	var result util.PageResult
	_ = gconv.Struct(res.Data, &result)

	// fixme 字符串转指针对象问题
	//var orderStatuses []model.OrderStatus
	//err := gconv.SliceStruct(result.Rows, &orderStatuses)
	//fmt.Println(err)

}

func TestDeliver(t *testing.T) {
	orderStatus := model.OrderStatus{
		OrderId: "190830BW77HM55KP",
	}
	_ = model.DB.First(&orderStatus)
	assert.Equal(t, "190830BW77HM55KP", orderStatus.OrderId)
	assert.Equal(t, 20, orderStatus.OrderStatus)

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/my_orders/deliver?orderId=190830BW77HM55KP", nil)
	//cookie, err := req.Cookie("user")

	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	// 再次查询验证是否更新
	_ = model.DB.First(&orderStatus)
	assert.Equal(t, "190830BW77HM55KP", orderStatus.OrderId)
	assert.Equal(t, 30, orderStatus.OrderStatus)
	assert.NotEmpty(t, orderStatus.DeliverTime)

	model.DB.Model(&model.OrderStatus{}).Where(&orderStatus).Update(&model.OrderStatus{OrderStatus: 20, DeliverTime: nil})

	// fixme 字符串转指针对象问题
	//var orderStatuses []model.OrderStatus
	//err := gconv.SliceStruct(result.Rows, &orderStatuses)
	//fmt.Println(err)

}
