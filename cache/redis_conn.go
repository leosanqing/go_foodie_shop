package cache

import (
	"github.com/go-redis/redis"
	"go-foodie-shop/middleware/log"
	"go.uber.org/zap"
	"os"
	"strconv"
)

// RedisClient Redis缓存客户端单例
var RedisClient *redis.Client

// Redis 在中间件中初始化redis链接
func Redis() {
	db, _ := strconv.ParseUint(os.Getenv("REDIS_DB"), 10, 64)
	client := redis.NewClient(&redis.Options{
		Addr:       os.Getenv("REDIS_ADDR"),
		Password:   os.Getenv("REDIS_PW"),
		DB:         int(db),
		MaxRetries: 1,
	})

	_, err := client.Ping().Result()

	if err != nil {
		log.ServiceLog.Error("连接Redis不成功", zap.Error(err))
		//util.Log().Panic("连接Redis不成功", err)
	}

	RedisClient = client
}
