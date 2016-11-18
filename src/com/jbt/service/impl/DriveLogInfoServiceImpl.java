package com.jbt.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jbt.bean.DriveLogInfo;
import com.jbt.dao.DriveLogInfoMapper;
import com.jbt.service.DriveLogInfoService;
import com.jbt.util.Page;
import com.jbt.util.SessionUtil;

@Service("DriveLogInfoService")
public class DriveLogInfoServiceImpl implements DriveLogInfoService {
	@Resource
	private DriveLogInfoMapper DriveLogInfoMapper;
	
	public int deleteByPrimaryKey(Integer id) {
		return this.DriveLogInfoMapper.deleteByPrimaryKey(id);
	}

	public int insert(DriveLogInfo record) {
		return this.DriveLogInfoMapper.insert(record);
	}

	public int insertSelective(DriveLogInfo record) {
		return this.DriveLogInfoMapper.insertSelective(record);
	}

	public DriveLogInfo selectByPrimaryKey(Integer id) {
		return this.DriveLogInfoMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(DriveLogInfo record) {
		return this.DriveLogInfoMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(DriveLogInfo record) {
		return this.DriveLogInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public Page getPageList(DriveLogInfo DriveLogInfo,Integer pageNow,Integer sectorId) {
		int start = (pageNow-1) * (Page.PSize);
		//获取页面数据
		Integer managerId = SessionUtil.getManagerId();
		List<DriveLogInfo> list = this.DriveLogInfoMapper.getPageList(DriveLogInfo,start,Page.PSize,managerId,sectorId);
		int count = this.DriveLogInfoMapper.getCount(DriveLogInfo,managerId,sectorId);//根据参数获取对应消息的总条数
		return new Page(list,pageNow,count);
	}

	@Override
	public int batchDelete(Integer[] checkId) {
		// TODO Auto-generated method stub
		return this.DriveLogInfoMapper.batchDelete(checkId);
	}
	

	@Override
	public List<DriveLogInfo> selectAll() {
		// TODO Auto-generated method stub
		return this.DriveLogInfoMapper.selectAll();
	}

	@Override
	public List<Map<String, Object>> selectTotalOil(String startTime,
			String endTime, Integer sectorId) {
		// TODO Auto-generated method stub
		return this.DriveLogInfoMapper.selectTotalOil(startTime,endTime,sectorId,SessionUtil.getManagerId());
	}

	@Override
	public List<Map<String, Object>> selectStatistical_car(String startTime,
			String endTime, String sn,Integer dateType) {
		// TODO Auto-generated method stub
		return this.DriveLogInfoMapper.selectStatistical_car(startTime, endTime,sn,dateType);
	}
	

}
