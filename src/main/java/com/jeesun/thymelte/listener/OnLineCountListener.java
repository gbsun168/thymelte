package com.jeesun.thymelte.listener;

import org.apache.log4j.Logger;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class OnLineCountListener implements HttpSessionListener {
    private static Logger logger = Logger.getLogger(OnLineCountListener.class);
    //监听session的创建,synchronized 防并发bug
    @Override
    public synchronized void sessionCreated(HttpSessionEvent arg0) {
        ServletContext context = arg0.getSession().getServletContext();
        Integer count = (Integer) context.getAttribute("count");
        if (null == count){
            count = 1;
        }else{
            count++;
        }
        context.setAttribute("count", count);
        logger.error("sessionCreated count=" + count);
    }

    @Override
    public synchronized void sessionDestroyed(HttpSessionEvent arg0) {
        ServletContext context = arg0.getSession().getServletContext();
        Integer count = (Integer) context.getAttribute("count");
        if (null == count) {
            count = 0;
        }else{
            if(count < 1){
                count = 1;
            }
            count--;
        }
        context.setAttribute("count", count);
        logger.error("sessionDestroyed count=" + count);
    }
}
