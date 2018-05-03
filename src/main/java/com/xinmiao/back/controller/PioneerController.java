package com.xinmiao.back.controller;

import com.xinmiao.back.domain.Comment;
import com.xinmiao.back.domain.Img;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/pioneer")
public class PioneerController {

    //获取所有公司
    @RequestMapping("/getPioneerList")
    public List<PioneerCompany> pioneerCompanyList(){
        return null;
    }

    //获取公司详情
    @RequestMapping("/getPioneerDetail")
    public PioneerCompany pioneerCompany(Integer id,String name){

        return null;
    }

    //获取公司评论
    @RequestMapping("/getPioneerComment")
    public List<Comment> pioneerComment(Integer id){

        return null;
    }

    //获取公司评论
    @RequestMapping("/getPioneerComment")
    public List<Img> pioneerImgs(Integer id){
        return null;
    }


}



