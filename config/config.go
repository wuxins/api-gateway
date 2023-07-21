package config

import (
	"flag"
	"github.com/bytedance/sonic"
	"github.com/wuxins/api-gateway/common"
	"github.com/wuxins/api-gateway/log"
	"os"
)

var configure *Config

type Config struct {
	System *System `yaml:"System"`
	Log    *Log    `yaml:"Log"`
	Http   *Http   `yaml:"Http"`
	Proxy  *Proxy  `yaml:"Proxy"`
	DB     *DB     `yaml:"DB"`
	Redis  *Redis  `yaml:"Redis"`
	Tenant *Tenant `yaml:"Tenant"`
	CMD    *CMD    `yaml:"CMD"`
}

type Proxy struct {
	Http    *Http    `yaml:"Http"`
	Https   *Https   `yaml:"Https"`
	CORS    *CORS    `yaml:"CORS"`
	Routing *Routing `yaml:"Routing"`
	Rate    *Rate    `yaml:"Rate"`
	Monitor *Monitor `yaml:"Monitor"`
}

type System struct {
	FlushPathMapSpan int64  `yaml:"FlushPathMapSpan"`
	Env              string `yaml:"Env"`
}

type Log struct {
	Level            string `yaml:"Level"`
	Filename         string `yaml:"Filename"`
	RotateMaxSize    int    `yaml:"RotateMaxSize"`
	RotateMaxBackups int    `yaml:"RotateMaxBackups"`
	RotateMaxAge     int    `yaml:"RotateMaxAge"`
	RotateCompress   bool   `yaml:"RotateCompress"`
}

type Http struct {
	ServicePort             int   `yaml:"ServicePort"`
	ServerReadTimeout       int64 `yaml:"ServerReadTimeout"`
	ServerKeepalive         int64 `yaml:"ServerKeepalive"`
	GracefulShutdownTimeout int64 `yaml:"GracefulShutdownTimeout"`
}

type Https struct {
	ServicePort             int   `yaml:"ServicePort"`
	ServerReadTimeout       int64 `yaml:"ServerReadTimeout"`
	ServerKeepalive         int64 `yaml:"ServerKeepalive"`
	GracefulShutdownTimeout int64 `yaml:"GracefulShutdownTimeout"`
}

type CORS struct {
	AccessControlAllowOrigin  string `yaml:"AccessControlAllowOrigin"`
	AccessControlAllowMethods string `yaml:"AccessControlAllowMethods"`
	AccessControlAllowHeaders string `yaml:"AccessControlAllowHeaders"`
}

type DB struct {
	DBType           string `yaml:"DBType"`
	ConnectionString string `yaml:"ConnectionString"`
	LogMode          bool   `yaml:"LogMode"`
	MaxOpenConns     int    `yaml:"MaxOpenConns"`
	MaxIdleConns     int    `yaml:"MaxIdleConns"`
	ConnMaxIdleTime  int64  `yaml:"ConnMaxIdleTime"`
}

type Redis struct {
	Addresses           string `yaml:"Addresses"`
	Password            string `yaml:"Password"`
	DB                  int    `yaml:"DB"`
	PoolSize            int    `yaml:"PoolSize"`
	DialTimeout         int64  `yaml:"DialTimeout"`
	ReadTimeout         int64  `yaml:"ReadTimeout"`
	WriteTimeout        int64  `yaml:"WriteTimeout"`
	IdleTimeout         int64  `yaml:"IdleTimeout"`
	MinIdleConns        int    `yaml:"MinIdleConns"`
	MaxRetries          int    `yaml:"MaxRetries"`
	DetectAliveInterval int    `yaml:"DetectAliveInterval"`
}

type Routing struct {
	RequestTimeout      int64 `yaml:"RequestTimeout"`
	MaxConnsPerHost     int   `yaml:"MaxConnsPerHost"`
	MaxIdleConns        int   `yaml:"MaxIdleConns"`
	MaxIdleConnsPerHost int   `yaml:"MaxIdleConnsPerHost"`
	IdleConnTimeout     int64 `yaml:"IdleConnTimeout"`
}

type Tenant struct {
	TokenSignKey    string `yaml:"TokenSignKey"`
	TokenSignMethod string `yaml:"TokenSignMethod"`
}

type Rate struct {
	Enable               bool `yaml:"Enable"`
	LocalRateDownPercent int  `yaml:"LocalRateDownPercent"`
}

