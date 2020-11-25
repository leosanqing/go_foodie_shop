package main

import (
	"go-foodie-shop/configs"
	"go-foodie-shop/server"
)

func main() {
	// 从配置文件读取配置
	configs.Init()

	// 装载路由
	r := server.NewRouter()
	r.Run(":8088")
}
