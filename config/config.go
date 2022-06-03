package config

import (
	"github.com/bwmarrin/snowflake"
	"github.com/gitstliu/log4go"
	"github.com/wuxins/api-gateway/common"
	"gopkg.in/yaml.v3"
	"io/ioutil"
	"net/http"
	"time"
)

type Conf struct {
	Mode string `yaml:"Mode"`
	Env  string `yaml:"Env"`
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
}

type Config struct {
	Conf  *Conf  `yaml:"Conf"`
	Nacos *Nacos `yaml:"Nacos"`
	Local *Local `yaml:"Local"`
}

type Sysconf struct {
	ServicePort             int    `yaml:"ServicePort"`
	FlushPathMapSpan        int64  `yaml:"FlushPathMapSpan"`
	ServerReadTimeout       int64  `yaml:"ServerReadTimeout"`
	ServerKeepalive         int64  `yaml:"ServerKeepalive"`
	GracefulShutdownTimeout int64  `yaml:"GracefulShutdownTimeout"`
	LogConfigFile           string `yaml:"LogConfigFile"`
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
	Address             string `yaml:"Address"`
	Mode                string `yaml:"Mode"`
	Password            string `yaml:"Password"`
	DetectAliveInterval int    `yaml:"DetectAliveInterval"`
}

type Routing struct {
	RequestTimeout int64 `yaml:"RequestTimeout"`
	Transport      http.RoundTripper
}

type Rate struct {
	Enable bool   `yaml:"Enable"`
	Mode   string `yaml:"Mode"`
}

type Monitor struct {
	LogDir            string `yaml:"LogDir"`
	LogFileName       string `yaml:"LogFileName"`
	LogRotateMaxsize  int    `yaml:"LogRotateMaxsize"`
	LogRotateMaxLines int    `yaml:"LogRotateMaxLines"`
}

type Configure struct {
	Env           string   `yaml:"Env"`
	Sysconf       *Sysconf `yaml:"Sysconf"`
	DB            *DB      `yaml:"DB"`
	Routing       *Routing `yaml:"Routing"`
	Redis         *Redis   `yaml:"Redis"`
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
	if common.CONF_LOAD_MODE_NACOS == mode {
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

	file, err := ioutil.ReadFile("config.yaml")
	if err != nil {
		log4go.Info("Read config.yaml fail, %v", err)
		panic(err)
		return
	}

	var config Config
	err = yaml.Unmarshal(file, &config)
	if err != nil {
		log4go.Info("Parse config.yaml fail,%v", err)
		panic(err)
		return
	}

	log4go.Info("Config mode: %v", config.Conf.Mode)
	if err != getConfigureLoader(config.Conf.Mode).load(config) {
		log4go.Info("Config Load Error", err.Error())
		panic(err)
		return
	}

	routingReadTimeout := configure.Routing.RequestTimeout
	if routingReadTimeout > 0 {
		// MyTransport need to define static, run time init will cause connection pool leakage
		configure.Routing.Transport = &http.Transport{
			Proxy:                 http.ProxyFromEnvironment,
			ResponseHeaderTimeout: time.Duration(routingReadTimeout) * time.Millisecond,
		}
	} else {
		configure.Routing.Transport = http.DefaultTransport
	}

	if len(configure.Sysconf.LogConfigFile) <= 0 {
		configure.Sysconf.LogConfigFile = "log.xml" // default with the startup binary file int the same dir
	}
	configure.Env = config.Conf.Env
	if len(configure.Env) <= 0 {
		panic("Config env can not be nil")
	}

	log4go.Info("Config Load Success!")
}
