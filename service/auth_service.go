package service

import (
	"ChoTot/dto"
	"ChoTot/entity"
	"ChoTot/repository"
	"github.com/mashingan/smapping"
)

type AuthService interface {
	CreateUser(user dto.RegisterDTO) (*entity.User, error)
	VerifyCredential(phone string, password string) (*entity.User, error)
	IsDuplicatePhone(phone string) (bool, error)
}

type authService struct {
	userRepository repository.UserRepository
}

func NewAuthService(userRep repository.UserRepository) AuthService {
	return &authService{
		userRepository: userRep,
	}
}

func (svc *authService) CreateUser(user dto.RegisterDTO) (*entity.User, error) {
	newUser := &entity.User{}
	if err := smapping.FillStruct(newUser, smapping.MapFields(&user)); err != nil {
		return nil, err
	}
	return svc.userRepository.InsertUser(newUser)
}

func (svc *authService) VerifyCredential(phone string, password string) (*entity.User, error) {
	res, err := svc.userRepository.VerifyCredential(phone)
	if err != nil {
		return nil, err
	}
	return res, nil
}

func (svc *authService) IsDuplicatePhone(phone string) (bool, error) {
	return svc.userRepository.IsDuplicatePhone(phone)
}
