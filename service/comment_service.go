package service

import "go-foodie-shop/model"

type CommentService struct {
	ItemId   string `form:"itemId" json:"itemId" binding:"required,max=30"`
	Level    int    `form:"level" json:"level" `
	Page     int    `form:"page" json:"page" `
	PageSize int    `form:"pageSize" json:"pageSize" `
}

func (service *CommentService) GetCommentsCount() (model.CommentLevelCountsVO, error) {
	var commentVO model.CommentLevelCountsVO
	var itemComment model.ItemsComments
	itemId := service.ItemId

	goodCounts, err := itemComment.GetCommentCounts(itemId, model.Good)
	if err != nil {
		return commentVO, err
	}
	commentVO.GoodCounts = goodCounts

	normalCounts, err := itemComment.GetCommentCounts(itemId, model.Normal)
	if err != nil {
		return commentVO, err
	}
	commentVO.NormalCounts = normalCounts

	badCounts, err := itemComment.GetCommentCounts(itemId, model.Bad)
	if err != nil {
		return commentVO, err
	}
	commentVO.BadCounts = badCounts
	commentVO.TotalCounts = goodCounts + badCounts + normalCounts

	return commentVO, nil
}
