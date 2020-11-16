package model

import (
	"database/sql/driver"
	"fmt"
	"time"
)

const TimeFormat = "2006-01-02 15:04:05"
const DateFormat = "2006-01-02"

type LocalTime time.Time
type LocalDate time.Time

func (t *LocalTime) UnmarshalJSON(data []byte) error {
	if len(data) == 2 {
		*t = LocalTime(time.Time{})
		return nil
	}

	now, err := time.Parse(`"`+TimeFormat+`"`, string(data))
	*t = LocalTime(now)
	return err

}

func (t LocalTime) MarshalJSON() ([]byte, error) {
	b := make([]byte, 0, len(TimeFormat)+2)
	b = append(b, '"')
	b = time.Time(t).AppendFormat(b, TimeFormat)
	b = append(b, '"')
	return b, nil
}

func (t LocalTime) Value() (driver.Value, error) {
	if t.String() == "0001-01-01 00:00:00" {
		return nil, nil
	}
	return []byte(time.Time(t).Format(TimeFormat)), nil
}

func (t LocalTime) String() string {
	return time.Time(t).Format(TimeFormat)
}

func (t *LocalTime) Scan(v interface{}) error {
	tTime, _ := time.Parse("2006-01-02 15:04:05 +0800 CST", v.(time.Time).String())
	*t = LocalTime(tTime)
	return nil
}

func (t *LocalDate) UnmarshalJSON(data []byte) error {
	if len(data) == 2 {
		*t = LocalDate(time.Time{})
		return nil
	}

	now, err := time.Parse(`"`+DateFormat+`"`, string(data))
	*t = LocalDate(now)
	return err

}

func (t LocalDate) MarshalJSON() ([]byte, error) {
	b := make([]byte, 0, len(DateFormat)+2)
	b = append(b, '"')
	b = time.Time(t).AppendFormat(b, DateFormat)
	b = append(b, '"')
	return b, nil
}

func (t LocalDate) Value() (driver.Value, error) {
	if t.String() == "0001-01-01" {
		return nil, nil
	}
	return []byte(time.Time(t).Format(DateFormat)), nil
}

func (t LocalDate) String() string {
	return time.Time(t).Format(DateFormat)
}

func (t *LocalDate) Scan(v interface{}) error {
	tTime, err := time.Parse("2006-01-02 15:04:05 +0800 CST", v.(time.Time).String())
	fmt.Println(err)
	*t = LocalDate(tTime)
	return nil
}
