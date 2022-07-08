package controller

import (
	"ChoTot/dto"
	"ChoTot/service"
	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v4"
	"net/http"
	"strconv"
)

type UserController interface {
	Profile(c *gin.Context)
	Update(c *gin.Context)
}

type userController struct {
	userService service.UserService
	jwtService  service.JWTService
}

func NewUserController(userService service.UserService, jwtService service.JWTService) UserController {
	return &userController{
		userService: userService,
		jwtService:  jwtService,
	}
}

func (ctrl *userController) Profile(c *gin.Context) {
	userId, err := ctrl.parseToken(c)
	if err != nil {
		c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": err.Error()})
		return
	}
	user, err := ctrl.userService.UserProfile(userId)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"user": user})
}

func (ctrl *userController) Update(c *gin.Context) {
	userId, err := ctrl.parseToken(c)
	if err != nil {
		c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": err.Error()})
		return
	}
	user := dto.UserUpdateDTO{}
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	user.Id = userId
	newUser, err := ctrl.userService.Update(user)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"user": newUser})
}

func (ctrl *userController) parseToken(c *gin.Context) (int, error) {
	authHeader := c.GetHeader("Authorization")
	token, err := ctrl.jwtService.ValidateToken(authHeader)
	if err != nil {
		return -1, err
	}
	claims := token.Claims.(jwt.MapClaims)
	userId, _ := strconv.Atoi(claims["user_id"].(string))
	return userId, nil
}
