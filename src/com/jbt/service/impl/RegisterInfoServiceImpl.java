package com.jbt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jbt.bean.RegisterInfo;
import com.jbt.dao.RegisterInfoMapper;
import com.jbt.service.RegisterInfoService;

@Service("RegisterInfoService")
public class RegisterInfoServiceImpl implements RegisterInfoService {
	@Resource
	private RegisterInfoMapper RegisterInfoMapper;
	
	public int deleteByPrimaryKey(Integer id) {
		return this.RegisterInfoMapper.deleteByPrimaryKey(id);
	}
	public int insert(RegisterInfo record) {
		return this.RegisterInfoMapper.insert(record);
	}
	public int insertSelective(RegisterInfo record) {
		return this.RegisterInfoMapper.insertSelective(record);
	}
	public RegisterInfo selectByPrimaryKey(Integer id) {
		return this.RegisterInfoMapper.selectByPrimaryKey(id);
	}
	public int updateByPrimaryKeySelective(RegisterInfo record) {
		return this.RegisterInfoMapper.updateByPrimaryKeySelective(record);
	}
	public int updateByPrimaryKey(RegisterInfo record) {
		return this.RegisterInfoMapper.updateByPrimaryKey(record);
	}
}
