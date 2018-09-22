package com.jeesun.thymelte.controller;

import com.jeesun.thymelte.domain.UserDomain;
import com.jeesun.thymelte.repository.UserDomainRepository;
import com.jeesun.thymelte.repository.UserInfoRepository;
import com.jeesun.thymelte.util.TypeUtil;
import groovy.transform.Memoized;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 表格测试
 *
 * @author simon
 * @date 2018-09-15
 **/
@Slf4j
@Controller
@RequestMapping("/table")
public class TableController {
    @Autowired
    private UserDomainRepository userDomainRepository;

    @GetMapping("/test")
    public String table(Model model, HttpServletRequest request, HttpServletResponse response){
        TypeUtil typeUtil = TypeUtil.getInstance();
        log.info(typeUtil.getEmail("email,users,id,2"));
        request.setAttribute("typeUtil", typeUtil);
        model.addAttribute("messages", userDomainRepository.findAll());
        return "table";
    }

    @GetMapping("/data")
    @ResponseBody
    public List<UserDomain> getData(Model model, HttpServletRequest request, HttpServletResponse response){
        TypeUtil typeUtil = TypeUtil.getInstance();
        log.info(typeUtil.getEmail("email,users,id,2"));
        request.setAttribute("typeUtil", typeUtil);
        return userDomainRepository.findAll();
    }

    @GetMapping("/class_method")
    public String classMethod(Model model, HttpServletRequest request, HttpServletResponse response){
        TypeUtil typeUtil = TypeUtil.getInstance();
        log.info(typeUtil.getEmail("email,users,id,2"));
        request.setAttribute("typeUtil", typeUtil);
        model.addAttribute("typeUtil", typeUtil);

        return "class_method";
    }
}
