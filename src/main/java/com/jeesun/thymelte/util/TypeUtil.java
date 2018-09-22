package com.jeesun.thymelte.util;

import com.google.common.base.Joiner;
import com.jeesun.thymelte.repository.UserDomainRepository;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

/**
 * @author simon
 * @create 2018-08-21 15:04
 **/

@Slf4j
public class TypeUtil {
    private static ApplicationContext applicationContext = SpringUtils.getApplicationContext();
    private static JdbcTemplate jdbcTemplate = applicationContext.getBean(JdbcTemplate.class);
    private static TypeUtil instance = new TypeUtil();

    private TypeUtil(){

    }

    public static TypeUtil getInstance() {
        return instance;
    }

    public String getEmail(String queryInfo){
        String[] strArr = queryInfo.split(",");
        //数据字典组编码 或 自定义字典(格式：表名,编码,显示文本)
        log.info(Arrays.asList(strArr).toString());
        List<String> email = jdbcTemplate.queryForList("SELECT " + strArr[0] + " FROM " + strArr[1] + " WHERE "+ strArr[2] + "='" + strArr[3] + "'", String.class);
        return (null == email) ? "" : email.toString();
    }
}
