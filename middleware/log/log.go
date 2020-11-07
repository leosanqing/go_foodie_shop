package log

import (
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

var ServiceLog *zap.Logger
var GatewayLogger *zap.Logger

func init() {

	ServiceLog = NewLogger("./logs/service.log", zapcore.InfoLevel, 128, 30, 7, true, "service")
	//ErrorLog = NewLogger("./logs/error.log", zapcore.ErrorLevel, 128, 30, 7, true, "error")
	GatewayLogger = NewLogger("./logs/gateway.log", zapcore.DebugLevel, 128, 30, 7, true, "Gateway")
}
