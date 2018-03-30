package com.jeesun.thymelte;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping({"/", "/index"})
    public String index(){
        return "index";
    }

    @RequestMapping("/index-backup")
    public String indexBackup(){
        return "index-backup";
    }
    @RequestMapping("/second")
    public String second(){
        return "second";
    }

    @RequestMapping("/third")
    public String third(){
        return "third";
    }

    @RequestMapping("/forth")
    public String forth(){
        return "forth";
    }

    @RequestMapping("/logout")
    public String logout(){
        return "redirect:/login";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }
}
