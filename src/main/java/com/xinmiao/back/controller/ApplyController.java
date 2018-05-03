package com.xinmiao.back.controller;

import com.xinmiao.back.domain.Apply;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/apply")
public class ApplyController {


    @RequestMapping("")
    public Boolean apply(@RequestBody Apply apply){
        return false;
    }

    @RequestMapping("/getApplyList")
    public List<Apply> applyList(){
        return null;
    }

    @RequestMapping("/agree")
    public Boolean agreeApply(Integer id){
        return false;
    }

    @RequestMapping("/disagree")
    public Boolean disagreeApply(Integer id){
        return false;
    }
}
