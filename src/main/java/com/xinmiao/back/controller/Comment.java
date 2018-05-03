package com.xinmiao.back.controller;

import com.xinmiao.back.domain.SubComment;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/comment")
public class Comment {
    @RequestMapping("")
    public Boolean comment(@RequestBody Comment comment){
        return false;
    }

    @RequestMapping("/subComment")
    public Boolean subComment(@RequestBody SubComment subComment){
        return false;
    }


}
