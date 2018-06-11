package com.jeesun.thymelte.controller;

import com.jeesun.thymelte.domain.ResultMsg;
import com.jeesun.thymelte.util.FileUploadUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

/**
 * 上传文件
 *
 * @author simon
 * @create 2018-06-06 2:12
 **/
@Controller
@RequestMapping("uploadFiles")
public class UploadFileController {
    private static Logger logger = Logger.getLogger(UploadFileController.class);

    private final ResourceLoader resourceLoader;

    private final String ROOT = "upload";

    @Autowired
    public UploadFileController(ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
        if(!Files.exists(Paths.get(ROOT))){
            try{
                Files.createDirectories(Paths.get(ROOT));
            }catch (IOException e){
                logger.error(e);
            }
        }
    }

    @RequestMapping(value = "upload", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg post(@RequestParam("file") MultipartFile[] files){
        String[] savedFiles = FileUploadUtil.saveFiles(files);
        if(null == savedFiles || savedFiles.length <= 0){
            return new ResultMsg(404, "保存文件失败", null);
        }else{
            return new ResultMsg(200, "保存文件成功", savedFiles);
        }
    }

    @RequestMapping(value = "uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadTest(@RequestParam("file") MultipartFile[] files){
        Map<String, Object> resultMap = new HashMap<>();
        String[] savedFiles = FileUploadUtil.saveFiles(files);
        if(null == savedFiles || savedFiles.length <= 0){
            resultMap.put("link", null);
        }else{
            StringBuffer filePath = new StringBuffer();
            filePath.append("uploadFiles");
            filePath.append("/file/");
            filePath.append(savedFiles[0]);
            resultMap.put("link", filePath);
        }

        return resultMap;
    }

    @RequestMapping(value = "/file/**", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<?> getFile(HttpServletRequest request, HttpServletResponse response) {
        String filePath = request.getRequestURI();
        //logger.info(filePath);
        filePath = filePath.substring(filePath.indexOf("uploadFiles/file/") + "uploadFiles/file/".length());
        //logger.info(filePath);
        String fileRoot = filePath.substring(0, filePath.lastIndexOf("/"));
        //logger.info(fileRoot);
        String fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
        //logger.info(fileName);
        try {
            return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get(fileRoot, fileName).toString()));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
}
