## Api Gateway

高性能可伸缩弹性部署的 Http Api网关

### 快速开始

##### 启动外部依赖

1. MySQL

* API治理信息存储

2. Redis

* 分布式ID snowflakes 生成器
* 分布式限流

##### 运行

1. go version：go 1.16+
2. 运行环境：linux、macos、windows
3. 编译

* cd api-gateway
* go env -w CGO_ENABLED=0 GOOS=linux GOARCH=amd64
* go build -o api-gateway main.go

4. 配置修改 & 启动

```
需要修改MySQL、Redis、Http、限流、监控等系统配置，设计支持多种配置管理：
```

* 本地配置方式

```
修改config.yaml
./api-gateway > gateway.log &
```

* 外部配置中心接入

```
目前支持Nacos，在nacos配置config.yaml 内容，需要启动时加入nacos配置
./api-gateway -NACOS_ADDRESS=127.0.0.1:8888 -NACOS_NAMESPACE=dev -NACOS_DATAID=life-gateway -NACOS_GROUP=DEFAULT_GROUP &
```

### 架构设计
##### 架构

##### 提取

### 功能概览

* API治理
* 跨域
* Restful API 支持
* URL安全校验
* API鉴权
* 流控
* 降级
* 参数过滤（header、query）
* 灰度
* 监控指标采集

### 性能压测

### 功能详细介绍

##### API治理

* 覆盖API生命周期的各个阶段（开发、测试、上线、监控、下线）管理
* 支持环境间数据同步
* 审批管理: 数据变更，变更内容查看
* 提供历史变更记录

##### 跨域

* 配置文件 CORS 可配置

##### Restful API 支持

##### URL安全校验

##### API鉴权

##### 流控

##### 参数忽略

##### 灰度

* 特征灰度
    * 请求头信息
* 放量灰度

##### 监控指标采集

* API请求监控
* Redis监控
* 限流监控
* 错误监控
