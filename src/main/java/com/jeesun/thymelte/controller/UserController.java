package com.jeesun.thymelte.controller;

import com.jeesun.thymelte.custom.CustomTokenAuthProvider;
import com.jeesun.thymelte.custom.UsernameTokenAuthenticationToken;
import com.jeesun.thymelte.domain.*;
import com.jeesun.thymelte.repository.AuthorityRepository;
import com.jeesun.thymelte.repository.QrCodeRepository;
import com.jeesun.thymelte.repository.UserDomainRepository;
import com.jeesun.thymelte.repository.UserInfoRepository;
import com.jeesun.thymelte.util.UuidUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
import java.util.LinkedHashMap;
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
    private UserDomainRepository userDomainRepository;

    @Autowired
    private AuthorityRepository authorityRepository;

    @Autowired
    private UserInfoRepository userInfoRepository;

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

    @RequestMapping(method = RequestMethod.GET, value = "/users/all")
    @ResponseBody
    public Map<String, Object> getUsers(@RequestParam(required = false) Integer limit, @RequestParam(required = false) Integer offset){
        Map<String, Object> resultMap = new LinkedHashMap<>();
        if(null != limit && null != offset){
            resultMap.put("total", userDomainRepository.count());
            resultMap.put("rows", userDomainRepository.findAll(new PageRequest(offset/limit, limit, new Sort(Sort.Direction.DESC, "id"))).getContent());
        }else{
            resultMap.put("total", userDomainRepository.count());
            resultMap.put("rows", userDomainRepository.findAll());
        }

        return resultMap;
    }

    @PreAuthorize("hasRole('ADMIN')")
    @RequestMapping(method = RequestMethod.POST, value = "/users/{id}/ban")
    @ResponseBody
    public ResultMsg ban(@PathVariable Long id){
        UserDomain userDomain = userDomainRepository.findById(id);
        userDomain.setEnabled(false);
        userDomain = userDomainRepository.save(userDomain);
        if(!userDomain.isEnabled()){
            return new ResultMsg(200, "封号成功");
        }else{
            return new ResultMsg(404, "封号失败");
        }
    }

    @PreAuthorize("hasRole('ADMIN')")
    @RequestMapping(method = RequestMethod.POST, value = "/users/{id}/unban")
    @ResponseBody
    public ResultMsg unban(@PathVariable Long id){
        UserDomain userDomain = userDomainRepository.findById(id);
        userDomain.setEnabled(true);
        userDomain = userDomainRepository.save(userDomain);
        if(userDomain.isEnabled()){
            return new ResultMsg(200, "解封成功");
        }else{
            return new ResultMsg(404, "解封失败");
        }
    }

    @RequestMapping(method = RequestMethod.POST, value = "/users/register")
    public String register(@RequestParam String username, @RequestParam String password){
        UserDomain userDomain = userDomainRepository.findByUsername(username);
        if(null == userDomain){
            userDomain = new UserDomain();
            userDomain.setUsername(username);
            PasswordEncoder encoder = new BCryptPasswordEncoder(11);//密码加密
            userDomain.setPassword(encoder.encode(password));
            userDomain.setEnabled(true);
            userDomain = userDomainRepository.save(userDomain);

            logger.info(userDomain);

            Authority authority = new Authority();
            authority.setUsername(username);
            authority.setAuthority("ROLE_USER");
            authority = authorityRepository.save(authority);

            UserInfo userInfo = new UserInfo();
            userInfo.setUserId(userDomain.getId());
            userInfo.setUsername(username);
            userInfo = userInfoRepository.save(userInfo);

            return "redirect:/register_result?success";
        }else{
            return "redirect:/register_result?usernameExists";
        }
    }
}
