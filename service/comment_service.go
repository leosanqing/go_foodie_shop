package service

import (
	"go-foodie-shop/model"
	"go-foodie-shop/util"
)

type CommentService struct {
	ItemId string             `form:"itemId" json:"itemId" binding:"required,max=30"`
	Level  model.CommentLevel `form:"level" json:"level" `
	model.Page
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

func (service *CommentService) QueryComment() ([]model.ItemCommentVO, int64, error) {

	var commentVO []model.ItemCommentVO
	Db := model.DB.
		Table("items_comments ic").
		Select("ic.comment_level as comment_level,\n"+
			"ic.content as content,\n"+
			"ic.spec_name as spec_name,\n"+
			"ic.created_time as created_time,\n"+
			"u.face as user_face,\n"+
			"u.nickname as nickname").
		Joins("LEFT JOIN users u ON ic.user_id = u.id").
		Where("ic.item_id = ?", service.ItemId)
	if service.Level != 0 {
		Db = Db.Where("ic.comment_level = ? ", service.Level)
	}

	var count int64
	if err := Db.Count(&count).Error; err != nil {
		return nil, 0, err
	}

	err := Db.Scopes(util.Paginate(service.Page.Page, service.PageSize)).
		Find(&commentVO).
		Error
	return commentVO, count, err
	//return model.QueryComment(service.ItemId, service.Level)
}
