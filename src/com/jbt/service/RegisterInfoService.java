package com.jbt.service;

import com.jbt.bean.RegisterInfo;

public interface RegisterInfoService {

	int deleteByPrimaryKey(Integer id);

    int insert(RegisterInfo RegisterInfo);

    int insertSelective(RegisterInfo RegisterInfo);

    RegisterInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RegisterInfo RegisterInfo);

    int updateByPrimaryKey(RegisterInfo RegisterInfo);

}
