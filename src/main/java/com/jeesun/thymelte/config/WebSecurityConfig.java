package com.jeesun.thymelte.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.jeesun.thymelte.custom.CustomAuthenticationFailureHandler;
import com.jeesun.thymelte.custom.CustomLoginAuthProvider;
import com.jeesun.thymelte.custom.CustomTokenAuthProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.thymeleaf.extras.springsecurity4.dialect.SpringSecurityDialect;

@Configuration
@EnableWebSecurity
//Spring Security默认是禁用注解的，要想开启注解，需要在继承WebSecurityConfigurerAdapter的类上加@EnableGlobalMethodSecurity注解，来判断用户对某个控制层的方法是否具有访问权限
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true, jsr250Enabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private DruidDataSource dataSource;

    @Autowired
    private AuthSuccessHandler authSuccessHandler;

    @Autowired
    private CustomLoginAuthProvider authProvider;

    @Autowired
    private CustomTokenAuthProvider tokenAuthProvider;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //logoutSuccessUrl如果设为/login，那么退出后，
        //会重新自动创建session，触发OnLineCountListener的sessionCreated方法，造成在线人数不准。
        http
                .formLogin().loginPage("/login").permitAll()
                .defaultSuccessUrl("/index")
                .failureHandler(new CustomAuthenticationFailureHandler())
                .successHandler(authSuccessHandler)
                .and()
                .logout().permitAll()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login?logout")
                .and()
                .csrf().ignoringAntMatchers("/druid/*")
                .and()
                .authorizeRequests()
                .antMatchers("/img/**", "/js/**", "/css/**", "/webjars/**", "/video/**", "/plug-in/**").permitAll()
                .antMatchers("/login", "/logout", "/register", "/register_result", "/forget_password", "/reset_password", "/users/sendEmail", "/users/resetPassword", "/users/forgetPwd","/users/check", "/users/resetPwd", "/users/test", "/users/checkExists").permitAll()
                .antMatchers("/just_test", "/upload", "/users/uuid/**", "/users/loopCheck/**", "/users/register").permitAll()
                .antMatchers("/user-manage").hasRole("ADMIN")
                .anyRequest().authenticated()
                .and()
                .rememberMe()
        .and().csrf().ignoringAntMatchers("/register", "/users/register", "/users/forgetPwd");

        //只允许一个用户登录,如果同一个账户两次登录,那么第一个账户将被踢下线,跳转到登录页面
        http
                .sessionManagement()
                .maximumSessions(1)
                .expiredUrl("/login?result=loginAnotherLocation");
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(tokenAuthProvider);
        auth.authenticationProvider(authProvider);
        auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(new BCryptPasswordEncoder(11));
    }

    /**
     * 使Thymeleaf的spring security标签生效
     * 使用办法：html标签内添加xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity4"
     * @return
     */
    @Bean
    public SpringSecurityDialect securityDialect() {
        return new SpringSecurityDialect();
    }
}
