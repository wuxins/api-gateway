package config

import (
	"flag"
	"github.com/nacos-group/nacos-sdk-go/clients"
	"github.com/nacos-group/nacos-sdk-go/clients/config_client"
	"github.com/nacos-group/nacos-sdk-go/common/constant"
	"github.com/nacos-group/nacos-sdk-go/vo"
	"github.com/wuxins/api-gateway/common"
	"gopkg.in/yaml.v3"
	"os"
	"strconv"
	"strings"
)

var client config_client.IConfigClient

type NacosLoader struct {
}

func (loader *NacosLoader) load(config Config) error {

	serviceAddr := flag.String(common.NACOS_ADDRESS, "", "Nacos Address")
	namespace := flag.String(common.NACOS_NAMESPACE, "", "Nacos Namespace")
	dataId := flag.String(common.NACOS_DATAID, "", "Nacos DataId")
	group := flag.String(common.NACOS_GROUP, "", "Nacos Group")
	flag.Parse()

	if len(*serviceAddr) > 0 {
		config.Nacos.Address = *serviceAddr
	} else {
		envAddr := os.Getenv(common.NACOS_ADDRESS)
		if len(envAddr) > 0 {
			config.Nacos.Address = envAddr
		}
	}

	if len(*namespace) > 0 {
		config.Nacos.Namespace = *namespace
	} else {
		envNamespace := os.Getenv(common.NACOS_NAMESPACE)
		if len(envNamespace) > 0 {
			config.Nacos.Namespace = envNamespace
		}
	}

	if len(*dataId) > 0 {
		config.Nacos.DataId = *dataId
	} else {
		envDataId := os.Getenv(common.NACOS_DATAID)
		if len(envDataId) > 0 {
			config.Nacos.DataId = envDataId
		}
	}

	if len(*group) > 0 {
		config.Nacos.Group = *group
	} else {
		envGroup := os.Getenv(common.NACOS_GROUP)
		if len(envGroup) > 0 {
			config.Nacos.Group = envGroup
		}
	}

	err := initConfigClient(config.Nacos.Address, config.Nacos.Namespace)
	if err != nil {
		return err
	}

	var content string
	content, err = client.GetConfig(vo.ConfigParam{
		DataId: config.Nacos.DataId,
		Group:  config.Nacos.Group,
	})
	if err != nil {
		return err
	}

	err = yaml.Unmarshal([]byte(content), &configure)
	if err != nil {
		return err
	}
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
