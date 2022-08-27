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

>需要修改MySQL、Redis、Http、限流、监控等系统配置，设计支持多种配置管理：
* 本地配置方式
  - 修改config.yaml
  - ./api-gateway > gateway.log &

* 外部配置中心接入
  - 目前支持Nacos，在nacos配置config.yaml 内容，需要启动时加入nacos配置
  - ./api-gateway -NACOS_ADDRESS=127.0.0.1:8888 -NACOS_NAMESPACE=dev -NACOS_DATAID=life-gateway -NACOS_GROUP=DEFAULT_GROUP &

### 架构设计

##### 架构

##### 概念

1. API

- API基础定义，包括API名称、编码、请求方法、所属服务、源URI、目标URI、维护者、描述等信息

2. 租户

- API调用方的基础定义，包括租户名称、编码

4. 上游服务

- API上游服务的基础定义，包括上游服务名称、编码

5. 环境

- API对应的环境的基础定义，包括环境名称、编码
- API在具体环境下的特质，包括限流、降级、是否开启监控、超时时间、header参数过滤、query参数过滤等信息
- 租户在具体环境下的特质，包括租户鉴权、租户级header参数过滤、query参数等信息
- 上游服务在具体环境下的特质，包括服务的上游地址、灰度配置（地址、特征策略、放量策略、灰度命中header tag）置等信息

6. 分组

- Api归类基础定义，包括分组名称、编码
- 仅是为了方便Api管理者对api进行归纳管理，具体如何归类，需要Api gateway 管理者去定义
- 举个例子，Api 获取订单信息（/order/{{orderNo}}）可以以模块分组，分组即为订单模块，也可以以出单流程进行分组，分组即为出单
- 一个Api可以属于多个分组，一个分组可以有多个Api

7. 审计信息

- Api、租户、环境、上游服务信息修改
- Api信息发布、环境与环境之间API同步生成审批信息
- Api发布历史记录比对回溯

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
