package com.jeesun.thymelte.controller;

import com.jeesun.thymelte.config.AppConfig;
import com.jeesun.thymelte.domain.NewsInfo;
import com.jeesun.thymelte.domain.ResultMsg;
import com.jeesun.thymelte.domain.UserEntity;
import com.jeesun.thymelte.repository.NewsInfoRepository;
import com.jeesun.thymelte.repository.NewsTagRepository;
import com.jeesun.thymelte.util.FileUploadUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 新闻
 *
 * @author simon
 * @create 2018-06-06 0:20
 **/
@Controller
@RequestMapping("newsInfos")
public class NewsInfoController {
    private static Logger logger = Logger.getLogger(NewsInfoController.class);

    @Autowired
    private NewsInfoRepository newsInfoRepository;

    @Autowired
    private NewsTagRepository newsTagRepository;

    /**
     * 新建或者修改新闻
     * @param id
     * @param title
     * @param content
     * @param files
     * @return
     */
    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg post(
            @RequestParam(required = false) Long id,
            @RequestParam String title,
            @RequestParam String content,
            @RequestParam("imageUrl") String[] imageUrls){
        UserEntity userEntity = (UserEntity) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal();

        NewsInfo newsInfo;
        if(null == id){
            newsInfo  = new NewsInfo();
        }else{
            newsInfo = newsInfoRepository.findOne(id);
        }

        if(null != imageUrls && imageUrls.length > 0){
            newsInfo.setImageUrl(imageUrls[0]);
        }

        newsInfo.setTitle(title);
        newsInfo.setContent(content);
        newsInfo.setPublishDate(new Date());
        newsInfo.setStatus(AppConfig.PUBLISH_STATUS.PUBLISH.ordinal());
        newsInfo.setUserId(userEntity.getId());

        newsInfo = newsInfoRepository.save(newsInfo);

        if(null == newsInfo){
            return new ResultMsg(404, "保存新闻信息失败");
        }else{
            return new ResultMsg(200, "保存新闻信息成功", newsInfo);
        }
    }

    @RequestMapping(value = "pageable", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> get(
            @RequestParam(required = false) Integer offset,
            @RequestParam(required = false) Integer page,
            @RequestParam(required = false) Integer limit){
        UserEntity userEntity = (UserEntity) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal();

        Map<String, Object> resultMap = new LinkedHashMap<>();
        resultMap.put("total", newsInfoRepository.countByUserId(userEntity.getId()));
        if(null != page && null != limit){
            /*resultMap.put("rows", newsInfoRepository.findAll(new PageRequest((page - 1), limit, new Sort(Sort.Direction.DESC, "publishDate"))).getContent());*/
            resultMap.put("rows", newsInfoRepository.getByUserId(userEntity.getId(), new PageRequest((page -1), limit, new Sort(Sort.Direction.DESC, "publishDate"))));
        }
        if(null != offset && null != limit){
            /*resultMap.put("rows", newsInfoRepository.findAll(new PageRequest((offset / limit), limit, new Sort(Sort.Direction.DESC, "publishDate"))).getContent());*/
            resultMap.put("rows", newsInfoRepository.getByUserId(userEntity.getId(), new PageRequest((offset / limit), limit, new Sort(Sort.Direction.DESC, "publishDate"))));
        }
        if(null == limit){
            resultMap.put("rows", newsInfoRepository.getByUserId(userEntity.getId(), null));
        }
        return resultMap;
    }

    @RequestMapping(value = "delete/id/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ResultMsg delete(@PathVariable Long id){
        newsInfoRepository.delete(id);
        return new ResultMsg(200, "删除成功");
    }

    @RequestMapping(value = "delete/ids/{ids}", method = RequestMethod.GET)
    @ResponseBody
    public ResultMsg deleteIds(@PathVariable String ids){
        String[] idArr = ids.split(",");
        for(String idStr : idArr){
            newsInfoRepository.delete(Long.parseLong(idStr));
        }
        return new ResultMsg(200, "批量删除成功");
    }
}
