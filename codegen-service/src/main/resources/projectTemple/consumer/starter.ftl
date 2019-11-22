package com.avatech.dahupt.${projectName?lower_case}.starter;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;
import org.springframework.context.annotation.ComponentScan;

/**
* PLEASE KEEP THIS INFOMATION
* CREATE BY AVATECH EDI CODE TOOL
* AT ${.now?string["yyyy-MM-dd"]}
*/
@SpringBootApplication
@ComponentScan("com.avatech.dahupt.${projectName?lower_case}")
@MapperScan(basePackages = "com.avatech.dahupt.${projectName?lower_case}.repository.mapper")
public class ${projectName?upper_case}ConsumerApplication {

    @Autowired(required = false)
    private TtlScheduler ttlScheduler;

    @Bean
    public DahuptConsulServiceRegistry consulServiceRegistry(ConsulClient consulClient, ConsulDiscoveryProperties properties,HeartbeatProperties heartbeatProperties) {
        return new DahuptConsulServiceRegistry(consulClient, properties, ttlScheduler, heartbeatProperties);
    }

    public static void main(String[] args) {
        SpringApplication.run(${projectName?upper_case}ConsumerApplication.class, args);
    }

}