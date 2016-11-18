package com.jbt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jbt.bean.FaultInfo;
import com.jbt.dao.FaultInfoMapper;
import com.jbt.service.FaultInfoService;

@Service("FaultInfoService")
public class FaultInfoServiceImpl implements FaultInfoService {
	
	@Resource
	private FaultInfoMapper FaultInfoMapper;
	
	public int deleteByPrimaryKey(Integer id) {
		return this.FaultInfoMapper.deleteByPrimaryKey(id);
	}

	public int insert(FaultInfo record) {
		return this.FaultInfoMapper.insert(record);
	}

	public int insertSelective(FaultInfo record) {
		return this.FaultInfoMapper.insertSelective(record);
	}

	public FaultInfo selectByPrimaryKey(Integer id) {
		return this.FaultInfoMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(FaultInfo record) {
		return this.FaultInfoMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(FaultInfo record) {
		return this.FaultInfoMapper.updateByPrimaryKey(record);
	}
}
