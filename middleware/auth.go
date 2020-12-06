package middleware

import (
	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
	"go-foodie-shop/cache"
	"go-foodie-shop/model"
	"go-foodie-shop/serializer"
)

// CurrentUser 获取登录用户
func CurrentUser() gin.HandlerFunc {
	return func(c *gin.Context) {
		session := sessions.Default(c)
		uid := session.Get("user_id")
		if uid != nil {
			user, err := model.GetUser(uid)
			if err == nil {
				c.Set("user", &user)
			}
		}
		c.Next()
	}
}

// AuthRequired 需要登录
func AuthRequired() gin.HandlerFunc {
	return func(c *gin.Context) {
		userId := c.GetHeader("headerUserId")
		token := c.GetHeader("headerUserToken")

		if "" != userId && "" != token {
			uniqueToken := cache.RedisClient.Get(cache.RedisUserToken + userId).Val()
			if "" != uniqueToken && uniqueToken == token {
				c.Next()
				return
			}
		}

		//if user, _ := c.Get("user"); user != nil {
		//	if _, ok := user.(*model.Users); ok {
		//		c.Next()
		//		return
		//	}
		//}
		c.JSON(200, serializer.CheckLogin())
		c.Abort()
	}
}
