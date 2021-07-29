package com.xuexi.manager.thirdparty;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
@EnableFeignClients
@EnableDiscoveryClient
@SpringBootApplication
@ComponentScan("com.xuexi.manager")
public class GulimallThirdPartyApplication {

    public static void main(String[] args) {
        SpringApplication.run(GulimallThirdPartyApplication.class, args);
    }

}
