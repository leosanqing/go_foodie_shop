package util

import (
	"strings"
)

const (
	size   = 6
	symbol = "*"
)

// CommonDisplay 进行脱敏处理
func CommonDisplay(value string) string {

	runes := []rune(value)
	length := len(runes)
	if length == 0 {
		value = ""
	}

	pamaone := length / 2
	pamatwo := pamaone - 1
	pamathree := length % 2

	builder := strings.Builder{}
	if length <= 2 {
		if pamathree == 1 {
			value = symbol
		}
		builder.WriteString(symbol)
		builder.WriteRune(runes[length-1])
	} else {
		if pamatwo <= 0 {
			builder.WriteRune(runes[0])
			builder.WriteString(symbol)
			builder.WriteRune(runes[length-1])
		} else if pamatwo >= size/2 && size+1 != length {
			paramfive := (length - size) / 2
			for _, r := range runes[:paramfive] {
				builder.WriteRune(r)
			}
			for i := 0; i < size; i++ {
				builder.WriteString(symbol)
			}
			for _, r := range runes[length-(paramfive+1) : length] {
				builder.WriteRune(r)
			}
		} else {
			pamafour := length - 2
			builder.WriteRune(runes[0])
			for i := 0; i < pamafour; i++ {
				builder.WriteString(symbol)
			}
			builder.WriteRune(runes[length-1])
		}
	}

	return builder.String()
}
