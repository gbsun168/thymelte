package com.jeesun.thymelte.custom;

import com.jeesun.thymelte.domain.QrCode;
import com.jeesun.thymelte.domain.UserEntity;
import com.jeesun.thymelte.repository.QrCodeRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.Collection;

@Component
public class CustomTokenAuthProvider implements AuthenticationProvider {
    private static final Logger logger = Logger.getLogger(CustomTokenAuthProvider.class);
    @Autowired
    private CustomUserDetailsService userDetailsService;

    @Autowired
    private QrCodeRepository qrCodeRepository;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        logger.error("authenticate");
        String username = authentication.getName();
        String password = (String) authentication.getCredentials();
        UserEntity userEntity = (UserEntity) userDetailsService.loadUserByUsername(username);
        if (null == userEntity){
            throw new BadCredentialsException("用户名错误");
        }

        String sid = "";
        QrCode qrCode = qrCodeRepository.findBySid(password);
        if(password.length() >= 32){
            //说明是uuid，此时是扫码登录
            sid = qrCode.getSid();
            if (username.equals(qrCode.getUsername())){
                logger.info("用户名和绑定的一样");
            }else{
                throw new BadCredentialsException("uuid错误");
            }
        }

        Collection<? extends GrantedAuthority> authorities = userEntity.getAuthorities();
        return new UsernameTokenAuthenticationToken(authorities, username, qrCode.getToken(), sid);
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return UsernameTokenAuthenticationToken.class.equals(aClass);
    }
}
