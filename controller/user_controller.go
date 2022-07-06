package controller

import (
	"ChoTot/service"
	"github.com/gin-gonic/gin"
	"net/http"
)

type UserController interface {
	Profile(c *gin.Context)
}

type userController struct {
	userService service.UserService
}

func NewUserController(userService service.UserService) UserController {
	return &userController{userService: userService}
}

func (ctrl *userController) Profile(c *gin.Context) {
	user, err := ctrl.userService.UserProfile(1)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"user": user})
}
