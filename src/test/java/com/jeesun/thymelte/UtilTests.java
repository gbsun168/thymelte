package com.jeesun.thymelte;

import org.apache.log4j.Logger;
import org.jasypt.util.text.BasicTextEncryptor;
import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.text.SimpleDateFormat;
import java.util.Date;

public class UtilTests {
    private static Logger logger = Logger.getLogger(UtilTests.class);
    @Test
    public void jasyptTest(){
        BasicTextEncryptor encryptor = new BasicTextEncryptor();
        encryptor.setPassword("19941017");//application.yml配置的jasypt.encryptor.password
        String encrypted = encryptor.encrypt("postgres");//要加密的数据（数据库连接的用户名或密码）
        System.out.println(encrypted);
    }

    @Test
    public void encodePwd(){
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(11);
        //原密码1，加密之后：$2a$11$mpO6ZRnpB0S6tNs2lHJ4QulxtERejoGq4zQ80tCxFUEsOQfKLvY9S
        //原密码1234567890c，加密之后：$2a$11$R0BqVKgk1dE/5GAxGIxPheU7ztugGq1uRTQrD2G4AINd1uCAlYR8C
        System.out.println("原密码1，加密之后："+encoder.encode("1"));
        System.out.println("原密码1234567890c，加密之后："+encoder.encode("1234567890c"));
    }

    @Test
    public void testTime(){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        logger.info(format.format(new Date()));
    }

    @Test
    public void testSub(){
        String imgUrl = "cms/ReadAddress/1479805098158.jpg";

        String image = imgUrl.substring(imgUrl.lastIndexOf("/")+1);
        logger.info(image);
        logger.info(imgUrl.substring(0, imgUrl.lastIndexOf("/")));
    }
}
