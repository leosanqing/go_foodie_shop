package server

import (
	"github.com/gin-gonic/gin"
	"go-foodie-shop/api"
	"go-foodie-shop/middleware"
	"os"
)

// NewRouter 路由配置
func NewRouter() *gin.Engine {
	r := gin.Default()

	// 中间件, 顺序不能改
	r.Use(middleware.Session(os.Getenv("SESSION_SECRET")))
	r.Use(middleware.Cors())
	r.Use(middleware.CurrentUser())

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
			index.GET("carousel", api.Carousel)
			index.GET("cats", api.Cats)
			index.GET("subCat/:rootCatId", api.SubCats)
			index.GET("sixNewItems/:rootCatId", api.GetSixNewItems)
		}

		item := v1.Group("items")
		{
			item.GET("info/:itemId", api.ItemInfo)
			item.GET("commentLevel", api.CommentLevelCounts)
			item.GET("comments", api.QueryComments)
		}

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
