package config

import (
	"github.com/BurntSushi/toml"
	"github.com/gitstliu/log4go"
)

type LocalLoader struct {
}

func (loader *LocalLoader) load(config Config) error {
	_, err := toml.DecodeFile("config.toml", &config)
	if err != nil {
		log4go.Info("Parse config.yaml fail,%v", err)
		return err
	}
	configure = &config
	return nil
}
