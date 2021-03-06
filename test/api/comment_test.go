package api

import (
	"encoding/json"
	"fmt"
	"github.com/gogf/gf/util/gconv"
	"github.com/stretchr/testify/assert"
	"go-foodie-shop/cache"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	"go-foodie-shop/util"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestQueryPending(t *testing.T) {
	w := httptest.NewRecorder()

	url := fmt.Sprintf("/api/v1/mycomment/pending?userId=%s&orderId=%s", userIdLeosanqing, orderIdLeosanqing)
	req, _ := http.NewRequest("POST", url, http.NoBody)
	header := http.Header{}
	header.Add("headerUserId", userIdLeosanqing)
	header.Add("headerUserToken", *tokenLeosanqing)
	req.Header = header

	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
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

func TestQueryPending_shouldReturn_noAuth(t *testing.T) {
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("POST", "/api/v1/mycomment/pending?userId=19120779W7TK6800&orderId=191215AN25128BR4", http.NoBody)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, serializer.CodeCheckLogin, res.Status)
}

func TestQueryMyComment_shouldReturn_noAuth(t *testing.T) {

	w := httptest.NewRecorder()
	url := fmt.Sprintf("/api/v1/mycomment/query?userId=%s&page=1&pageSize=4", userId)
	req, _ := http.NewRequest("GET", url, http.NoBody)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, serializer.CodeCheckLogin, res.Status)
}

func TestQueryMyComment(t *testing.T) {

	w := httptest.NewRecorder()
	Login("imooc", "123456")
	userId := "1908017YR51G1XWH"
	token := cache.RedisClient.Get(cache.RedisUserToken + userId).Val()

	req, _ := http.NewRequest("GET", "/api/v1/mycomment/query?userId="+userId+"&page=1&pageSize=4", http.NoBody)
	header := http.Header{}
	header.Add("headerUserId", userId)
	header.Add("headerUserToken", token)
	req.Header = header

	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	var result util.PageResult
	_ = gconv.Struct(res.Data, &result)

	var myCommentVOS []model.MyCommentVO
	_ = gconv.SliceStruct(result.Rows, &myCommentVOS)

	assert.Equal(t, 7, result.Total)
	assert.Equal(t, int64(25), result.Records)
	assert.Equal(t, 1, result.Page)

	assert.Equal(t, 4, len(myCommentVOS))

	firstItem := myCommentVOS[0]
	assert.Equal(t, "190729AYHX8M55KR", firstItem.CommentId)
	assert.Equal(t, "的地位", firstItem.Content)
	assert.Equal(t, "cake-1006", firstItem.ItemId)
	assert.Equal(t, "【天天吃货】机器猫最爱 铜锣烧 最美下午茶", firstItem.ItemName)
	assert.Equal(t, "草莓味", firstItem.SpecName)
	assert.Equal(t, "http://122.152.205.72:88/foodie/cake-1006/img2.png", firstItem.ItemImg)
}

func TestSaveCommentList_shouldReturn_notLogin(t *testing.T) {
	orderItemsComments := []model.OrderItemsComment{
		{
			CommentId:    0,
			ItemId:       "cake-1001",
			ItemSpecName: "香草味",
			ItemSpecId:   "3",
			ItemName:     "【天天吃货】真香预警 超级好吃 手撕面包 儿童早餐早饭",
			CommentLevel: model.Good,
			Content:      "真好吃",
		},
	}

	w := httptest.NewRecorder()
	req, _ := http.NewRequest(
		"POST",
		"/api/v1/mycomment/saveList?userId="+userIdLeosanqing+"&orderId=191215C767GKDAFW",
		NewBufferString(gconv.String(orderItemsComments)),
	)
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)
	var res serializer.Response
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, serializer.CodeCheckLogin, res.Status)
}

func TestSaveCommentList(t *testing.T) {
	orderItemsComments := []model.OrderItemsComment{
		{
			CommentId:    0,
			ItemId:       "cake-1001",
			ItemSpecName: "香草味",
			ItemSpecId:   "3",
			ItemName:     "【天天吃货】真香预警 超级好吃 手撕面包 儿童早餐早饭",
			CommentLevel: model.Good,
			Content:      "真好吃",
		},
	}

	w := httptest.NewRecorder()
	req, _ := http.NewRequest(
		"POST",
		"/api/v1/mycomment/saveList?userId="+userIdLeosanqing+"&orderId=191215C767GKDAFW",
		NewBufferString(gconv.String(orderItemsComments)),
	)
	header := http.Header{}
	header.Add("headerUserId", userIdLeosanqing)
	header.Add("headerUserToken", *tokenLeosanqing)
	req.Header = header
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	order := model.Orders{
		Id:     "191215C767GKDAFW",
		UserId: "19120779W7TK6800",
	}
	model.DB.First(&order)
	assert.Equal(t, 1, order.IsComment)

	// 还原 orders 评论状态
	order.IsComment = 0
	err := model.DB.
		Table("orders").
		Where(&model.Orders{
			Id:     "191215C767GKDAFW",
			UserId: "19120779W7TK6800"}).
		Update("is_comment", 0).
		Error
	assert.NoError(t, err)

	err = model.DB.First(&order).Error
	fmt.Println(err)
	assert.Equal(t, 0, order.IsComment)

	// 删除评论
	err = model.DB.Where(
		&model.ItemsComments{
			UserId:  "19120779W7TK6800",
			ItemId:  "cake-1001",
			Content: "真好吃",
		}).
		Delete(model.ItemsComments{}).
		Error
	assert.NoError(t, err)
}
