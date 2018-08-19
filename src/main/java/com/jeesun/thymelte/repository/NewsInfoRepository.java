package com.jeesun.thymelte.repository;

import com.jeesun.thymelte.domain.NewsInfo;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
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
@CacheConfig(cacheNames = "newsInfos")
@Repository
public interface NewsInfoRepository extends JpaRepository<NewsInfo, Long> {
    //@Cacheable(key = "'newsInfos:userId' + #p0")
    List<NewsInfo> getByUserId(Long userId, Pageable pageable);
    @Cacheable(key = "'newsInfosCount' + #p0")
    int countByUserId(Long userId);

    @Cacheable(key = "'newsInfo' + #p0")
    @Override
    NewsInfo findOne(Long aLong);

    /**
     * 新增或者修改
     * @param newsInfo
     * @return
     */

    @CachePut(key = "'newsInfo' + #p0.userId")
    @Override
    NewsInfo save(NewsInfo newsInfo);

    /*@Transactional
    @Modifying
    @CacheEvict(key = "'newsInfo' + #p0.userId")*/
    @Override
    void delete(Long aLong);
}
