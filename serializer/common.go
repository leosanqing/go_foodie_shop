package serializer

import "github.com/gin-gonic/gin"

// Response 基础序列化器
type Response struct {
	Status int         `json:"status"`
	Data   interface{} `json:"data,omitempty"`
	Msg    string      `json:"msg"`
	Error  string      `json:"error,omitempty"`
}

// TrackedErrorResponse 有追踪信息的错误响应
type TrackedErrorResponse struct {
	Response
	TrackID string `json:"track_id"`
}

// 三位数错误编码为复用http原本含义
// 五位数错误编码为应用自定义错误
// 五开头的五位数错误编码为服务器端错误，比如数据库操作失败
// 四开头的五位数错误编码为客户端错误，有时候是客户端代码写错了，有时候是用户操作错误
const (
	// CodeCheckLogin 未登录
	CodeCheckLogin = 401
	// CodeNoRightErr 未授权访问
	CodeNoRightErr = 403

	//CodeParamErr 各种奇奇怪怪的参数错误
	CodeParamErr = 500
)

const (
	UsernameExist = 40002
)

const (
	CodeDBError      = 50001 + iota // CodeDBError 数据库操作失败
	CodeEncryptError                // CodeEncryptError 加密失败
	JsonConvertError                // JsonConvertError json 转换异常
	GenerateIdFailed                // GenerateIdFailed 生成Id异常

)

// CheckLogin 检查登录
func CheckLogin() Response {
	return Response{
		Status: CodeCheckLogin,
		Msg:    "未登录",
	}
}

// Err 通用错误处理
func Err(errCode int, msg string, err error) Response {
	res := Response{
		Status: errCode,
		Msg:    msg,
	}
	// 生产环境隐藏底层报错
	if err != nil && gin.Mode() != gin.ReleaseMode {
		res.Error = err.Error()
	}
	return res
}

// DBErr 数据库操作失败
func DBErr(msg string, err error) Response {
	if msg == "" {
		msg = "数据库操作失败"
	}
	return Err(CodeDBError, msg, err)
}

// ParamErr 各种参数错误
func ParamErr(msg string, err error) Response {
	if msg == "" {
		msg = "参数错误"
	}
	return Err(CodeParamErr, msg, err)
}

// JsonConvertErr JSON 转换错误
func JsonConvertErr(err error) Response {
	return Err(JsonConvertError, "Json 转换异常", err)
}
