package com.xinmiao.back.mapper;

import com.xinmiao.back.domain.User;
import com.xinmiao.back.util.MyMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserMapper extends MyMapper<User> {
    @Select("select * from user where telephone_number=#{telephone}")
    @ResultMap("BaseResultMap")
    public User selectByTelephone(String telephone);

    @Update("update user set token=#{token} where telephone_number=#{telephone}")
    public int updateTokenByTelephone(@Param("token") String token, @Param("telephone") String telephone);
}
