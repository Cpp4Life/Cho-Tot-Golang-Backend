package repository

import (
	"ChoTot/entity"
	"gorm.io/gorm"
)

type UserRepository interface {
	UserProfile(id int) (*entity.User, error)
}

type userConnection struct {
	conn *gorm.DB
}

func NewUserRepository(conn *gorm.DB) UserRepository {
	return &userConnection{conn: conn}
}

func (db *userConnection) UserProfile(id int) (*entity.User, error) {
	user := &entity.User{}
	if err := db.conn.Where("id = ?", id).First(&user).Error; err != nil {
		return nil, err
	}
	return user, nil
}
