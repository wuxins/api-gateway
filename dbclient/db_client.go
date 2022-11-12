package dbclient

import (
	"github.com/gitstliu/log4go"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"github.com/wuxins/api-gateway/config"
	"time"
)

var db *gorm.DB

func Init(dbInfo config.DB) {

	var err error
	db, err = gorm.Open(dbInfo.DBType, dbInfo.ConnectionString)
	if err != nil {
		log4go.Error("Init db error", err)
		panic(err)
		return
	}
	db.DB().SetMaxOpenConns(dbInfo.MaxOpenConns)
	db.DB().SetMaxIdleConns(dbInfo.MaxIdleConns)
	db.DB().SetConnMaxIdleTime(time.Duration(dbInfo.ConnMaxIdleTime) * time.Millisecond)
	db.LogMode(dbInfo.LogMode)
}

func GetDB() *gorm.DB {
	return db
}
