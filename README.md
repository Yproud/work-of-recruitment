# work-of-recruitment
 企业背调网站的后端文件

#### 项目介绍

本地址是企业背调网站项目的后端文件，需要配合[前端文件](https://github.com/Yproud/vue-employee-renren)一起运行才可以实现网站的正常使用，另外还需要[redis](https://redis.io/)和[nacos](https://nacos.io/en-us/)后台服务的运行，再分别启动company、employee、recruit_gateway、recruit-third-party、renren-fast里面的运行主代码即可。

#### 软件架构
1. 使用springboot作为后端主要框架，以maven对jar包进行管理
2. 使用mybatis-plus管理Dao层
3. 通过nacos对所有的服务进行均衡负载
4. 使用redis主要是对演示视频做到非键值对的存储
5. 与阿里云oss对象存储建立联系，对企业上传的证件进行云端存储

#### 使用说明

1.  需要在**recruit-third-party** resources里面修改application.properties的值，包括你的阿里云bucketId和secret-key等配置
2.  nacos无需配置文件，只需要启动项目，项目运行后会自动注册nacos服务

#### 特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
