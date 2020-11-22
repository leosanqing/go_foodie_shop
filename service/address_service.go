package service

import (
	"errors"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/model"
	"go.uber.org/zap"
)

type QueryAllAddressRequest struct {
	UserId string `form:"userId" json:"userId" binding:"required,max=30"`
}

func (r *QueryAllAddressRequest) QueryAllAddress() ([]model.UserAddress, error) {
	var userAddressList []model.UserAddress
	err := model.DB.
		Where("user_id =?", r.UserId).
		Find(&userAddressList).
		Error

	if err != nil {
		log.ServiceLog.Error(
			"查询地址信息错误",
			zap.String("userId", r.UserId),
			zap.Error(err),
		)
		return nil, errors.New("查询地址信息错误")
	}

	log.ServiceLog.Info(
		"查询地址信息成功",
		zap.String("userId", r.UserId),
		zap.Any("addressData", userAddressList),
	)
	return userAddressList, err

}
