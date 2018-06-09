package com.jeesun.thymelte.repository;

import com.jeesun.thymelte.domain.NewsTag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * 新闻标签
 *
 * @author simon
 * @create 2018-06-06 0:19
 **/
@Repository
public interface NewsTagRepository extends JpaRepository<NewsTag, Long> {
}
