package com.jeesun.thymelte.custom;

import org.apache.log4j.Logger;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 自定义授权失败处理类
 *
 * @author simon
 * @create 2018-06-08 12:43
 **/

public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {
    private static Logger logger = Logger.getLogger(CustomAuthenticationFailureHandler.class);

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException, ServletException {
        logger.error(e);
        //HttpSession session = request.getSession();
        if(e instanceof DisabledException){
            //session.setAttribute("message", "disabled");
            response.sendRedirect("login?result=disabled");
        }else if(e instanceof BadCredentialsException){
            //session.setAttribute("message", "error");
            response.sendRedirect("login?result=error");
        }
    }
}
