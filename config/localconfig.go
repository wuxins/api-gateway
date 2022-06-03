package config

type LocalLoader struct {
}

func (loader *LocalLoader) load(config Config) error {
	configure = &Configure{}
	configure.Sysconf = config.Local.Sysconf
	configure.DB = config.Local.DB
	configure.Redis = config.Local.Redis
	configure.Routing = config.Local.Routing
	configure.Rate = config.Local.Rate
	configure.Monitor = config.Local.Monitor
	return nil
}
