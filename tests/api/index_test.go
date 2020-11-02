package api

import (
	"encoding/json"
	"github.com/stretchr/testify/assert"
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
