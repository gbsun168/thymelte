package com.jeesun.thymelte.config;

import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * RabbitMQ配置
 *
 * @author simon
 * @create 2018-06-19 13:04
 **/
@Configuration
public class RabbitMQConfig {
    @Bean
    public Queue Queue() {
        return new Queue("email");
    }
}
