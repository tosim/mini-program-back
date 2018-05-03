package com.xinmiao.back.controller;

import com.xinmiao.back.domain.Company;
import com.xinmiao.back.domain.InApply;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/admin")
public class AdminController {
    @RequestMapping("/getAllCompany")
    public List<Object> allCompany(){
        return null;
    }

    @RequestMapping("")
    public Boolean inApply(@RequestBody Company company){
        return false;
    }


}
