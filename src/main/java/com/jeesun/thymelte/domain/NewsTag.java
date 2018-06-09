package com.jeesun.thymelte.domain;

import javax.persistence.*;

/**
 * 新闻标签
 *
 * @author simon
 * @create 2018-06-06 0:15
 **/
@Table(name = "news_tag")
@Entity
public class NewsTag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long newsInfoId;

    private Long tagId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getNewsInfoId() {
        return newsInfoId;
    }

    public void setNewsInfoId(Long newsInfoId) {
        this.newsInfoId = newsInfoId;
    }

    public Long getTagId() {
        return tagId;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }
}
