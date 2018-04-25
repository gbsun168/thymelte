package com.jeesun.thymelte.controller;

import com.jeesun.thymelte.custom.CustomTokenAuthProvider;
import com.jeesun.thymelte.custom.UsernameTokenAuthenticationToken;
import com.jeesun.thymelte.domain.QrCode;
import com.jeesun.thymelte.domain.ResultMsg;
import com.jeesun.thymelte.repository.QrCodeRepository;
import com.jeesun.thymelte.util.UuidUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {
    private static Logger logger = Logger.getLogger(UserController.class);
    private static final String ROOT = "users";
    private final ResourceLoader resourceLoader;

    @Autowired
    private CustomTokenAuthProvider customTokenAuthProvider;

    @Autowired
    private QrCodeRepository qrCodeRepository;

    @Autowired
    public UserController(ResourceLoader resourceLoader){
        this.resourceLoader = resourceLoader;
        if(!Files.exists(Paths.get(ROOT))){
            try{
                Files.createDirectories(Paths.get(ROOT));
            }catch (IOException e){

            }
        }
    }
    /**
     * 退出登录
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }

    @RequestMapping("/count")
    @ResponseBody
    public String count(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Object count = session.getServletContext().getAttribute("count");
        return "count : " + count;
    }

    @RequestMapping("/upload")
    @ResponseBody
    public ResultMsg upload(HttpServletRequest request, HttpServletResponse response, @RequestParam("files[]") MultipartFile[] files){
        logger.error("upload");
        int len = files.length;
        if (len > 0){
            for(int i = 0; i < 1; i++){
                if (!files[0].isEmpty()){
                    try {
                        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSSS");
                        String imgUrl = ROOT + "/" + fmt.format(new Date()) + ".png";
                        Path path = Paths.get(imgUrl);
                        if (!Files.exists(path)){
                            Files.copy(files[i].getInputStream(), path);
                            logger.error(files[0].getName());
                            logger.error(files[0].getOriginalFilename());
                            logger.error(files[0].getContentType());
                        }
                        return new ResultMsg(200, "上传成功", imgUrl);
                    } catch (IOException e) {
                        e.printStackTrace();
                        logger.error(e.getMessage());
                        return new ResultMsg(500, e.getMessage(), null);
                    }
                }
            }
        }
        return new ResultMsg(500, "上传失败，原因未知", null);
    }

    @RequestMapping(method = RequestMethod.GET, value = "users/{filename:.+}")
    @ResponseBody
    public ResponseEntity<?> getFile(@PathVariable String filename) {
        try {
            return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get(ROOT, filename).toString()));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @RequestMapping(method = RequestMethod.GET, value = "users/uuid")
    @ResponseBody
    public Map<String, Object> getUuid(){
        String sid = UuidUtil.getUUID();
        QrCode qrCode = new QrCode();
        qrCode.setSid(sid);
        qrCode.setOk(false);
        qrCodeRepository.save(qrCode);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("type", "login");
        resultMap.put("sid", sid);
        return resultMap;
    }

    //参考https://www.cnblogs.com/huangjiandong2012/p/4026634.html
    @RequestMapping(method = RequestMethod.GET, value = "users/loopCheck/{sid}")
    @ResponseBody
    public ResultMsg loopCheck(@PathVariable String sid,
                               HttpServletRequest request){
        QrCode qrCode = qrCodeRepository.findBySid(sid);
        if (qrCode.getOk()){
            //扫码成功了之后，要做什么
            UsernameTokenAuthenticationToken authToken = new UsernameTokenAuthenticationToken(qrCode.getUsername(), qrCode.getToken(), sid);
            try{
                Authentication authentication = customTokenAuthProvider.authenticate(authToken);
                SecurityContextHolder.getContext().setAuthentication(authentication);
                HttpSession session = request.getSession();
                session.setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());
                return new ResultMsg(200, "扫码成功", qrCode);
            }catch (AuthenticationException e){
                return new ResultMsg(500, e.getMessage(), null);
            }
        }else{
            return new ResultMsg(404, "用户还未扫码", null);
        }
    }
}
