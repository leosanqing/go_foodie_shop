package model

type Cookie struct {
	Id              string `json:"id"`
	Username        string `json:"username"`
	Nickname        string `json:"nickname"`
	Face            string `json:"face"`
	Sex             int    `json:"sex"`
	UserUniqueToken string `json:"userUniqueToken"`
}
