package model

type Category struct {
	Id       int    `gorm:"primary_key;not null;autoIncrement" json:"id"`
	Name     string `gorm:"not null" json:"name"`
	Type     int    `gorm:"not null" json:"type"`
	FatherId int    `gorm:"not null" json:"fatherId"`
	Logo     string `json:"logo"`
	Slogan   string `json:"slogan"`
	CatImage string `json:"catImage"`
	BgColor  string `json:"bgColor"`
}

type CategoryVO struct {
	Id         int             `json:"id"`
	Name       string          `json:"name"`
	Type       string          `json:"type"`
	FatherId   int             `json:"fatherId"`
	SubCatList []SubCategoryVO `json:"subCatList"`
}

type SubCategoryVO struct {
	SubId       int    `json:"subId"`
	SubName     string `json:"subName"`
	SubType     string `json:"subType"`
	SubFatherId int    `json:"subFatherId"`
}

type SubCategory struct {
	Id          int    `json:"id"`
	Name        string `json:"name"`
	Type        string `json:"type"`
	FatherId    int    `json:"fatherId"`
	SubId       int    `json:"subId"`
	SubName     string `json:"subName"`
	SubType     string `json:"subType"`
	SubFatherId int    `json:"subFatherId"`
}

type NewItems struct {
	RootCatId   int    `json:"rootCatId"`
	RootCatName string `json:"rootCatName"`
	Slogan      string `json:"slogan"`
	CatImage    string `json:"catImage"`
	BgColor     string `json:"bgColor"`

	ItemId   string `json:"itemId"`
	ItemName string `json:"itemName"`
	ItemUrl  string `json:"itemUrl"`
}

type NewItemsVO struct {
	RootCatId      int            `json:"rootCatId"`
	RootCatName    string         `json:"rootCatName"`
	Slogan         string         `json:"slogan"`
	CatImage       string         `json:"catImage"`
	BgColor        string         `json:"bgColor"`
	SimpleItemList []SimpleItemVO `json:"simpleItemList"`
}

type SimpleItemVO struct {
	ItemId   string `json:"itemId"`
	ItemName string `json:"itemName"`
	ItemUrl  string `json:"itemUrl"`
}
