package com.xinmiao.back.controller;

import com.alibaba.fastjson.JSON;
import com.xinmiao.back.domain.Company;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/file")
public class FileController {

    @RequestMapping(value="/upload",method=RequestMethod.POST)
    private String fildUpload(Company company,@RequestParam(value = "sceneNames")String[] sceneNames,
                              @RequestParam(value="bookImage",required=false) MultipartFile[] bookImg,
                              @RequestParam(value="img1",required=false) MultipartFile[] img1,
                              @RequestParam(value="img2",required=false) MultipartFile[] img2,
                              @RequestParam(value="img3",required=false) MultipartFile[] img3,
                              @RequestParam(value="img3",required=false) MultipartFile[] img4,
                              @RequestParam(value="img5",required=false) MultipartFile[] img5,
                              @RequestParam(value="img6",required=false) MultipartFile[] img6,
                              HttpServletRequest request)throws Exception{
        //基本表单
        System.out.println(JSON.toJSONString(company));
        System.out.println(JSON.toJSONString(sceneNames));
        String pathRoot = request.getSession().getServletContext().getRealPath("");
        List<String> img1Paths = save(pathRoot,"img1",img1);
        List<String> img2Paths = save(pathRoot,"img2",img2);
        List<String> img3Paths = save(pathRoot,"img3",img3);
        List<String> img4Paths = save(pathRoot,"img4",img4);
        List<String> img5Paths = save(pathRoot,"img5",img5);
        List<String> img6Paths = save(pathRoot,"img6",img6);
        System.out.println(JSON.toJSONString(img1Paths));
        System.out.println(JSON.toJSONString(img2Paths));
        System.out.println(JSON.toJSONString(img3Paths));
        System.out.println(JSON.toJSONString(img4Paths));
        System.out.println(JSON.toJSONString(img5Paths));
        System.out.println(JSON.toJSONString(img6Paths));
        for(int i = 0;i < sceneNames.length;i++){
            ;
        }
        //request.setAttribute("imagesPathList", listImagePath);
        return "success";
    }

    private List<String> save(String pathRoot,String pos,MultipartFile[] imgs){
       //获得物理路径webapp所在路径
        String path=pos+"/";
        List<String> imgPaths=new ArrayList<String>(); for (MultipartFile img : imgs) {
            if(!img.isEmpty()){
                //生成uuid作为文件名称
                String uuid = UUID.randomUUID().toString().replaceAll("-","");
                //获得文件类型（可以判断如果不是图片，禁止上传）
                String contentType=img.getContentType();
                //获得文件后缀名称
                String imageName=contentType.substring(contentType.indexOf("/")+1);
                path="/static/images/"+pos+uuid+"."+imageName;
                try {
                    img.transferTo(new File(pathRoot + path));
                }catch (IOException ie){
                    ie.printStackTrace();
                }
                imgPaths.add(path);
            }
        }
        return imgPaths;
    }
}
