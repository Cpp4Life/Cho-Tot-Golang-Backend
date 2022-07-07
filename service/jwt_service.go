package service

import (
	"fmt"
	"github.com/golang-jwt/jwt/v4"
	"github.com/joho/godotenv"
	"os"
	"time"
)

type JWTService interface {
	GenerateToken(userID string, phone string) string
	ValidateToken(token string) (*jwt.Token, error)
}

type jwtCustomClaim struct {
	UserID string `json:"user_id"`
	Phone  string `json:"phone"`
	jwt.StandardClaims
}

type jwtService struct {
	secretKey string
	issuer    string
}

func NewJWTService() JWTService {
	return &jwtService{
		issuer:    "ChoTot",
		secretKey: getSecretKey(),
	}
}

func getSecretKey() string {
	if err := godotenv.Load(".env"); err != nil {
		panic("Error loading .env file")
	}

	secretKey := os.Getenv("JWT_SECRET")
	if secretKey != "" {
		secretKey = "ChoTotKey"
	}
	return secretKey
}

func (j *jwtService) GenerateToken(userId string, phone string) string {
	claims := &jwtCustomClaim{
		userId,
		phone,
		jwt.StandardClaims{
			ExpiresAt: time.Now().AddDate(0, 0, 1).Unix(),
			Issuer:    j.issuer,
			IssuedAt:  time.Now().Unix(),
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS384, claims)
	t, err := token.SignedString([]byte(j.secretKey))
	if err != nil {
		panic(err)
	}
	return t
}

func (j *jwtService) ValidateToken(token string) (*jwt.Token, error) {
	return jwt.Parse(token, func(t_ *jwt.Token) (interface{}, error) {
		if _, ok := t_.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("Unexpected signing method %v", t_.Header["alg"])
		}
		return []byte(j.secretKey), nil
	})
}
