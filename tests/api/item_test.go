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

func TestItemInfo(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/items/info/bingan-1001", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	var infoVO model.ItemInfoVO
	_ = json.Unmarshal([]byte(w.Body.String()), &res)
	_ = gconv.Struct(res.Data, &infoVO)

	assert.Equal(t, "bingan-1001", infoVO.Item.Id)
	assert.Equal(t, "【天天吃货】彩虹马卡龙 下午茶 美眉最爱", infoVO.Item.ItemName)
	assert.Equal(t, 51, infoVO.Item.CatId)
	assert.Equal(t, 2, infoVO.Item.RootCatId)

	assert.Equal(t, "bingan-1001", infoVO.ItemParam.ItemId)
	assert.Equal(t, "bingan-1001-param", infoVO.ItemParam.Id)

	itemImgList := infoVO.ItemImgList
	assert.Equal(t, 2, len(itemImgList))
	assert.Equal(t, "bingan-1001-img-1", itemImgList[0].Id)
	//
	// FIXME 转换出问题，无法转换出 SpecList 对象
	//itemSpecList := infoVO.ItemSpecList
	//assert.Equal(t, 3, len(itemSpecList))
	//assert.Equal(t, "bingan-1001-spec-1", itemSpecList[0].Id)
	//assert.Equal(t, "巧克力", itemSpecList[0].Name)

}

func TestCommentCounts(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/items/commentLevel?itemId=cake-1001&level=&page=1&pageSize=10", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	var commentLevelCountsVO model.CommentLevelCountsVO
	_ = json.Unmarshal([]byte(w.Body.String()), &res)
	_ = gconv.Struct(res.Data, &commentLevelCountsVO)

	assert.Equal(t, int64(23), commentLevelCountsVO.TotalCounts)
	assert.Equal(t, int64(14), commentLevelCountsVO.GoodCounts)
	assert.Equal(t, int64(7), commentLevelCountsVO.NormalCounts)
	assert.Equal(t, int64(2), commentLevelCountsVO.BadCounts)
}

func TestQueryComments_withoutLevel(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/items/comments?itemId=cake-1001&level=&page=1&pageSize=10", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	var pageResult util.PageResult
	_ = json.Unmarshal([]byte(w.Body.String()), &res)
	_ = gconv.Struct(res.Data, &pageResult)

	var commentsVO []model.ItemCommentVO
	_ = gconv.SliceStruct(pageResult.Rows, &commentsVO)

	assert.Equal(t, 1, pageResult.Page)
	assert.Equal(t, 3, pageResult.Total)
	assert.Equal(t, int64(23), pageResult.Records)
	assert.Equal(t, 10, len(commentsVO))
	assert.Contains(t, commentsVO[0].Nickname, "*")
	assert.Equal(t, "草莓味", commentsVO[0].SpecName)
}

func TestQueryComments_withLevel(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/items/comments?itemId=cake-1001&level=3&page=1&pageSize=10", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	var pageResult util.PageResult
	_ = json.Unmarshal([]byte(w.Body.String()), &res)
	_ = gconv.Struct(res.Data, &pageResult)

	var commentsVO []model.ItemCommentVO
	_ = gconv.SliceStruct(pageResult.Rows, &commentsVO)

	assert.Equal(t, 1, pageResult.Page)
	assert.Equal(t, 1, pageResult.Total)
	assert.Equal(t, int64(2), pageResult.Records)
	assert.Equal(t, 2, len(commentsVO))
	assert.Contains(t, commentsVO[0].Nickname, "*")
	assert.Equal(t, "香草味", commentsVO[0].SpecName)
	assert.Equal(t, "非常好吃", commentsVO[0].Content)
	for _, vo := range commentsVO {
		assert.Equal(t, model.Bad, vo.CommentLevel)
	}
}

func TestQueryItemsBySpecIds_single(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/items/refresh?itemSpecIds=bingan-1001-spec-1", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	var shopCartVOS []model.ShopCartVO
	_ = json.Unmarshal([]byte(w.Body.String()), &res)
	_ = gconv.SliceStruct(res.Data, &shopCartVOS)

	assert.Equal(t, 1, len(shopCartVOS))
	assert.Equal(t, "bingan-1001", shopCartVOS[0].ItemId)
	assert.Equal(t, "http://122.152.205.72:88/foodie/bingan-1001/img1.png", shopCartVOS[0].ItemImgUrl)
	assert.Equal(t, "【天天吃货】彩虹马卡龙 下午茶 美眉最爱", shopCartVOS[0].ItemName)
	assert.Equal(t, "bingan-1001-spec-1", shopCartVOS[0].SpecId)
	assert.Equal(t, "巧克力", shopCartVOS[0].SpecName)
	assert.Equal(t, "12000", shopCartVOS[0].PriceDiscount)
	assert.Equal(t, "15000", shopCartVOS[0].PriceNormal)
}

func TestQueryItemsBySpecIds_moreThanOne(t *testing.T) {

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/api/v1/items/refresh?itemSpecIds=bingan-1001-spec-1,bingan-1001-spec-3,bingan-1002-spec-2", nil)
	//cookie, err := req.Cookie("user")
	R.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)

	var res serializer.Response
	var shopCartVOS []model.ShopCartVO
	_ = json.Unmarshal([]byte(w.Body.String()), &res)
	_ = gconv.SliceStruct(res.Data, &shopCartVOS)

	assert.Equal(t, 3, len(shopCartVOS))
	assert.Equal(t, "bingan-1002", shopCartVOS[2].ItemId)
	assert.Equal(t, "http://122.152.205.72:88/foodie/bingan-1002/img1.png", shopCartVOS[2].ItemImgUrl)
	assert.Equal(t, "【天天吃货】男人最爱 秋葵饼干 嘎嘣脆", shopCartVOS[2].ItemName)
	assert.Equal(t, "bingan-1002-spec-2", shopCartVOS[2].SpecId)
	assert.Equal(t, "草莓水果", shopCartVOS[2].SpecName)
	assert.Equal(t, "12000", shopCartVOS[2].PriceDiscount)
	assert.Equal(t, "15000", shopCartVOS[2].PriceNormal)
}
