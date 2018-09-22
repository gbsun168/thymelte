package com.jeesun.thymelte.config;

import com.jeesun.thymelte.custom.ErrorPageInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {
    @Autowired
    private ErrorPageInterceptor errorPageInterceptor;

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        super.addViewControllers(registry);
        registry.addViewController("/login").setViewName("login");
        registry.addViewController("/index").setViewName("index");
        registry.addViewController("/").setViewName("index");
        registry.addViewController("/user_manage").setViewName("user_manage");
        registry.addViewController("/register").setViewName("register");
        registry.addViewController("/register_result").setViewName("register_result");
        registry.addViewController("/just_test").setViewName("just_test");
        registry.addViewController("/news_info").setViewName("news_info");
        registry.addViewController("/news").setViewName("news");
        registry.addViewController("/forget_password").setViewName("forget_password");
        registry.addViewController("/reset_password").setViewName("reset_password");
        registry.addViewController("/error/404").setViewName("error/404");
        registry.addViewController("/error/500").setViewName("error/500");
        registry.addViewController("/index_iframe").setViewName("index_iframe");
        registry.addViewController("/tab_first").setViewName("tab_first");
        registry.addViewController("/hello").setViewName("hello");
        registry.addViewController("/table").setViewName("table");
        registry.addViewController("/class_method").setViewName("class_method");
        registry.addViewController("/index_iframe2").setViewName("index_iframe2");
    }

    //项目完成的差不多时，再找时间自定义异常页面。
    /*@Override
    public void addInterceptors(InterceptorRegistry registry) {
        super.addInterceptors(registry);
        registry.addInterceptor(errorPageInterceptor);//.addPathPatterns("/action/**", "/mine/**");默认所有
        super.addInterceptors(registry);
    }*/
}
