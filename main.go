package main

import (
	"ChoTot/config"
	"gorm.io/gorm"
)

var (
	db *gorm.DB = config.ConnectDatabase()
)

func main() {
	defer config.CloseDatabase(db)
}
