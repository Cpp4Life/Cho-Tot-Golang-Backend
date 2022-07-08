package main

import (
	"ChoTot/config"
	"ChoTot/controller"
	"ChoTot/middleware"
	"ChoTot/repository"
	"ChoTot/service"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

var (
	db *gorm.DB = config.ConnectDatabase()

	userRepo repository.UserRepository = repository.NewUserRepository(db)

	jwtService  service.JWTService  = service.NewJWTService()
	authService service.AuthService = service.NewAuthService(userRepo)
	userService service.UserService = service.NewUserService(userRepo)

	authController controller.AuthController = controller.NewAuthController(authService, jwtService)
	userController controller.UserController = controller.NewUserController(userService, jwtService)
)

func main() {
	defer config.CloseDatabase(db)
	r := gin.Default()

	authRoutes := r.Group("/cho-tot/auth")
	{
		authRoutes.POST("/login", authController.Login)
		authRoutes.POST("/register", authController.Register)
	}

	userRoutes := r.Group("/cho-tot/user", middleware.AuthorizeJWT(jwtService))
	{
		userRoutes.GET("/profile", userController.Profile)
		userRoutes.PATCH("/update", userController.Update)
	}

	r.Run(":8080")
}
