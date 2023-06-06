package config

import (
	"github.com/BurntSushi/toml"
)

type LocalLoader struct {
}

func (loader *LocalLoader) load(config Config) error {
	_, err := toml.DecodeFile("config.toml", &config)
	if err != nil {
		return err
	}
	configure = &config
	return nil
}
