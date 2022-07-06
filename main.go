package main

import (
	"ChoTot/config"
	"ChoTot/controller"
	"ChoTot/repository"
	"ChoTot/service"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

var (
	db *gorm.DB = config.ConnectDatabase()

	userRepo repository.UserRepository = repository.NewUserRepository(db)

	userService service.UserService = service.NewUserService(userRepo)

	userController controller.UserController = controller.NewUserController(userService)
)

func main() {
	defer config.CloseDatabase(db)
	r := gin.Default()

	userRoutes := r.Group("/user")
	{
		userRoutes.GET("/profile", userController.Profile)
	}

	r.Run(":8080")
}
