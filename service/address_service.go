package service

import (
	"errors"
	"github.com/gogf/gf/util/gconv"
	"go-foodie-shop/middleware/log"
	"go-foodie-shop/model"
	"go-foodie-shop/util"
	"go.uber.org/zap"
	"time"
)

type QueryAllAddressRequest struct {
	UserId string `form:"userId" json:"userId" binding:"required,max=30"`
}

type AddAddressRequest struct {
	AddressId string `form:"addressId" json:"addressId" binding:"max=30"`
	UserId    string `form:"userId" json:"userId" binding:"required,max=30"`
	Receiver  string `form:"receiver" json:"receiver" binding:"required,max=30"`
	Mobile    string `form:"mobile" json:"mobile" binding:"required,max=15"`
	Province  string `form:"province" json:"province" binding:"required,max=30"`
	City      string `form:"city" json:"city" binding:"required,max=30"`         // 城市
	District  string `form:"district" json:"district" binding:"required,max=30"` // 区/县
	Detail    string `form:"detail" json:"detail" binding:"required,max=64"`     // 详细住址
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

func (r *AddAddressRequest) AddNewUserAddress() error {
	var userAddressList []model.UserAddress

	queryAllAddr := QueryAllAddressRequest{UserId: r.UserId}
	allAddress, err := queryAllAddr.QueryAllAddress()
	if err != nil {
		log.ServiceLog.Error(
			"新增地址信息错误",
			zap.String("userId", r.UserId),
			zap.Error(err),
		)
		return errors.New("新增地址信息错误")
	}
	isDefault := 0
	if len(allAddress) == 0 {
		isDefault = 1
	}
	id, _ := util.NextId()
	now := model.LocalTime(time.Now())
	userAddress := model.UserAddress{
		UserId:      r.UserId,
		Id:          gconv.String(id),
		Receiver:    r.Receiver,
		Mobile:      r.Mobile,
		Province:    r.Province,
		City:        r.City,
		District:    r.District,
		Detail:      r.Detail,
		IsDefault:   isDefault,
		CreatedTime: &now,
		UpdatedTime: &now,
	}

	err = model.DB.Create(&userAddress).Error
	if err != nil {
		log.ServiceLog.Error(
			"新增地址信息错误",
			zap.Any("userAddressInfo", r),
			zap.Error(err),
		)
		return errors.New("新增地址信息错误")
	}

	log.ServiceLog.Info(
		"新增地址信息成功",
		zap.Any("addressData", userAddressList),
	)
	return nil
}
