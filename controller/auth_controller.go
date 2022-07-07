package controller

import (
	"ChoTot/dto"
	"ChoTot/service"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

type AuthController interface {
	Login(c *gin.Context)
	Register(c *gin.Context)
}

type authController struct {
	authService service.AuthService
	jwtService  service.JWTService
}

//NewAuthController creates a new instance of AuthController
func NewAuthController(authService service.AuthService, jwtService service.JWTService) AuthController {
	return &authController{
		authService: authService,
		jwtService:  jwtService,
	}
}

func (ctrl *authController) Login(c *gin.Context) {
	var loginDTO dto.LoginDTO
	if errDTO := c.ShouldBindJSON(&loginDTO); errDTO != nil {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": errDTO.Error()})
		return
	}
	authResult, _ := ctrl.authService.VerifyCredential(loginDTO.Phone, loginDTO.Passwd)
	if authResult == nil {
		c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Invalid Credential"})
		return
	}
	generatedToken := ctrl.jwtService.GenerateToken(strconv.FormatUint(uint64(authResult.Id), 10), authResult.Phone)
	authResult.Token = generatedToken
	c.JSON(http.StatusOK, gin.H{"response": authResult})
}

func (ctrl *authController) Register(c *gin.Context) {
	var registerDTO dto.RegisterDTO
	if errDTO := c.ShouldBindJSON(&registerDTO); errDTO != nil {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": errDTO.Error()})
		return
	}

	res, _ := ctrl.authService.IsDuplicatePhone(registerDTO.Phone)
	if res {
		c.JSON(http.StatusBadRequest, gin.H{"error": "This phone was taken"})
		return
	} else {
		newUser, _ := ctrl.authService.CreateUser(registerDTO)
		if newUser == nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Cannot create user"})
			return
		}
		token := ctrl.jwtService.GenerateToken(strconv.FormatUint(uint64(newUser.Id), 10), newUser.Phone)
		newUser.Token = token
		c.JSON(http.StatusOK, gin.H{"response": newUser})
	}
}
