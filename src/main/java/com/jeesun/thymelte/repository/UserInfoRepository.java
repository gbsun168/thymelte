package com.jeesun.thymelte.repository;

import com.jeesun.thymelte.domain.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by simon on 2016/8/13.
 */

@Repository
public interface UserInfoRepository extends JpaRepository<UserInfo, Long> {
    UserInfo findById(Long id);
    UserInfo findByUserId(Long userId);
    UserInfo findByPhone(String phone);
    UserInfo findByUsername(String username);
    UserInfo findByEmail(String email);
}
