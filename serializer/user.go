package serializer

// Users 用户序列化器

type Users struct {
	//gorm.Model
	Id         string `json:"id"`
	Username   string `json:"username"`
	Nickname   string `json:"nickname"`
	Realname   string `json:"realname"`
	Face       string `json:"face"`
	Mobile     string `json:"mobile"`
	Email      string `json:"email"`
	Sex        int    `json:"sex"`
	Birthday   int64  `json:"birthday"`
	CreateTime int64  `json:"createTime"`
	UpdateTime int64  `json:"updateTime"`
}

//// BuildUser 序列化用户
//func BuildUser(user model.Users) Users {
//	return Users{
//		Id:       user.Id,
//		Username: user.Username,
//		Nickname: user.Nickname,
//		Face:     user.Face,
//		Mobile:   user.Mobile,
//		Sex:      user.Sex,
//	}
//}
//
//// BuildUserResponse 序列化用户响应
//func BuildUserResponse(user model.Users) Response {
//	return Response{
//		Status: 200,
//		Data:   BuildUser(user),
//	}
//}
