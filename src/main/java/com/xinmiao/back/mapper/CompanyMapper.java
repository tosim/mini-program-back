package com.xinmiao.back.mapper;

import com.xinmiao.back.domain.Company;
import com.xinmiao.back.util.MyMapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CompanyMapper extends MyMapper<Company> {
    @Select("select * from company where company_type = #{type}")
    @ResultMap("BaseResultMap")
    public List<Company> selectCompanys(Integer type);

    @Select("select * from company where user_id = #{userId}")
    @ResultMap("BaseResultMap")
    public Company selectByUserId(Integer userId);
}