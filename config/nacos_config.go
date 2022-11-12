package config

import (
	"flag"
	"github.com/BurntSushi/toml"
	"github.com/nacos-group/nacos-sdk-go/clients"
	"github.com/nacos-group/nacos-sdk-go/clients/config_client"
	"github.com/nacos-group/nacos-sdk-go/common/constant"
	"github.com/nacos-group/nacos-sdk-go/vo"
	"github.com/wuxins/api-gateway/common"
	"os"
	"strconv"
	"strings"
)

var client config_client.IConfigClient

type NacosLoader struct {
}

func (loader *NacosLoader) load(config Config) error {

	serviceAddr := flag.String(common.NacosAddress, "", "Nacos Address")
	namespace := flag.String(common.NacosNamespace, "", "Nacos Namespace")
	dataId := flag.String(common.NacosDataid, "", "Nacos DataId")
	group := flag.String(common.NacosGroup, "", "Nacos Group")
	flag.Parse()

	if len(*serviceAddr) <= 0 {
		envAddr := os.Getenv(common.NacosAddress)
		if len(envAddr) > 0 {
			*serviceAddr = envAddr
		}
	}

	if len(*namespace) <= 0 {
		envNamespace := os.Getenv(common.NacosNamespace)
		if len(envNamespace) > 0 {
			*namespace = envNamespace
		}
	}

	if len(*dataId) <= 0 {
		envDataId := os.Getenv(common.NacosDataid)
		if len(envDataId) > 0 {
			*dataId = envDataId
		}
	}

	if len(*group) <= 0 {
		envGroup := os.Getenv(common.NacosGroup)
		if len(envGroup) > 0 {
			*group = envGroup
		}
	}

	err := initConfigClient(*serviceAddr, *namespace)
	if err != nil {
		return err
	}
	var content string
	content, err = client.GetConfig(vo.ConfigParam{
		DataId: *dataId,
		Group:  *group,
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
