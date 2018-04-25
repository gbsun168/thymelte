package com.jeesun.thymelte.repository;

import com.jeesun.thymelte.domain.UserDomain;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDomainRepository extends JpaRepository<UserDomain, String> {
    UserDomain findById(Long id);
    UserDomain findByUsername(String username);
}
