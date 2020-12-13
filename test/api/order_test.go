package api

import (
	"encoding/json"
	"fmt"
	"github.com/gogf/gf/util/gconv"
	"github.com/stretchr/testify/assert"
	"go-foodie-shop/api"
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
	req, _ := http.NewRequest("GET", "/api/v1/my_orders/query?userId="+userId+"&orderStatus=&page=1&pageSize=3", nil)
	header := http.Header{}
	header.Add("headerUserId", userId)
	header.Add("headerUserToken", *tokenImooc)
	req.Header = header

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

func TestQueryMyOrder_shouldReturn_needToLogin(t *testing.T) {
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/my_orders/query?userId="+userId+"&orderStatus=&page=1&pageSize=3", nil)

	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, serializer.CodeCheckLogin, res.Status)
}

func TestQueryTrend(t *testing.T) {
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/my_orders/trend?userId="+userId+"&page=1&pageSize=3", nil)
	header := http.Header{}
	header.Add("headerUserId", userId)
	header.Add("headerUserToken", *tokenImooc)
	req.Header = header

	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, api.Success, res.Status)

	var result util.PageResult
	_ = gconv.Struct(res.Data, &result)

	// fixme 字符串转指针对象问题
	//var orderStatuses []model.OrderStatus
	//err := gconv.SliceStruct(result.Rows, &orderStatuses)
	//fmt.Println(err)
}

func TestQueryTrend_shouldReturn_needToLogin(t *testing.T) {
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/my_orders/trend?userId="+userId+"&page=1&pageSize=3", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, serializer.CodeCheckLogin, res.Status)
}

func TestDeliver_shouldReturn_needToLogin(t *testing.T) {
	orderId := "190830BW77HM55KP"

	orderStatus := model.OrderStatus{
		OrderId: orderId,
	}
	_ = model.DB.First(&orderStatus)
	assert.Equal(t, orderId, orderStatus.OrderId)
	assert.Equal(t, 20, orderStatus.OrderStatus)

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/my_orders/deliver?orderId="+orderId, nil)

	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)
	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, serializer.CodeCheckLogin, res.Status)
}

func TestDeliver(t *testing.T) {

	orderId := "190830BW77HM55KP"

	orderStatus := model.OrderStatus{
		OrderId: orderId,
	}
	_ = model.DB.First(&orderStatus)
	assert.Equal(t, orderId, orderStatus.OrderId)
	assert.Equal(t, 20, orderStatus.OrderStatus)

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/my_orders/deliver?orderId="+orderId, nil)
	header := http.Header{}
	header.Add("headerUserId", userId)
	header.Add("headerUserToken", *tokenImooc)
	req.Header = header

	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	// 再次查询验证是否更新
	_ = model.DB.First(&orderStatus)
	assert.Equal(t, orderId, orderStatus.OrderId)
	assert.Equal(t, 30, orderStatus.OrderStatus)
	assert.NotEmpty(t, orderStatus.DeliverTime)

	// 还原order
	model.DB.Model(&model.OrderStatus{}).Where(&orderStatus).Update(&model.OrderStatus{OrderStatus: 20, DeliverTime: nil})

	// fixme 字符串转指针对象问题
	//var orderStatuses []model.OrderStatus
	//err := gconv.SliceStruct(result.Rows, &orderStatuses)
	//fmt.Println(err)
}

type OrderStatus struct {
	OrderId     string `gorm:"primary_key;not null" json:"orderId"`
	OrderStatus int    `json:"orderStatus"`
	CreatedTime string `json:"createdTime"`
	PayTime     string `json:"payTime"`
	SuccessTime string `json:"successTime"`
	DeliverTime string `json:"deliverTime"`
	CloseTime   string `json:"closeTime"`
	CommentTime string `json:"commentTime"`
}

func TestGetPaidOrderInfo_shouldReturn_needToLogin(t *testing.T) {
	orderId := "190830BW77HM55KP"
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/orders/paid_order_info?orderId="+orderId, nil)
	//cookie, err := req.Cookie("user")

	R.ServeHTTP(w, req)
	assert.Equal(t, 200, w.Code)

	response := serializer.Response{}
	_ = json.Unmarshal(w.Body.Bytes(), &response)

	assert.Equal(t, serializer.CodeCheckLogin, response.Status)
}

