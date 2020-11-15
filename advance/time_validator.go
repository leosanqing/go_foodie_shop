package advance

import (
	"go-foodie-shop/model"
	"reflect"
)

func ValidateJSONDateType(field reflect.Value) interface{} {
	if field.Type() == reflect.TypeOf(model.LocalTime{}) {
		timeStr := field.Interface().(model.LocalTime).String()
		if timeStr == "0001-01-01 00:00:00" {
			return nil
		}
		return timeStr
	}

	if field.Type() == reflect.TypeOf(model.LocalDate{}) {
		timeStr := field.Interface().(model.LocalDate).String()
		if timeStr == "0001-01-01" {
			return nil
		}
		return timeStr
	}
	return nil
}
