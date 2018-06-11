package com.jeesun.thymelte.util;

import com.alibaba.fastjson.JSON;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * 文件上传工具类
 *
 * @author simon
 * @create 2018-06-06 5:18
 **/

public class FileUploadUtil {
    private static Logger logger = Logger.getLogger(FileUploadUtil.class);
    private static final String ROOT = "fileUpload";

    public FileUploadUtil(){

    }

    public static String[] saveFiles(MultipartFile[] files){
        if(!Files.exists(Paths.get(ROOT))){
            try{
                Files.createDirectories(Paths.get(ROOT));
            }catch (IOException e){
                logger.error(e);
            }
        }

        int len = files.length;
        if (len > 0){
            String[] imgUrlArr = new String[len];
            for(int i = 0; i < len; i++){
                if (!files[i].isEmpty()){
                    try {
                        //SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSSS");
                        String originFileName = files[i].getOriginalFilename();
                        //String fileType = originFileName.substring(originFileName.lastIndexOf("."));
                        //logger.info("originFileName=" + originFileName);
                        //logger.info("fileType=" + fileType);
                        //String imgUrl = ROOT + "/" + fmt.format(new Date()) + fileType;

                        String imgUrl = ROOT + "/" + originFileName;
                        Path path = Paths.get(imgUrl);
                        if (!Files.exists(path)){
                            Files.copy(files[i].getInputStream(), path);
                            //logger.info(files[i].getName());
                            //logger.info(files[i].getOriginalFilename());
                            //logger.info(files[i].getContentType());
                        }
                        imgUrlArr[i] = imgUrl;
                    } catch (IOException e) {
                        e.printStackTrace();
                        logger.error(e.getMessage());
                    }
                }
            }
            logger.info(JSON.toJSONString(imgUrlArr));
            return imgUrlArr;
        }else{
            return null;
        }
    }
}
