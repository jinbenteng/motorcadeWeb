package com.jbt.dao;

import com.jbt.bean.RegisterInfo;

public interface RegisterInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RegisterInfo record);

    int insertSelective(RegisterInfo record);

    RegisterInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RegisterInfo record);

    int updateByPrimaryKey(RegisterInfo record);
}