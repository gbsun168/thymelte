package com.jeesun.thymelte.repository;

import com.jeesun.thymelte.domain.LogLogin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LogLoginRepository extends JpaRepository<LogLogin, Long> {

}
