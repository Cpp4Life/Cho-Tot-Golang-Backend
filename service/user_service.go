package service

import (
	"ChoTot/dto"
	"ChoTot/entity"
	"ChoTot/repository"
	"github.com/mashingan/smapping"
)

type UserService interface {
	UserProfile(id int) (*entity.User, error)
	Update(user dto.UserUpdateDTO) (*entity.User, error)
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

func (svc *userService) Update(user dto.UserUpdateDTO) (*entity.User, error) {
	newUser := &entity.User{}
	if err := smapping.FillStruct(newUser, smapping.MapFields(&user)); err != nil {
		return nil, err
	}
	return svc.userRepo.UpdateUser(newUser)
}
