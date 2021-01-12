package third_part

import (
	"context"
	"fmt"
	"github.com/minio/minio-go/v7"
	"github.com/minio/minio-go/v7/pkg/credentials"
	"go-foodie-shop/middleware/log"
	"go.uber.org/zap"
	"mime/multipart"
	"os"
)

var (
	MinIOClient *minio.Client
	bucketName  string
)

func MinIO() {
	bucketName = os.Getenv("BUCKET_NAME")
	ctx := context.Background()

	// 初使化 minio client对象。
	minioClient, err := minio.New(
		os.Getenv("ENDPOINT"),
		&minio.Options{
			Creds: credentials.NewStaticV4(
				os.Getenv("ACCESS_KEY_ID"),
				os.Getenv("SECRET_ACCESS_KEY"),
				""),
			//Secure: useSSL,
		})

	if err != nil {
		panic(err)
	}

	err = minioClient.MakeBucket(ctx, bucketName, minio.MakeBucketOptions{Region: os.Getenv("LOCATION")})
	if err != nil {
		// 检查存储桶是否已经存在。
		exists, errBucketExists := minioClient.BucketExists(ctx, bucketName)
		if errBucketExists == nil && exists {
			log.ServiceLog.Info("We already own", zap.String("bucketName", bucketName))
		} else {
			log.ServiceLog.Error("MinIO 创建桶失败", zap.Error(err))
			panic(err)
		}
	} else {
		log.ServiceLog.Info("Successfully created", zap.String("bucketName", bucketName))
	}

	MinIOClient = minioClient
}

func UploadFile(filename string, ctx context.Context, file *multipart.FileHeader) (string, error) {
	src, _ := file.Open()
	_, err := MinIOClient.PutObject(
		ctx,
		bucketName,
		filename,
		src,
		file.Size,
		minio.PutObjectOptions{ContentType: "application/octet-stream"})

	if err != nil {
		log.ServiceLog.Error("MinIO 上传文件失败", zap.Error(err))
		return "", err
	}
	location, err := MinIOClient.GetBucketLocation(ctx, bucketName)

	fmt.Println(location)
	return filename, nil
}
