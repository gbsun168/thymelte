package com.jeesun.thymelte.repository;

import com.jeesun.thymelte.domain.ResetPasswordInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * 重置密码信息
 *
 * @author simon
 * @create 2018-06-12 15:09
 **/
@Repository
public interface ResetPasswordInfoRepository extends JpaRepository<ResetPasswordInfo, Long> {
    ResetPasswordInfo getByUserId(Long id);
}
