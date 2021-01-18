package third_part

import (
	"github.com/olivere/elastic/v7"
	"log"
	"os"
)

var ESClient *elastic.Client

func NewEsClient() {
	client, err := elastic.NewClient(
		//elastic 服务地址
		elastic.SetURL(os.Getenv("ES_ADDR")),
		// 允许指定弹性是否应该定期检查集群（默认为true）
		elastic.SetSniff(false),
		// 设置错误日志输出
		elastic.SetErrorLog(log.New(os.Stderr, "ELASTIC ", log.LstdFlags)),
		// 设置info日志输出
		elastic.SetInfoLog(log.New(os.Stdout, "", log.LstdFlags)))
	if err != nil {
		log.Fatalln("Failed to create elastic client")
	}
	ESClient = client
}
