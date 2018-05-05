package com.xinmiao.back.controller;

import com.xinmiao.back.domain.Comment;
import com.xinmiao.back.domain.Company;
import com.xinmiao.back.domain.Img;
import com.xinmiao.back.mapper.CommentMapper;
import com.xinmiao.back.mapper.CompanyMapper;
import com.xinmiao.back.mapper.UserMapper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/api/pioneer")
public class PioneerController {
    @Resource
    CommentMapper commentMapper;
    @Resource
    CompanyMapper companyMapper;
    @Resource
    UserMapper userMapper;

    //获取所有公司
    @RequestMapping("/getPioneerList")
    public List<Company> pioneerCompanyList(){
        return companyMapper.selectCompanys(1);
    }

    //获取公司详情
    @RequestMapping("/getPioneerDetail")
    public Company pioneerCompany(Integer id,String name){
        if(id == null){
            Integer userId = userMapper.selectByWx(name).getUserId();
            return companyMapper.selectByUserId(userId);
        }
        return companyMapper.selectByPrimaryKey(id);
    }

    //获取公司评论
    @RequestMapping("/getPioneerComment")
    public List<Comment> pioneerComment(Integer id){
        return commentMapper.selectCommentsByCompanyId(id);
    }

    @RequestMapping("/getPioneerImgs")
    public List<Img> pioneerImgs(Integer id){
        return null;
    }



}



