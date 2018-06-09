package com.jeesun.thymelte.repository;

import com.jeesun.thymelte.domain.NewsInfo;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 新闻
 *
 * @author simon
 * @create 2018-06-06 0:18
 **/
@Repository
public interface NewsInfoRepository extends JpaRepository<NewsInfo, Long> {
    List<NewsInfo> getByUserId(Long userId, Pageable pageable);
    int countByUserId(Long userId);
}
