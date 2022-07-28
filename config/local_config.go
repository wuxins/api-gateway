package config

import (
	"github.com/gitstliu/log4go"
	"gopkg.in/yaml.v3"
	"io/ioutil"
)

type LocalLoader struct {
}

func (loader *LocalLoader) load(config Config) error {
	if !config.Conf.LocalLoaded {
		file, err := ioutil.ReadFile("config.yaml")
		if err != nil {
			log4go.Info("Read config.yaml fail, %v", err)
			return err
		}
		err = yaml.Unmarshal(file, &config)
		if err != nil {
			log4go.Info("Parse config.yaml fail,%v", err)
			return err
		}
	}
	configure = &Configure{}
	configure.Sysconf = config.Local.Sysconf
	configure.DB = config.Local.DB
	configure.Redis = config.Local.Redis
	configure.Routing = config.Local.Routing
	configure.Rate = config.Local.Rate
	configure.Monitor = config.Local.Monitor
	configure.Http = config.Local.Http
	configure.Https = config.Local.Https
	return nil
}
