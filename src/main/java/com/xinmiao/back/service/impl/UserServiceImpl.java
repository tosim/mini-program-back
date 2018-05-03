package com.xinmiao.back.service.impl;

import com.xinmiao.back.config.shiro.realm.SupportedLoginType;
import com.xinmiao.back.config.shiro.realm.UsernamePasswordLoginTypeToken;
import com.xinmiao.back.domain.User;
import com.xinmiao.back.dto.RegisterUser;
import com.xinmiao.back.mapper.UserMapper;
import com.xinmiao.back.service.UserService;
import com.xinmiao.back.util.RedisUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;
    @Resource
    private RedisUtils redisUtils;


    public Boolean register(RegisterUser registerUser) {
        if(registerUser.getTelephoneNumber() == null || registerUser.getVeCode() == null){
            return false;
        }

        User existUser = userMapper.selectByTelephone(registerUser.getTelephoneNumber());
        if(existUser != null){
            return false;
        }

        User insertUser = new User();
        insertUser.setTelephoneNumber(registerUser.getTelephoneNumber());
        userMapper.insertSelective(insertUser);
        Subject subject = SecurityUtils.getSubject();
        String cachedVeCode = (String)redisUtils.get("sys_cached_vecode:"+insertUser.getTelephoneNumber());
        UsernamePasswordLoginTypeToken token = new UsernamePasswordLoginTypeToken(insertUser.getTelephoneNumber(), cachedVeCode,SupportedLoginType.TelephoneAndVerifyCode.getCode());
        return true;
    }

    @Override
    public Boolean updateUserBaseInfoById(User user) {
        return null;
    }

    @Override
    public Boolean rechargeById(Integer userId, BigDecimal number) {
        return null;
    }

    @Override
    public Boolean withdrawById(Integer userId, BigDecimal number) {
        return null;
    }
}
