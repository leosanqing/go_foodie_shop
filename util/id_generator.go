package util

import (
	"github.com/bwmarrin/snowflake"
)

func NextId() (snowflake.ID, error) {
	n, err := snowflake.NewNode(1)
	if err != nil {
		return 0, err
	}
	id := n.Generate()
	return id, nil
}
