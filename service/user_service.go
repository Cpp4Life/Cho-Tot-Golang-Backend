package service

import (
	"ChoTot/entity"
	"ChoTot/repository"
)

type UserService interface {
	UserProfile(id int) (*entity.User, error)
}

type userService struct {
	userRepo repository.UserRepository
}

func NewUserService(userRepo repository.UserRepository) UserService {
	return &userService{userRepo: userRepo}
}

func (svc *userService) UserProfile(id int) (*entity.User, error) {
	return svc.userRepo.UserProfile(id)
}
