package com.jeesun.thymelte.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

import java.sql.SQLException;
import java.util.Properties;

@Configuration
public class DataSourceConfig {
    private static Logger logger = Logger.getLogger(DataSourceConfig.class);
    @Autowired
    private Environment env;

    @Bean
    public DruidDataSource dataSource(){
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName(env.getProperty("spring.datasource.driver-class-name"));
        dataSource.setUrl(env.getProperty("spring.datasource.url"));
        dataSource.setUsername(env.getProperty("spring.datasource.username"));
        dataSource.setPassword(env.getProperty("spring.datasource.password"));
        dataSource.setMaxActive(env.getProperty("spring.datasource.druid.max-active", Integer.class));
        dataSource.setInitialSize(env.getProperty("spring.datasource.druid.initial-size", Integer.class));
        dataSource.setMaxWait(env.getProperty("spring.datasource.druid.max-wait", Integer.class));
        dataSource.setMinIdle(env.getProperty("spring.datasource.druid.min-idle", Integer.class));
        dataSource.setRemoveAbandoned(env.getProperty("spring.datasource.druid.remove-abandoned", Boolean.class));
        dataSource.setRemoveAbandonedTimeout(env.getProperty("spring.datasource.druid.remove-abandoned-timeout", Integer.class));
        dataSource.setConnectionProperties(env.getProperty("spring.datasource.druid.connection-properties"));
        dataSource.setValidationQuery(env.getProperty("validation-query"));
        dataSource.setTestWhileIdle(env.getProperty("spring.datasource.druid.test-while-idle", Boolean.class));
        dataSource.setTestOnBorrow(env.getProperty("spring.datasource.druid.test-on-borrow", Boolean.class));
        dataSource.setTestOnReturn(env.getProperty("spring.datasource.druid.test-on-return", Boolean.class));
        dataSource.setMinEvictableIdleTimeMillis(env.getProperty("spring.datasource.druid.min-evictable-idle-time-millis", Integer.class));
        dataSource.setTimeBetweenEvictionRunsMillis(env.getProperty("spring.datasource.druid.time-between-eviction-runs-millis", Integer.class));
        dataSource.setPoolPreparedStatements(env.getProperty("spring.datasource.druid.pool-prepared-statements", Boolean.class));
        dataSource.setMaxPoolPreparedStatementPerConnectionSize(env.getProperty("spring.datasource.druid.max-pool-prepared-statement-per-connection-size", Integer.class));
        dataSource.setConnectProperties(env.getProperty("spring.datasource.druid.connection-properties", Properties.class));
        dataSource.setUseGlobalDataSourceStat(env.getProperty("spring.datasource.druid.use-global-data-source-stat", Boolean.class));
        try {
            dataSource.setFilters(env.getProperty("spring.datasource.druid.filters"));
        } catch (SQLException e) {
            e.printStackTrace();
            logger.error(e.getMessage());
        }
        return dataSource;
    }
}
