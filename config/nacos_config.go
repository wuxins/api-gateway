package config

import (
	"github.com/BurntSushi/toml"
	"github.com/nacos-group/nacos-sdk-go/clients"
	"github.com/nacos-group/nacos-sdk-go/clients/config_client"
	"github.com/nacos-group/nacos-sdk-go/common/constant"
	"github.com/nacos-group/nacos-sdk-go/vo"
	"strconv"
	"strings"
)

var client config_client.IConfigClient

type NacosLoader struct {
}

func (loader *NacosLoader) load(config Config) error {

	err := initConfigClient(config.CMD.NacosAddress, config.CMD.NacosNamespace)
	if err != nil {
		return err
	}
	var content string
	content, err = client.GetConfig(vo.ConfigParam{
		DataId: config.CMD.NacosDataid,
		Group:  config.CMD.NacosGroup,
	})
	if err != nil {
		return err
	}
	_, err = toml.Decode(content, &config)
	if err != nil {
		return err
	}

	configure = &config
	return err
}

func initConfigClient(serviceAddr string, namespace string) error {

	splitAddr := strings.Split(serviceAddr, ":")

	ip := splitAddr[0]
	port, _ := strconv.ParseUint(splitAddr[1], 10, 64)
	sc := []constant.ServerConfig{
		*constant.NewServerConfig(
			ip,
			port,
			constant.WithScheme("http"),
			constant.WithContextPath("/nacos")),
	}

	cc := *constant.NewClientConfig(
		constant.WithNamespaceId(namespace),
		constant.WithTimeoutMs(5000),
		constant.WithNotLoadCacheAtStart(true),
		constant.WithLogDir("/tmp/nacos/log"),
		constant.WithCacheDir("/tmp/nacos/cache"),
		constant.WithLogLevel("debug"),
	)

	var err error
	client, err = clients.NewConfigClient(
		vo.NacosClientParam{
			ClientConfig:  &cc,
			ServerConfigs: sc,
		},
	)
	return err
}
