# 前言

使用 Gin 重构之前的 [SpringBoot 电商项目](https://github.com/leosanqing/foodie-shop-dev)，有兴趣了解 Go语言 或者找不到好的项目的童鞋可以借鉴下

这次开发我会用 好好抓**版本管理**以及**各个文档**和**单元测试**，尽可能做到开发规范

如果你没有看过我之前的电商项目，可以从我的仓库找一下，那个项目我会进行调整的，之前做的太不规范了，但是代码还是可以看的

希望我的项目对你能有一些帮助

# 文档

本项目用到的知识或者组件部署步骤，都放在 doc 目录下

1. [Docker 安装ES](https://github.com/leosanqing/go_foodie_shop/blob/master/doc/ES%20Docker%E9%83%A8%E7%BD%B2%E5%8F%8A%E8%B0%83%E7%94%A8.md) 

2. [Docker 部署 Go 项目](https://github.com/leosanqing/go_foodie_shop/blob/master/doc/Docker%E9%83%A8%E7%BD%B2%E9%A1%B9%E7%9B%AE.md)

   

# 更新日志

1. 2021.01.10 使用 MinIO 文件管理 进行头像上传的相关管理
2. 2020.12.16 Redis 缓存 首页信息，用户token信息，部分信息
3. 2020.12.07 使用中间件判断用户登录状态，拦截需要登录的路由
4. 2020.11.25 完成基本功能实现，其他仅有组件数据库



# TODO

- Docker 部署管理项目
  - ~~redis、mysql 及项目 运行在docker上(ing....)~~
  - 之后所有组件也是用 docker 管理
- 使用 ES 完成关键词搜索功能
- 使用 MQ 完成消息队列
- 使用 ELK 完成日志搜集
- ~~MinIO 文件存储~~





# 使用到的开源组件

1. Gin 请求框架
2. Zap 日志框架
3. gorm 数据库
4. gconv 对象转换工具，Go 因为没有 继承多态，所以在类型转换方面支持不太好，但我们有时候又需要用到这样的功能

# 模块划分

模块划分没有很规范，不是按照 Go 的规范来的。已经把能改的地方改了，如果有建议尽管提，因为确实没有接手过大型 Go 项目

## api 

项目对外调用接口，相当于 controller

## cache

缓存，主要是 Redis 相关功能

## configs

配置信息

## frontend

存放前端代码的压缩包

## middleware

中间件，如跨域支持、权限，log等

## model 

数据库模型

## serializer

序列化，主要是返回给前端的相应内容进行封装，如状态码，对象等等

## server

路由地址

## service

请求真正处理的包

