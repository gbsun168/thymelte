package com.jeesun.thymelte.repository;

import com.jeesun.thymelte.domain.Authority;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorityRepository extends JpaRepository<Authority, String> {
}
