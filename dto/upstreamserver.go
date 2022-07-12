package dto

type UpstreamServer struct {
	ApiCode string `gorm:"api_code"`
	Host    string `gorm:"host"`
	Weight  int    `gorm:"weight"`
	Region  string `gorm:"region"`
}
