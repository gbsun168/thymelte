package com.jeesun.thymelte.config;

import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

@Configuration
public class DruidConfiguration {
    @Autowired
    private Environment env;

    @Bean
    public ServletRegistrationBean statViewServlet(){
        ServletRegistrationBean bean = new ServletRegistrationBean(new StatViewServlet(), "/druid/*");
        //IP白名单
        bean.addInitParameter("allow", env.getProperty("druid.allow"));
        //IP黑名单（共同存在时，deny优先于allow）
        bean.addInitParameter("deny", env.getProperty("druid.deny"));
        //控制台管理用户
        bean.addInitParameter("loginUsername", env.getProperty("druid.login-username"));
        bean.addInitParameter("loginPassword", env.getProperty("druid.login-password"));
        //是否能够重置数据
        bean.addInitParameter("resetEnable", env.getProperty("druid.reset-enable"));

        return bean;
    }

    @Bean
    public FilterRegistrationBean statFilter(){
        FilterRegistrationBean bean = new FilterRegistrationBean(new WebStatFilter());
        //添加过滤规则
        bean.addUrlPatterns("/*");
        //忽略过滤的格式
        bean.addInitParameter("exclusions", "*.js,*.gif,*.svg,*.jpg,*.png,*.css,*.ico,/druid/*");
        return bean;
    }
}
