package com.jeesun.thymelte.config;

import com.jeesun.thymelte.domain.LogLogin;
import com.jeesun.thymelte.domain.UserEntity;
import com.jeesun.thymelte.repository.LogLoginRepository;
import com.jeesun.thymelte.util.IpUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class AuthSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
    private static Logger log = Logger.getLogger(AuthSuccessHandler.class);

    @Autowired
    private LogLoginRepository logLoginRepository;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        UserEntity userDetails = (UserEntity) authentication.getPrincipal();
        logLoginRepository.save(new LogLogin(userDetails.getUsername(), new Date(), IpUtil.getIpAddr(request)));

        super.onAuthenticationSuccess(request, response, authentication);
    }
}
