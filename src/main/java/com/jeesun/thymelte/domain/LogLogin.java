package com.jeesun.thymelte.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * 登录日志记录表
 */
@Table
@Entity
public class LogLogin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    private Date createTime;
    private String ip;

    public LogLogin() {
    }

    public LogLogin(String username, Date createTime, String ip) {
        this.username = username;
        this.createTime = createTime;
        this.ip = ip;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}
