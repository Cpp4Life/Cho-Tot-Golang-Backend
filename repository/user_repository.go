package repository

import (
	"ChoTot/entity"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

type UserRepository interface {
	UserProfile(id int) (*entity.User, error)
	VerifyCredential(phone string) (*entity.User, error)
	IsDuplicatePhone(phone string) (bool, error)
	InsertUser(user *entity.User) (*entity.User, error)
	UpdateUser(user *entity.User) (*entity.User, error)
	UserProducts(id int) ([]entity.Product, error)
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

func (db *userConnection) VerifyCredential(phone string) (*entity.User, error) {
	user := &entity.User{}
	if err := db.conn.Where("phone = ?", phone).First(&user).Error; err != nil {
		return nil, err
	}
	return user, nil
}

func (db *userConnection) IsDuplicatePhone(phone string) (bool, error) {
	user := &entity.User{}
	if err := db.conn.Where("phone = ?", phone).First(&user).Error; err != nil {
		return false, err
	}
	if user.Phone == "" {
		return false, nil
	}
	return true, nil
}

func (db *userConnection) InsertUser(user *entity.User) (*entity.User, error) {
	user.Passwd = hashAndSalt([]byte(user.Passwd))
	if err := db.conn.Create(&user).Error; err != nil {
		return nil, err
	}
	return user, nil
}

func (db *userConnection) UpdateUser(user *entity.User) (*entity.User, error) {
	if err := db.conn.Model(&entity.User{}).Where("id = ?", user.Id).Updates(map[string]interface{}{"address": user.Address, "username": user.Username, "email": user.Email}).Error; err != nil {
		return nil, err
	}
	return user, nil
}

func (db *userConnection) UserProducts(id int) ([]entity.Product, error) {
	var products []entity.Product
	if err := db.conn.Model(&entity.Product{}).Where("user_id = ?", id).Find(&products).Error; err != nil {
		return nil, err
	}
	return products, nil
}

func hashAndSalt(passwd []byte) string {
	hash, err := bcrypt.GenerateFromPassword(passwd, bcrypt.DefaultCost)
	if err != nil {
		panic(err.Error())
	}
	return string(hash)
}
