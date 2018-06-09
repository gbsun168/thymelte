package com.jeesun.thymelte.repository;

import com.jeesun.thymelte.domain.UserDomain;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserDomainRepository extends JpaRepository<UserDomain, String> {
    UserDomain findById(Long id);
    UserDomain findByUsername(String username);

    @Query(value = "SELECT a.* FROM users a WHERE NOT EXISTS (SELECT * FROM authorities b WHERE a.username=b.username AND (b.authority = 'ROLE_ADMIN' OR b.authority = 'ROLE_SU')) OFFSET :offset LIMIT :limit", nativeQuery = true)
    List<UserDomain> findAllByAuthority(@Param("offset") Integer offset, @Param("limit") Integer limit);

    @Query(value = "SELECT COUNT(a.*) FROM users a WHERE NOT EXISTS (SELECT * FROM authorities b WHERE a.username=b.username AND (b.authority = 'ROLE_ADMIN' OR b.authority = 'ROLE_SU'))", nativeQuery = true)
    int countAllByAuthority();
}
