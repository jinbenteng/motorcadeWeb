package com.jbt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.jbt.bean.StaffInfo;
import com.jbt.dao.StaffInfoMapper;
import com.jbt.service.StaffInfoService;
import com.jbt.util.Page;
import com.jbt.util.SessionUtil;

@Service("StaffInfoService")
public class StaffInfoServiceImpl implements StaffInfoService {
	private final Logger log = LoggerFactory.getLogger(StaffInfoServiceImpl.class);
	@Resource
	private StaffInfoMapper StaffInfoMapper;
	
	public int deleteByPrimaryKey(Integer id) {

		return this.StaffInfoMapper.deleteByPrimaryKey(id);
	}

	public int insert(StaffInfo record) {

		return this.StaffInfoMapper.insert(record);
	}

	public int insertSelective(StaffInfo record) {

		return this.StaffInfoMapper.insertSelective(record);
	}

	public StaffInfo selectByPrimaryKey(Integer id) {

		return this.StaffInfoMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(StaffInfo record) {

		return this.StaffInfoMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(StaffInfo record) {

		return this.StaffInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	
	public Page getPageList(StaffInfo staffInfo,Integer pageNow) {
		int start = (pageNow-1) * (Page.PSize);
		//获取页面数据
		Integer id = SessionUtil.getManagerId();
		List<StaffInfo> list = this.StaffInfoMapper.getPageList(staffInfo,start,Page.PSize,id);
		int count = this.StaffInfoMapper.getCount(staffInfo,id);//根据参数获取对应消息的总条数
		return new Page(list,pageNow,count);
	}
	
	

	@Override
	public List<StaffInfo> selectDriver() {
		// TODO Auto-generated method stub
		return this.StaffInfoMapper.selectDriver(SessionUtil.getManagerId());
	}
	
	@Override
	public int batchDelete(Integer[] checkId) {
		// TODO Auto-generated method stub
		return this.StaffInfoMapper.batchDelete(checkId);
	}

}
