package com.jeesun.thymelte.controller;

import com.jeesun.thymelte.custom.CustomTokenAuthProvider;
import com.jeesun.thymelte.custom.UsernameTokenAuthenticationToken;
import com.jeesun.thymelte.domain.*;
import com.jeesun.thymelte.repository.*;
import com.jeesun.thymelte.util.UuidUtil;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.regex.Pattern;

@Controller
public class UserController {
    private static Logger logger = Logger.getLogger(UserController.class);

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
    private ResetPasswordInfoRepository resetPasswordInfoRepository;

    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String sender; //读取配置文件中的参数

    @Autowired
    private AmqpTemplate amqpTemplate;
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
    public Map<String, Object> getUsers(@RequestParam(required = false, defaultValue = "10") Integer limit, @RequestParam(required = false, defaultValue = "0") Integer offset){
        Map<String, Object> resultMap = new LinkedHashMap<>();
        resultMap.put("total", userDomainRepository.countAllByAuthority());
        resultMap.put("rows", userDomainRepository.findAllByAuthority(offset, limit));

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

    @RequestMapping(value = "/users/forgetPwd", method = RequestMethod.GET)
    public String forgetPwd(Model model, HttpServletRequest request, HttpServletResponse response){
        model.addAttribute("step", 1);
        return "forward:/forget_password";
    }

    //参考https://blog.csdn.net/qq_35447305/article/details/53224171
    @ApiOperation(value = "重置密码页面")
    @RequestMapping(value = "/users/resetPassword", method = RequestMethod.GET)
    public ModelAndView resetPasswordResult(@RequestParam String sid,
                                      @RequestParam Long id,
                                      HttpServletRequest request,
                                      HttpServletResponse response){
        ModelAndView mav = new ModelAndView("forget_password");
        ResultMsg resultMsg = checkSidAndId(sid, id);

        if(200 == resultMsg.getCode()){
            ResetPasswordInfo resetPasswordInfo = (ResetPasswordInfo) resultMsg.getData();

            UserDomain userDomain = userDomainRepository.findById(resetPasswordInfo.getUserId());

            mav.addObject("sid", sid);
            mav.addObject("id", id);
            mav.addObject("userDomain", userDomain);
            mav.addObject("step", 3);
        }else{
            mav.addObject("step", -1);
            mav.addObject("resultMsg", resultMsg);
        }

        return mav;
    }

    //不应该传username，用户可能会通过该接口篡改其他用户的密码
    //应该隐式地传上一步的sid，再做一次验证。这是必要的。
    @RequestMapping(value = "/users/resetPwd", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView resetPwd(@RequestParam String sid, @RequestParam Long id, @RequestParam String newPwd){
        ModelAndView mav = new ModelAndView("forget_password");
        ResultMsg resultMsg = checkSidAndId(sid, id);

        if(200 == resultMsg.getCode()){
            UserDomain userDomain = userDomainRepository.findById(id);
            userDomain.setPassword(new BCryptPasswordEncoder(11).encode(newPwd));
            userDomain = userDomainRepository.save(userDomain);

            ResetPasswordInfo resetPasswordInfo = (ResetPasswordInfo) resultMsg.getData();
            resetPasswordInfo.setValid(false);
            resetPasswordInfo = resetPasswordInfoRepository.save(resetPasswordInfo);

            mav.addObject("resultMsg", new ResultMsg(200, "改密成功"));
            mav.addObject("step", 4);
        }else{
            logger.warn(resultMsg.getMessage());
            mav.addObject("step", -1);
            mav.addObject("resultMsg", resultMsg);
        }
        return mav;
    }

    @ApiOperation(value = "检查用户是否存在")
    @RequestMapping(value = "/users/check", method = RequestMethod.POST)
    public String check(
            @RequestParam String name,
            HttpServletRequest request,
            HttpServletResponse response,
            RedirectAttributes attributes){
        UserDomain userDomain = userDomainRepository.findByUsernameOrEmail(name, name);
        if(null != userDomain){
            attributes.addAttribute("step", 2);
            attributes.addAttribute("username", userDomain.getUsername());
            attributes.addAttribute("email", userDomain.getEmail());
            amqpTemplate.convertAndSend("email", userDomain.getUsername());
        }else{
            logger.error("用户不存在");
            attributes.addAttribute("step", -1);
            attributes.addAttribute("errorMsg", "用户名不存在");
        }
        return "redirect:/forget_password";
    }

    @RequestMapping(value = "/users/sendEmail", method = RequestMethod.GET)
    @ResponseBody
    public ResultMsg resendEmail(@RequestParam String username,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
        amqpTemplate.convertAndSend("email", username);
        return new ResultMsg(200, "邮件发送成功");
    }


    //根据用户名或者邮箱发送重置密码邮件
    public ResultMsg sendEmail(String username){
        //生成密钥
        String secretKey = UUID.randomUUID().toString();

        //设置过期时间
        Date expiresIn = new Date(System.currentTimeMillis() + 30 * 60 * 1000);//30分钟后过期

        //正则表达式验证是否是邮箱
        String regex = "^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.[a-zA-Z0-9]{2,6}$";

        UserDomain userDomain = null;
        //是邮箱就查找邮箱对应的用户信息，找不到尝试查找用户名对应的用户信息
        if(Pattern.matches(regex, username)){
            userDomain = userDomainRepository.findByEmail(username);
        }
        if (null == userDomain){
            userDomain = userDomainRepository.findByUsername(username);
        }

        if(null != userDomain){
            StringBuffer sb = new StringBuffer();

            sb.append(userDomain.getId());
            sb.append("$");
            sb.append(expiresIn.getTime() / 1000 * 1000);//忽略毫秒数，因为MySQL取出时间是忽略毫秒数的
            sb.append("$");
            sb.append(secretKey);
            String digitalSignature = DigestUtils.md5Hex(sb.toString());

            //保存重置密码的邮件信息
            ResetPasswordInfo resetPasswordInfo = resetPasswordInfoRepository.getByUserId(userDomain.getId());
            if(null == resetPasswordInfo){
                resetPasswordInfo = new ResetPasswordInfo();
            }
            resetPasswordInfo.setUserId(userDomain.getId());
            resetPasswordInfo.setExpiresIn(expiresIn);
            resetPasswordInfo.setSecretKey(secretKey);
            resetPasswordInfo.setValid(true);
            resetPasswordInfo = resetPasswordInfoRepository.save(resetPasswordInfo);

            /*String path=request.getContextPath();
            logger.info("path = " + path);

            String basePath = request.getScheme() + "://"+request.getServerName() + ":" + request.getServerPort() + path;*/
            String basePath = "http://localhost:8099";
            logger.info("basePath = " + basePath);

            StringBuffer emailContent = new StringBuffer();
            emailContent.append("请勿回复本邮件.点击下面的链接,重设密码,本邮件超过30分钟,链接将会失效，需要重新申请找回密码。");
            emailContent.append(basePath + "/users/resetPassword?sid=" + digitalSignature + "&id=" + userDomain.getId());

            //如果用户未绑定邮箱，则无法修改密码，提示联系管理员
            if(StringUtils.isEmpty(userDomain.getEmail())){
                return new ResultMsg(404, "您未绑定邮箱，请联系管理员修改密码。");
            }

          //发送邮件
            //此处耗时很长，可以考虑使用MQ异步，立即返回发送成功的默认结果。
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(sender);
            message.setTo(userDomain.getEmail());
            message.setSubject("主题：密码重置");
            message.setText(emailContent.toString());
            mailSender.send(message);

            logger.info("邮件发送成功，请注意查收。");
            return new ResultMsg(200, "邮件发送成功，请注意查收。");
        }else{
            logger.error("该用户不存在");
            return new ResultMsg(404, "该用户不存在");
        }
    }

    /**
     * 检查重置密码邮件链接参数
     * @param sid
     * @param id
     * @return
     */
    private ResultMsg checkSidAndId(String sid, Long id){
        if (StringUtils.isEmpty(sid) || null == id){
            logger.error("请求的链接不正确,请重新操作。");
            return new ResultMsg(404, "请求的链接不正确,请重新操作。");
        }

        ResetPasswordInfo resetPasswordInfo = resetPasswordInfoRepository.getByUserId(id);

        if (null == resetPasswordInfo){
            logger.info("请求的链接不正确,请重新操作。");
            return new ResultMsg(404, "请求的链接不正确,请重新操作。");
        }

        //如果密钥过期
        if(resetPasswordInfo.getExpiresIn().getTime() <= System.currentTimeMillis()){
            logger.info("密钥已过期");

            return new ResultMsg(404, "密钥已过期");
        }

        StringBuilder sb = new StringBuilder();

        sb.append(resetPasswordInfo.getUserId());
        sb.append("$");
        sb.append(resetPasswordInfo.getExpiresIn().getTime() / 1000 * 1000);//忽略毫秒数，因为MySQL取出时间是忽略毫秒数的
        sb.append("$");
        sb.append(resetPasswordInfo.getSecretKey());
        String digitalSignature = DigestUtils.md5Hex(sb.toString());

        if (!sid.equals(digitalSignature)){
            logger.info("链接加密密码不正确");

            return new ResultMsg(404, "请求的链接不正确,请重新操作。");
        }

        if(!resetPasswordInfo.isValid()){
            logger.info("您已通过该链接修改密码，该链接已失效");
            return new ResultMsg(404, "您已通过该链接修改密码，该链接已失效");
        }

        return new ResultMsg(200, "sid和id有效", resetPasswordInfo);
    }
}
