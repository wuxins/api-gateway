package config

import (
	"flag"
	"github.com/bwmarrin/snowflake"
	"github.com/gitstliu/log4go"
	"github.com/wuxins/api-gateway/common"
	"gopkg.in/yaml.v3"
	"io/ioutil"
	"os"
)

type Conf struct {
	Mode        string `yaml:"Mode"`
	LocalLoaded bool
}

type Nacos struct {
	Address   string `yaml:"Address"`
	Namespace string `yaml:"Namespace"`
	DataId    string `yaml:"DataId"`
	Group     string `yaml:"Group"`
}

type Local struct {
	Sysconf *Sysconf `yaml:"Sysconf"`
	DB      *DB      `yaml:"DB"`
	Routing *Routing `yaml:"Routing"`
	Redis   *Redis   `yaml:"Redis"`
	Rate    *Rate    `yaml:"Rate"`
	Monitor *Monitor `yaml:"Monitor"`
	Http    *Http    `yaml:"Http"`
	Https   *Https   `yaml:"Https"`
}

type Config struct {
	Conf  *Conf  `yaml:"Conf"`
	Nacos *Nacos `yaml:"Nacos"`
	Local *Local `yaml:"Local"`
}

type Sysconf struct {
	FlushPathMapSpan int64  `yaml:"FlushPathMapSpan"`
	LogConfigFile    string `yaml:"LogConfigFile"`
	Env              string `yaml:"Env"`
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

type Rate struct {
	Enable               bool `yaml:"Enable"`
	LocalRateDownPercent int  `yaml:"LocalRateDownPercent"`
}

type Monitor struct {
	LogDir            string `yaml:"LogDir"`
	LogFileName       string `yaml:"LogFileName"`
	LogRotateMaxsize  int    `yaml:"LogRotateMaxsize"`
	LogRotateMaxLines int    `yaml:"LogRotateMaxLines"`
}

type Configure struct {
	Sysconf       *Sysconf `yaml:"Sysconf"`
	DB            *DB      `yaml:"DB"`
	Routing       *Routing `yaml:"Routing"`
	Redis         *Redis   `yaml:"Redis"`
	Http          *Http    `yaml:"Http"`
	Https         *Https   `yaml:"Https"`
	Rate          *Rate    `yaml:"Rate"`
	Monitor       *Monitor `yaml:"Monitor"`
	SnowflakeNode *snowflake.Node
}

var configure *Configure

// GetConfigure export configuration information
func GetConfigure() *Configure {
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
// Example on program arguments startup: -NACOSADDRESS=127.0.0.1:8888 -NAMESPACE=dev -DATAID=testDataId -GROUP=DEFAULT_GROUP
func init() {

	configMode := flag.String(common.ConfLoadMode, "", "config mode")
	flag.Parse()

	config := Config{}
	config.Nacos = &Nacos{}
	config.Conf = &Conf{}
	config.Local = &Local{}
	if len(*configMode) <= 0 {
		*configMode = os.Getenv(common.ConfLoadMode)
	}
	if len(*configMode) > 0 {
		config.Conf.Mode = *configMode
	} else {
		file, err := ioutil.ReadFile("config.yaml")
		if err != nil {
			log4go.Info("Read config.yaml fail, %v", err)
			panic(err)
			return
		}
		err = yaml.Unmarshal(file, &config)
		if err != nil {
			log4go.Info("Parse config.yaml fail,%v", err)
			panic(err)
			return
		}
		config.Conf.LocalLoaded = true
	}

	log4go.Info("Config mode: %v", config.Conf.Mode)
	if len(config.Conf.Mode) <= 0 {
		panic("Config mode can not be nil")
		return
	}
	err := getConfigureLoader(config.Conf.Mode).load(config)
	if err != nil {
		log4go.Info("Config Load Error", err.Error())
		panic(err)
		return
	}

	if len(configure.Sysconf.LogConfigFile) <= 0 {
		configure.Sysconf.LogConfigFile = "log.xml" // default with the startup binary file int the same dir
	}
	if len(configure.Sysconf.Env) <= 0 {
		panic("Config env can not be nil")
		return
	}

	log4go.Info("Config Load Success!")
}
