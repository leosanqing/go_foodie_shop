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
// 关于路由地址的几点想法
//	1. 路由地址写法
//   	a. 有的喜欢使用公共前缀然后拼接上自己的部分路由,有的使用 全路径
//  	   比如 index := v1.Group("/api/v1/index"){ index.GET("carousel", api.QueryCarousel)}
//         比如 index := v1.Group(""){ index.GET("/api/v1/index/carousel", api.QueryCarousel)}
//		   Java 里面也有类似的，比如我们 在 Controller 的上面有时候会标注 公共路由 @RequestMapping("api/v1")
// 		b. 这两种各有优劣，第一种层次比较清晰简洁，但是不利于搜索；第二种排查问题方便，直接搜索路由就行；
// 		   我们在项目中leader 比较推荐第二种，这样团队搜索路由很方面，能很快定位。因为这边我也全部改成第二种了
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
	v1 := r.Group("")
	{
		index := v1.Group("")
		{
			// 首页轮播图
			index.GET("/api/v1/index/carousel", api.QueryCarousel)
			// 查询分类信息
			index.GET("/api/v1/index/cats", api.Cats)
			// 查询子分类信息
			index.GET("/api/v1/index/subCat/:rootCatId", api.SubCats)
			// 根据 分类Id 查询六个商品
			index.GET("/api/v1/index/sixNewItems/:rootCatId", api.GetSixNewItems)
		}

		item := v1.Group("")
		{
			// 根据商品Id查询商品信息
			item.GET("/api/v1/items/info/:itemId", api.ItemInfo)
			// 查询各等级评论条数
			item.GET("/api/v1/items/commentLevel", api.CommentLevelCounts)
			// 查询评论信息
			item.GET("/api/v1/items/comments", api.QueryComments)
			// 根据关键字搜索商品
			item.GET("/api/v1/items/search", api.SearchItem)
			// 根据 分类Id 搜索商品
			item.GET("/api/v1/items/catItems", api.SearchItemByCatId)
			// 刷新购物车
			item.GET("/api/v1/items/refresh", api.QueryItemsBySpecIds)
		}

		passport := v1.Group("")
		{
			//  判断用户名是否存在
			passport.GET("/api/v1/passport/usernameIsExist", api.UsernameIsExist)
			// 用户注册
			passport.POST("/api/v1/passport/regist", api.UserRegister)
			// 用户登录
			passport.POST("/api/v1/passport/login", api.UserLogin)
		}

		// 需要登录保护的
		auth := v1.Group("")
		auth.Use(middleware.AuthRequired())
		{
			// User Routing
			//auth.GET("user/me", api.UserMe)
			auth.DELETE("/api/v1/user/logout", api.UserLogout)

			passport2 := auth.Group("")
			{
				// 用户退出
				passport2.DELETE("/api/v1/passport/logout", api.UserLogout)
			}

			center := auth.Group("")
			{
				center.GET("/api/v1/center/userInfo", c.QueryUserInfo)
			}

			userInfo := auth.Group("")
			{
				userInfo.POST("/api/v1/userInfo/update", c.UpdateUserInfo)
				userInfo.POST("/api/v1/userInfo/uploadFace", c.UploadFace)
			}

			myComments := auth.Group("")
			{
				myComments.POST("/api/v1/mycomment/pending", c.Pending)
				myComments.GET("/api/v1/mycomment/query", c.QueryMyComment)
				myComments.POST("/api/v1/mycomment/saveList", c.SaveCommentList)
			}

			myOrders := auth.Group("")
			{
				myOrders.GET("/api/v1/my_orders/query", c.QueryMyOrders)
				myOrders.GET("/api/v1/my_orders/trend", c.QueryTrend)
				myOrders.GET("/api/v1/my_orders/status_counts", c.StatusCounts)
				myOrders.POST("/api/v1/my_orders/deliver", c.Deliver)
				myOrders.POST("/api/v1/my_orders/confirm_receive", c.ConfirmReceiver)
				myOrders.DELETE("/api/v1/my_orders/order", c.DeleteOrder)
			}

			address := auth.Group("")
			{
				address.GET("/api/v1/address/list", api.QueryAllAddress)
				address.POST("/api/v1/address/add", api.AddAddress)
			}

			shopCart := auth.Group("")
			{
				shopCart.POST("/api/v1/shop_cart/add", api.Add)
			}

			order := auth.Group("")
			{
				order.POST("/api/v1/orders/create", api.CreateOrder)
				order.GET("/api/v1/orders/paid_order_info", api.GetPaidOrderInfo)
			}
		}

		//search := v1.Group("search")

	}
	return r
}