func TestGetPaidOrderInfo(t *testing.T) {
	orderId := "190830BW77HM55KP"
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/orders/paid_order_info?orderId="+orderId, nil)

	header := http.Header{}
	header.Add("headerUserId", userId)
	header.Add("headerUserToken", *tokenImooc)
	req.Header = header

	R.ServeHTTP(w, req)
	assert.Equal(t, 200, w.Code)

	response := serializer.Response{}
	_ = json.Unmarshal(w.Body.Bytes(), &response)

	orderStatus := OrderStatus{}
	_ = gconv.Struct(response.Data, &orderStatus)

	assert.Equal(t, orderId, orderStatus.OrderId)
	assert.Equal(t, int(service.WaitDeliver), orderStatus.OrderStatus)
	assert.Equal(t, "2019-08-30 16:37:36", orderStatus.CreatedTime)
	assert.Equal(t, "2019-08-30 16:39:30", orderStatus.PayTime)
	//assert.Equal(t, "2020-12-01 14:11:55", orderStatus.DeliverTime)
	assert.Empty(t, orderStatus.SuccessTime)
	assert.Empty(t, orderStatus.CloseTime)
	assert.Empty(t, orderStatus.CommentTime)
}

func TestGetPaidOrderInfo_fail_byNoOrderId(t *testing.T) {
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/orders/paid_order_info?orderId=", nil)
	//cookie, err := req.Cookie("user")

	header := http.Header{}
	header.Add("headerUserId", userId)
	header.Add("headerUserToken", *tokenImooc)
	req.Header = header

	R.ServeHTTP(w, req)
	assert.Equal(t, 400, w.Code)

	response := serializer.Response{}
	_ = json.Unmarshal(w.Body.Bytes(), &response)

	assert.Equal(t, 500, response.Status)
	assert.Equal(t, "参数错误", response.Msg)
	assert.Equal(t, "Key: 'QueryPaidOrderInfoRequest.OrderId' Error:Field validation for 'OrderId' failed on the 'required' tag", response.Error)
}

func TestCreateOrder_shouldBeFail_needToLogin(t *testing.T) {
	request := service.CreateOrderRequest{
		UserId:      userIdLeosanqing,
		ItemSpecIds: "4",
		AddressId:   "1330758824650346496",
		PayMethod:   service.WxPay,
	}

	marshal, _ := json.Marshal(request)

	fmt.Println(request)
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/orders/create", NewBuffer(marshal))

	R.ServeHTTP(w, req)
	assert.Equal(t, 200, w.Code)

	response := serializer.Response{}
	_ = json.Unmarshal(w.Body.Bytes(), &response)

	assert.Equal(t, serializer.CodeCheckLogin, response.Status)
}

func TestCreateOrder_shouldBeFail_noCookie(t *testing.T) {
	request := service.CreateOrderRequest{
		UserId:      userIdLeosanqing,
		ItemSpecIds: "4",
		AddressId:   "1330758824650346496",
		PayMethod:   service.WxPay,
	}

	marshal, _ := json.Marshal(request)

	fmt.Println(request)
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/orders/create", NewBuffer(marshal))

	header := http.Header{}
	header.Add("headerUserId", userIdLeosanqing)
	header.Add("headerUserToken", *tokenLeosanqing)
	req.Header = header

	R.ServeHTTP(w, req)
	assert.Equal(t, 200, w.Code)

	response := serializer.Response{}
	_ = json.Unmarshal(w.Body.Bytes(), &response)

	assert.Equal(t, 500, response.Status)
	assert.Equal(t, "参数错误", response.Msg)
	assert.Equal(t, "获取购物车信息失败", response.Error)
}

func TestCreateOrder(t *testing.T) {
	request := service.CreateOrderRequest{
		UserId:      userIdLeosanqing,
		ItemSpecIds: "4",
		AddressId:   "1330758824650346496",
		PayMethod:   service.WxPay,
	}

	marshal, _ := json.Marshal(request)

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/orders/create", NewBuffer(marshal))

	shopCartBOS := []service.ShopCartBO{
		{
			ItemId:        "cake-1002",
			ItemImgUrl:    "http://122.152.205.72:88/foodie/cake-1002/img1.png",
			ItemName:      "【天天吃货】网红烘焙蛋糕 好吃的蛋糕",
			SpecId:        "4",
			SpecName:      "巧克力",
			BuyCounts:     3,
			PriceDiscount: 36000,
			PriceNormal:   40000,
		},
	}
	bytes, _ := json.Marshal(shopCartBOS)
	cookie := http.Cookie{
		Name:     api.ShopCart,
		Value:    string(bytes),
		MaxAge:   3 * 2000,
		Path:     "/",
		Domain:   "localhost",
		Secure:   false,
		HttpOnly: false,
	}
	// FIXME 设置cookie 会去除 '"'
	req.AddCookie(&cookie)
	c, err := req.Cookie(api.ShopCart)
	//
	fmt.Println(c)
	fmt.Println(err)
	//
	R.ServeHTTP(w, req)
	assert.Equal(t, 200, w.Code)
	//
	//response := serializer.Response{}
	//_ = json.Unmarshal(w.Body.Bytes(),&response)
	//
	//assert.Equal(t,"参数错误",response.Msg)
	//assert.Equal(t,"Key: 'QueryPaidOrderInfoRequest.OrderId' Error:Field validation for 'OrderId' failed on the 'required' tag",response.Error)
}
