package com.xinmiao.back.controller;

import com.xinmiao.back.domain.InApply;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/inApply")
public class InApplyController {
    @RequestMapping("")
    public Boolean inApply(@RequestBody  InApply inApply){

        return false;
    }

    @RequestMapping("/getInapplyList")
    public List<InApply> inapplyList(){
        return null;
    }

    @RequestMapping("/agree")
    public Boolean agreeInApply(Integer id){
        return false;
    }

    @RequestMapping("/disagree")
    public Boolean disagreeInApply(Integer id){
        return false;
    }
}
