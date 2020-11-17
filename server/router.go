package server

import (
	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/gin/binding"
	"go-foodie-shop/advance"
	"go-foodie-shop/api"
	c "go-foodie-shop/api/center"
	"go-foodie-shop/middleware"
	"go-foodie-shop/model"
	"gopkg.in/go-playground/validator.v8"
	"net/http"
	"os"
)

// NewRouter 路由配置
func NewRouter() *gin.Engine {
	r := gin.Default()

	//加载静态资源，一般是上传的资源，例如用户上传的图片
	r.StaticFS("/img", http.Dir("img"))

	// 中间件, 顺序不能改
	r.Use(middleware.Session(os.Getenv("SESSION_SECRET")))
	r.Use(middleware.Cors())
	r.Use(middleware.CurrentUser())

	// 增加自己的注解判断
	if v, ok := binding.Validator.Engine().(*validator.Validate); ok {
		v.RegisterCustomTypeFunc(advance.ValidateJSONDateType, model.LocalTime{})
	}
	// 路由
	v1 := r.Group("/api/v1")
	{
		passport := v1.Group("passport")
		{
			//  判断用户名是否存在
			passport.GET("usernameIsExist", api.UsernameIsExist)

			// 用户注册
			passport.POST("regist", api.UserRegister)

			// 用户登录
			passport.POST("login", api.UserLogin)
			// 用户退出
			passport.DELETE("logout", api.UserLogout)
		}

		index := v1.Group("index")
		{
			// 首页轮播图
			index.GET("carousel", api.Carousel)
			// 查询分类信息
			index.GET("cats", api.Cats)
			// 查询子分类信息
			index.GET("subCat/:rootCatId", api.SubCats)
			// 根据 分类Id 查询六个商品
			index.GET("sixNewItems/:rootCatId", api.GetSixNewItems)
		}

		item := v1.Group("items")
		{
			// 根据商品Id查询商品信息
			item.GET("info/:itemId", api.ItemInfo)
			// 查询各等级评论条数
			item.GET("commentLevel", api.CommentLevelCounts)
			// 查询评论信息
			item.GET("comments", api.QueryComments)
			// 根据关键字搜索商品
			item.GET("search", api.SearchItem)
			// 根据 分类Id 搜索商品
			item.GET("catItems", api.SearchItemByCatId)
			// 刷新购物车
			item.GET("refresh", api.QueryItemsBySpecIds)
		}

		center := v1.Group("center")
		{
			center.GET("userInfo", c.QueryUserInfo)
		}

		userInfo := v1.Group("userInfo")
		{
			userInfo.POST("update", c.UpdateUserInfo)
			userInfo.POST("uploadFace", c.UploadFace)
		}

		myComments := v1.Group("mycomment")
		{
			myComments.POST("pending", c.Pending)
			myComments.GET("query", c.QueryMyComment)
		}
		//search := v1.Group("search")

		v1.GET("ping", api.Ping)

		// 需要登录保护的
		auth := v1.Group("")
		auth.Use(middleware.AuthRequired())
		{
			// User Routing
			//auth.GET("user/me", api.UserMe)
			auth.DELETE("user/logout", api.UserLogout)
		}
	}
	return r
}
