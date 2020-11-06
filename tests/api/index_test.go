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

func TestQueryCarousel(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/index/carousel", nil)
	//cookie, err := req.Cookie("user")
	r.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response

	json.Unmarshal([]byte(w.Body.String()), &res)
	//var carousels []model.Carousel
	carousels := res.Data.([]interface{})
	assert.Equal(t, 4, len(carousels))

}

func TestQueryCats(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/index/cats", nil)
	//cookie, err := req.Cookie("user")
	r.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response

	json.Unmarshal([]byte(w.Body.String()), &res)
	//var carousels []model.Carousel
	cats := res.Data.([]interface{})
	assert.Equal(t, 10, len(cats))

}

func TestQuerySubCats(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/index/subCat/1", nil)
	//cookie, err := req.Cookie("user")
	r.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response

	json.Unmarshal([]byte(w.Body.String()), &res)
	var categoryVOS []model.CategoryVO
	_ = gconv.SliceStruct(res.Data, &categoryVOS)

	// 比对二级分类信息
	assert.Equal(t, 2, len(categoryVOS))
	assert.Equal(t, 11, categoryVOS[0].Id)
	assert.Equal(t, "蛋糕", categoryVOS[0].Name)
	assert.Equal(t, 7, len(categoryVOS[0].SubCatList))

	assert.Equal(t, 12, categoryVOS[1].Id)
	assert.Equal(t, "点心", categoryVOS[1].Name)
	assert.Equal(t, 7, len(categoryVOS[1].SubCatList))

	// 比对三级分类
	assert.Equal(t, 38, categoryVOS[0].SubCatList[1].SubId)
	assert.Equal(t, "软面包", categoryVOS[0].SubCatList[1].SubName)
	assert.Equal(t, "3", categoryVOS[0].SubCatList[1].SubType)
	assert.Equal(t, 11, categoryVOS[0].SubCatList[1].SubFatherId)

	assert.Equal(t, 44, categoryVOS[1].SubCatList[0].SubId)
	assert.Equal(t, "肉松饼", categoryVOS[1].SubCatList[0].SubName)
	assert.Equal(t, "3", categoryVOS[1].SubCatList[0].SubType)
	assert.Equal(t, 12, categoryVOS[1].SubCatList[0].SubFatherId)
}

func TestSixNewItems(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/index/sixNewItems/1", nil)
	//cookie, err := req.Cookie("user")
	r.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response

	var sixItems []model.NewItemsVO
	json.Unmarshal([]byte(w.Body.String()), &res)
	_ = gconv.SliceStruct(res.Data, &sixItems)

	assert.Equal(t, 1, len(sixItems))
	assert.Equal(t, 6, len(sixItems[0].SimpleItemList))

	assert.Equal(t, "每一道甜品都能打开你的味蕾", sixItems[0].Slogan)
	assert.Equal(t, 1, sixItems[0].RootCatId)

	assert.Equal(t, "cake-1005", sixItems[0].SimpleItemList[0].ItemId)
	assert.Equal(t, "【天天吃货】进口美食凤梨酥", sixItems[0].SimpleItemList[0].ItemName)
	assert.Equal(t, "http://122.152.205.72:88/foodie/cake-1005/img1.png", sixItems[0].SimpleItemList[0].ItemUrl)

}