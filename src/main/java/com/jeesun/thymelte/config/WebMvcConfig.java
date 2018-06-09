package com.jeesun.thymelte.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        super.addViewControllers(registry);
        registry.addViewController("/login").setViewName("login");
        registry.addViewController("/index").setViewName("index");
        registry.addViewController("/").setViewName("index");
        registry.addViewController("/second").setViewName("second");
        registry.addViewController("/third").setViewName("third");
        registry.addViewController("/forth").setViewName("forth");
        registry.addViewController("/user_manage").setViewName("user_manage");
        registry.addViewController("/register").setViewName("register");
        registry.addViewController("/register_result").setViewName("register_result");
        registry.addViewController("/just_test").setViewName("just_test");
        registry.addViewController("/news_info").setViewName("news_info");
        registry.addViewController("/news_info_edit").setViewName("news_info_edit");
        registry.addViewController("/news").setViewName("news");
    }
}
