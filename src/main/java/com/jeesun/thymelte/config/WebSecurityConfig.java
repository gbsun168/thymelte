package com.jeesun.thymelte.config;

import com.alibaba.druid.pool.DruidDataSource;
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
@EnableGlobalMethodSecurity(prePostEnabled = true)//允许进入页面方法前检验
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
                .failureUrl("/login?error").permitAll()
                .successHandler(authSuccessHandler)
                .and()
                .logout().permitAll()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login?logout")
                .and()
                .csrf().ignoringAntMatchers("/druid/*")
                .and()
                .authorizeRequests()
                .antMatchers("/login", "/logout").permitAll()
                .antMatchers("/img/**", "/js/**", "/css/**", "/webjars/**").permitAll()
                .antMatchers("/just_test", "/upload", "/users/uuid/**", "/users/loopCheck/**").permitAll()
                .antMatchers("/user-manage").hasRole("ADMIN")
                .anyRequest().authenticated()
                .and()
                .rememberMe();

        http.sessionManagement().invalidSessionUrl("/login?logout").maximumSessions(1).expiredUrl("/login?logout");
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
