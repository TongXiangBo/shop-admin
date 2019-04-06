package com.fh.shop.backend.controller.file;

import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.util.TengXunYun;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;

@RestController
public class FileController {


    @RequestMapping(value ="/file/uploadFile", method = RequestMethod.POST)
    public ServerResponse uploadFile(@RequestParam("uploadfile") MultipartFile uploadfile, HttpServletRequest request){

        /* 方法一*/
       /* String copyFile=null;
        try {
            String realPath = request.getServletContext().getRealPath("/image");

            InputStream inputStream = uploadfile.getInputStream();
            copyFile = FileUtil.copyFile(inputStream, uploadfile.getOriginalFilename(), realPath );

        } catch (IOException e) {
            e.printStackTrace();
        }*/




       // return ServerResponse.success(copyFile);

        /* 方法二*/

        //String url = TengXunYun.postImage(uploadfile);
        /* 方法三*/
        InputStream inputStream=null;
        try {
            inputStream = uploadfile.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(uploadfile.getOriginalFilename());
        String url = TengXunYun.postImage(inputStream, uploadfile.getOriginalFilename());

        return ServerResponse.success(url);
    }



}
