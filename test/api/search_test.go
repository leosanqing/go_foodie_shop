package api

import (
	"encoding/json"
	"github.com/gogf/gf/util/gconv"
	"github.com/stretchr/testify/assert"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
	"go-foodie-shop/util"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestSearchItem_sortByDefault(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/items/search?keywords=面&page=1&pageSize=5", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	var pageResult util.PageResult
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	_ = gconv.Struct(res.Data, &pageResult)

	var itemsVOS []model.SearchItemsVO
	_ = gconv.SliceStruct(pageResult.Rows, &itemsVOS)

	assert.Equal(t, 1, pageResult.Page)
	assert.Equal(t, 2, pageResult.Total)
	assert.Equal(t, int64(10), pageResult.Records)
	assert.Equal(t, 5, len(itemsVOS))

	assert.Equal(t, "【天天吃货】夹心吐司面包 全麦面包 早点早饭", itemsVOS[0].ItemName)
	assert.Equal(t, "http://122.152.205.72:88/foodie/bingan-1006/img1.png", itemsVOS[0].ImgUrl)

	for _, vo := range itemsVOS {
		assert.Contains(t, vo.ItemName, "面")
	}
}

func TestSearchItem_sortByCounts(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/items/search?keywords=面&sort=c&page=1&pageSize=4", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	var pageResult util.PageResult
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	_ = gconv.Struct(res.Data, &pageResult)

	var itemsVOS []model.SearchItemsVO
	_ = gconv.SliceStruct(pageResult.Rows, &itemsVOS)

	assert.Equal(t, 1, pageResult.Page)
	assert.Equal(t, 3, pageResult.Total)
	assert.Equal(t, int64(10), pageResult.Records)
	assert.Equal(t, 4, len(itemsVOS))

	assert.Equal(t, "超级美味海鲜帝王蟹 聚餐有面子必备", itemsVOS[0].ItemName)
	assert.Equal(t, "http://122.152.205.72:88/foodie/seafood-133/img1.png", itemsVOS[0].ImgUrl)

	for _, vo := range itemsVOS {
		assert.Contains(t, vo.ItemName, "面")
		assert.GreaterOrEqual(t, itemsVOS[0].SellCounts, vo.SellCounts)
	}
}

func TestSearchItem_sortByPrice(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/items/search?keywords=面&sort=p&page=1&pageSize=3", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	var pageResult util.PageResult
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	_ = gconv.Struct(res.Data, &pageResult)

	var itemsVOS []model.SearchItemsVO
	_ = gconv.SliceStruct(pageResult.Rows, &itemsVOS)

	assert.Equal(t, 1, pageResult.Page)
	assert.Equal(t, 4, pageResult.Total)
	assert.Equal(t, int64(10), pageResult.Records)
	assert.Equal(t, 3, len(itemsVOS))

	assert.Equal(t, "好吃蛋糕甜点软面包", itemsVOS[0].ItemName)
	assert.Equal(t, "http://122.152.205.72:88/foodie/cake-38/img1.png", itemsVOS[0].ImgUrl)

	for _, vo := range itemsVOS {
		assert.Contains(t, vo.ItemName, "面")
		assert.GreaterOrEqual(t, vo.Price, itemsVOS[0].Price)
	}
}

func TestSearchItem_byCatId_sortByDefault(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/items/catItems?catId=37&page=1&pageSize=5", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	var pageResult util.PageResult
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	_ = gconv.Struct(res.Data, &pageResult)

	var itemsVOS []model.SearchItemsVO
	_ = gconv.SliceStruct(pageResult.Rows, &itemsVOS)

	assert.Equal(t, 1, pageResult.Page)
	assert.Equal(t, 2, pageResult.Total)
	assert.Equal(t, int64(7), pageResult.Records)
	assert.Equal(t, 5, len(itemsVOS))

	assert.Equal(t, "【天天吃货】机器猫最爱 铜锣烧 最美下午茶", itemsVOS[0].ItemName)
	assert.Equal(t, "http://122.152.205.72:88/foodie/cake-1006/img2.png", itemsVOS[0].ImgUrl)

}

func TestSearchItem_byCatId_sortByCounts(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/items/catItems?catId=37&sort=c&page=1&pageSize=3", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	var pageResult util.PageResult
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	_ = gconv.Struct(res.Data, &pageResult)

	var itemsVOS []model.SearchItemsVO
	_ = gconv.SliceStruct(pageResult.Rows, &itemsVOS)

	assert.Equal(t, 1, pageResult.Page)
	assert.Equal(t, 3, pageResult.Total)
	assert.Equal(t, int64(7), pageResult.Records)
	assert.Equal(t, 3, len(itemsVOS))

	assert.Equal(t, "好吃蛋糕甜点蒸蛋糕", itemsVOS[0].ItemName)
	assert.Equal(t, "http://122.152.205.72:88/foodie/cake-37/img1.png", itemsVOS[0].ImgUrl)

	for _, vo := range itemsVOS {
		assert.GreaterOrEqual(t, itemsVOS[0].SellCounts, vo.SellCounts)
	}
}

func TestSearchItem_byCatId_sortByPrice(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/items/catItems?catId=37&sort=p&page=1&pageSize=7", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	var pageResult util.PageResult
	_ = json.Unmarshal(w.Body.Bytes(), &res)
	_ = gconv.Struct(res.Data, &pageResult)

	var itemsVOS []model.SearchItemsVO
	_ = gconv.SliceStruct(pageResult.Rows, &itemsVOS)

	assert.Equal(t, 1, pageResult.Page)
	assert.Equal(t, 1, pageResult.Total)
	assert.Equal(t, int64(7), pageResult.Records)
	assert.Equal(t, 7, len(itemsVOS))

	assert.Equal(t, "好吃蛋糕甜点蒸蛋糕", itemsVOS[0].ItemName)
	assert.Equal(t, "http://122.152.205.72:88/foodie/cake-37/img1.png", itemsVOS[0].ImgUrl)

	for _, vo := range itemsVOS {
		assert.GreaterOrEqual(t, vo.Price, itemsVOS[0].Price)
	}
}
