package com.jeesun.thymelte.custom;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public class UsernameTokenAuthenticationToken extends AbstractAuthenticationToken {
    private String username;
    private String token;
    private String sid;

    public UsernameTokenAuthenticationToken(String username, String token, String sid) {
        super((Collection)null);
        this.username = username;
        this.token = token;
        this.sid = sid;
        this.setAuthenticated(false);
    }

    public UsernameTokenAuthenticationToken(Collection<? extends GrantedAuthority> authorities, String username, String token, String sid) {
        super(authorities);
        this.username = username;
        this.token = token;
        this.sid = sid;
        super.setAuthenticated(true);// must use super, as we override
    }

    @Override
    public Object getCredentials() {
        return this.sid;
    }

    @Override
    public Object getPrincipal() {
        return this.username;
    }

    public void setAuthenticated(boolean isAuthenticated) throws IllegalArgumentException {
        if (isAuthenticated) {
            throw new IllegalArgumentException("Cannot set this token to trusted - use constructor which takes a GrantedAuthority list instead");
        } else {
            super.setAuthenticated(false);
        }
    }

    public void eraseCredentials() {
        super.eraseCredentials();
        this.token = null;
        this.sid = null;
    }

    public String getUsername() {
        return username;
    }

    public String getToken() {
        return token;
    }

    public String getSid() {
        return sid;
    }
}
