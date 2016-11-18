package com.jbt.service;

import com.jbt.bean.FaultInfo;

public interface FaultInfoService {

	int deleteByPrimaryKey(Integer id);

    int insert(FaultInfo FaultInfo);

    int insertSelective(FaultInfo FaultInfo);

    FaultInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FaultInfo FaultInfo);

    int updateByPrimaryKey(FaultInfo FaultInfo);

}
