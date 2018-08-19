package com.jeesun.thymelte.config;

import com.alibaba.fastjson.JSON;
import com.jeesun.thymelte.domain.LogLogin;
import com.jeesun.thymelte.domain.UserEntity;
import com.jeesun.thymelte.repository.LogLoginRepository;
import com.jeesun.thymelte.util.DateUtil;
import com.jeesun.thymelte.util.IpUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@Component
public class AuthSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
    private static Logger logger = Logger.getLogger(AuthSuccessHandler.class);

    @Autowired
    private LogLoginRepository logLoginRepository;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        UserEntity userDetails = (UserEntity) authentication.getPrincipal();
        LogLogin logLogin = new LogLogin();
        logLogin.setUsername(userDetails.getUsername());
        logLogin.setCreateTime(new Date());
        logLogin.setIp(IpUtil.getIpAddr(request));
        logLogin = logLoginRepository.save(logLogin);
        logger.info(JSON.toJSONString(logLogin));

        HttpSession httpSession = request.getSession();
        logger.info("session create time = " + DateUtil.format(httpSession.getCreationTime(), "yyyy-MM-dd HH:mm:ss"));

        super.onAuthenticationSuccess(request, response, authentication);
    }
}
