package entity

type User struct {
	Id       int    `json:"id"`
	Username string `json:"username"`
	Password string `json:"password"`
	Address  string `json:"address"`
	Email    string `json:"email"`
	Phone    string `json:"phone"`
	Role     int    `json:"role"`
}
