package com.jeesun.thymelte.receiver;

import com.jeesun.thymelte.controller.UserController;
import org.apache.log4j.Logger;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 邮件消息消费者
 *
 * @author simon
 * @create 2018-06-19 14:35
 **/

@Component
@RabbitListener(queues = "email")
public class EmailReceiver {
    @Autowired
    private UserController userController;

    private static Logger logger = Logger.getLogger(EmailReceiver.class);
    @RabbitHandler
    public void sendEmail(String username){
        logger.info(username);
        userController.sendEmail(username);
    }
}