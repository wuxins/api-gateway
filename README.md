设计目的

```
    高性能可伸缩弹性部署的 API Gateway 中间件，不做业务定制功能
    支持功能：
        接口管理：
            (1) 支持接口管理
                各环境接口渐进式审批发布
                接口租户、接口分组
            (2) restful 接口支持
                源接口和目标的接口的相对路径地址不要求一致，但URL的可变参数名称和数量需要保持一致
        限流：支持客户端模式和服务端模式，客户端模式是限对调用方的承诺QPS，服务端模式是限服务方实际处理能力QPS，两种模式都支持fallback
        降级：供开发环境Api Mock，生产突发访问或故障降级非核心接口
        监控：数据上报、过滤、清洗、聚合、数据展示
            目前实现了数据将metric上报到指定日志文件，等待数据平台采集
```

部署介绍

```
    1、go version：go 1.16+ 
    2、编译&运行环境：linux、macos、windows
    example:
        cd api-gateway
        go env -w CGO_ENABLED=0 GOOS=linux GOARCH=amd64
        go build -o api-gateway main.go
    3、依赖中间件
    （1）mysql：启动时强依赖；启动后，定时刷新
        应用场景：用于加载API动态信息到内存
    （2）redis：启动时强依赖；启动后，定时刷新
        应用场景：雪花算法NodeId控制、限流
```

配置管理

```
配置：
    设计需要支持多种配置管理，配置管理模式需要在Config.yaml 指定（Conf.Mode），目前支持本地配置加载、Nacos配置中心加载两种方式:
    （1）本地配置方式（Conf.Mode=local）：
         需要将配置信息配置在Config.yml 的Local 节点下
            运行示例：./run &
    （2）Nacos配置方式（Conf.Mode=nacos）：
         NACOS启动因素：NACOS_ADDRESS、NACOS_NAMESPACE、NACOS_DATAID、NACOS_GROUP
         启动因素配置支持三种方式：
        （1）将Nacos的启动因素配置在启动参数
            运行示例：./run -NACOS_ADDRESS=192.168.43.22:8888 -NACOS_NAMESPACE=dev -NACOS_DATAID=life-gateway -NACOS_GROUP=DEFAULT_GROUP &
        （2）将Nacos的启动因素配置在环境变量
            运行示例：./run &
        （3）将Nacos的启动因素配置在Config.yml Nacos 节点下
            运行示例：./run &
         加载优先级：
            优先用启动命令参数，然后环境变量，最后本地配置
         

```

表设计

```
    共7张表
    1、api
        对api的基础定义，包含名称、编码、请求方式、源地址、目标地址、具体描述
    2、group
        对api分组管理的描述，由业务方自己去根据业务的特点进行分类，仅为了方便api管理方集中管理和归类api，不会影响api的系统特性
        以保险行业举例：
            当api管理者以领域角度分组：分组（group_code）就是公共域、客户、产品、订单、保单、账务、财务 ......
            当api管理者以流程角度分组：分组（group_code）就是新契约、保全、续期、续保、理赔、营销（券、活动） ......
            多种分组可以同时存在，不要求一个api只能有一个分组，主要还是看api管理者怎么归类管理起来更清晰
    3、tenant
        对api租户管理的描述，后续可扩展为api调用者及其个性化的api行为
    4、api_group
        api和分组的映射多对多关系，一个api可以有多个分组，一个分组下可以有多个api
    5、api_tenant
        api和租户的映射多对多关系，一个api可以被多个调用者租户使用，一个调用者租户下可以使用多个api
    6、api_version
        描述了api在各个环境的api配置行为，比如降级、限流、超时、监控；
        映射多对多关系，一个api可以在多个环境下，一个环境下可以有多个api；
        支持api渐进式发布流程思路（需要在api后台管理系统完成）：
            （1）api调用方提供调用方excel api信息（使用场景、并发），api服务方开发人员补充完excel其他信息，由后台管理系统导入，系统会在开发环境生成api信息
            （2）调用方和服务方开发人员完成对接，服务方开发人员点击提测，api会同步测试环境并生效，并通知测试人员验证
            （3）测试人员完成测试，可以由运维点击发布，api将同步生产环境并生效
     7、api_upstream_server
        对api对应转发后台服务列表(通过配置方式的方案)描述，使用者可以根据自身特点，结合适合的负载均衡策略，设置每个服务的权重、区域配置
        后续会拓展为服务注册和发现等方式
    具体设计见table.sql
```

流控设计

```
1、是否开启流控，通过Rate.Enable控制流控是否生效，true为生效
2、支持server和client两种模式，通过Rate.Mode配置控制
    （1）server模式（Rate.Enable = server）：
        从后台服务实际处理能力这个角度限流，侧重系统的保护
    （2）client模式（Rate.Enable = client）：
        从调用方实际请求QPS的角度限流，侧重对调用方后台服务能力的承诺；
        后台需要做好自我保护处理（超时、熔断、限流），防止服务出现异常时，请求挤压，无法处理客户实际QPS
3、两种限流模式实现方案
    （1）启动依赖redis
    （2）启动后，探活redis
        redis 探活失败，分布式限流到本地限流，直到redis alive again，降级是为了避免redis故障引发网关不可用     
```

Upstream Server 负载均衡设计

```
目前支持api静态化配置服务列表方案，表api_upstream_server可以设置api权重、区域，
需要结合负载均衡策略使用，通过配置(Routing.LoadBalanceStrategies)设置，默认为随机，

负载接口：
type LoadBalancer interface {
	Select(servers []dto.UpstreamServer) (string, error)
}

已实现：Random
TODO：Round Robin、Weighted Round Robin、Rigion Round Robin、Ip Consistent Hash
```

监控设计

```
网关只负责上报数据，数据处理过程走数据分析流程
1、数据上报
    (1) 数据定义
        定义了什么业务场景（Metric、MetricType）在什么时间（Time）做了一件什么样的事情（Key），以及具体事情内容（Content）
        参考  metrics.go    type Event struct 
2、数据采集&过滤&存储
     filebeat -> es 
3、数据清洗聚合
     es -> 再清洗（实时、非实时）
4、数据展示
    dashboard
```

```

TODO list

```

1、监控设计 监控内容 全局配置 api配置 2、Api gateway admin

```