type Monitor struct {
	Filename         string `yaml:"Filename"`
	RotateMaxSize    int    `yaml:"RotateMaxSize"`
	RotateMaxBackups int    `yaml:"RotateMaxBackups"`
	RotateMaxAge     int    `yaml:"RotateMaxAge"`
	RotateCompress   bool   `yaml:"RotateCompress"`
	BodyMaxSize      int    `yaml:"BodyMaxSize"`
}

type CMD struct {
	ConfMode       string
	NacosAddress   string
	NacosNamespace string
	NacosDataid    string
	NacosGroup     string
}

// GetConfigure export configuration information
func GetConfigure() *Config {
	return configure
}

// ConfigureLoader ability define
type ConfigureLoader interface {
	load(config Config) error
}

// ConfigureLoader factory
func getConfigureLoader(mode string) ConfigureLoader {

	var loader ConfigureLoader
	if common.ConfLoadModeNacos == mode {
		loader = &NacosLoader{}
	} else {
		loader = &LocalLoader{}
	}
	return loader
}

// Initialize the configuration center based on the conf info (Conf.Mode of config.yml) .
// Currently, two modes are supported (Local、Nacos) .
// In mode "Local", config initial rely on the conf node - (Local of config.yml) .
// In mode "Nacos", config initial rely on the four factors (Address、Namespace、DataId、Group),
// and will first check the startup program arguments,then config node (Nacos of config.yml) .
// Example on program arguments startup:
// 		./api-gateway -CONFIG_MODE=nacos -NACOS_ADDRESS=127.0.0.1:8888 -NACOS_NAMESPACE=dev -NACOS_DATAID=api-gateway -NACOS_GROUP=DEFAULT_GROUP
func init() {

	cmd := parseFromCmdAndEnvs()
	config := Config{}
	config.CMD = &cmd
	err := getConfigureLoader(config.CMD.ConfMode).load(config)
	if configure.Log == nil {
		configure.Log = &Log{}
	}
	log.Init(configure.Log.Level, configure.Log.Filename, configure.Log.RotateMaxSize, configure.Log.RotateMaxBackups, configure.Log.RotateMaxAge)
	output, _ := sonic.MarshalString(&configure)
	log.Info(output)
	if err != nil {
		log.Fatal("Config Load Error", err.Error())
	}
	if len(configure.System.Env) <= 0 {
		log.Fatal("Config env can not be nil!")
	}
	log.Info("Config Load Success!")
}

func parseFromCmdAndEnvs() CMD {
	configMode := flag.String(common.ConfLoadMode, "", "config mode")
	serviceAddr := flag.String(common.NacosAddress, "", "Nacos Address")
	namespace := flag.String(common.NacosNamespace, "", "Nacos Namespace")
	dataId := flag.String(common.NacosDataid, "", "Nacos DataId")
	group := flag.String(common.NacosGroup, "", "Nacos Group")
	flag.Parse()
	cmd := CMD{}
	cmd.ConfMode = *configMode
	if len(cmd.ConfMode) <= 0 {
		cmd.ConfMode = os.Getenv(common.ConfLoadMode)
	}
	if len(cmd.ConfMode) <= 0 {
		cmd.ConfMode = common.ConfLoadModeLocal
	}
	cmd.NacosAddress = *serviceAddr
	if len(cmd.NacosAddress) <= 0 {
		envAddr := os.Getenv(common.NacosAddress)
		if len(envAddr) > 0 {
			cmd.NacosAddress = envAddr
		}
	}
	cmd.NacosNamespace = *namespace
	if len(cmd.NacosNamespace) <= 0 {
		envNamespace := os.Getenv(common.NacosNamespace)
		if len(envNamespace) > 0 {
			cmd.NacosNamespace = envNamespace
		}
	}
	cmd.NacosDataid = *dataId
	if len(cmd.NacosDataid) <= 0 {
		envDataId := os.Getenv(common.NacosDataid)
		if len(envDataId) > 0 {
			cmd.NacosDataid = envDataId
		}
	}
	cmd.NacosGroup = *group
	if len(cmd.NacosGroup) <= 0 {
		envGroup := os.Getenv(common.NacosGroup)
		if len(envGroup) > 0 {
			cmd.NacosGroup = envGroup
		}
	}
	return cmd
}
