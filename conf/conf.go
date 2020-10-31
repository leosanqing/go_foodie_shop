package conf

import (

	"github.com/joho/godotenv"
	"go-foodie-shop/cache"
	"go-foodie-shop/model"
	"go-foodie-shop/util"
	"os"
)

// Init 初始化配置项
func Init() {
	// 从本地读取环境变量
	if err := godotenv.Load(); err != nil {
		util.Log().Panic("读取环境变量失败", err)
	}
	// 设置日志级别
	util.BuildLogger(os.Getenv("LOG_LEVEL"))

	// 读取翻译文件
	if err := LoadLocales("conf/locales/zh-cn.yaml"); err != nil {
		util.Log().Panic("翻译文件加载失败", err)
	}

	// 连接数据库
	model.Database(os.Getenv("MYSQL_DSN"))
	cache.Redis()
}
