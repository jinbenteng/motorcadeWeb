package com.jbt.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.jbt.bean.UseCarInfo;
import com.jbt.dao.UseCarInfoMapper;
import com.jbt.service.UseCarInfoService;
import com.jbt.util.DateUtil;
import com.jbt.util.Page;
import com.jbt.util.SessionUtil;

@Service("UseCarInfoService")
public class UseCarInfoServiceImpl implements UseCarInfoService {
	private final Logger log = LoggerFactory.getLogger(UseCarInfoServiceImpl.class);
	@Resource
	private UseCarInfoMapper UseCarInfoMapper;
	
	public int deleteByPrimaryKey(Integer id) {

		return this.UseCarInfoMapper.deleteByPrimaryKey(id);
	}

	public int insert(UseCarInfo record) {

		return this.UseCarInfoMapper.insert(record);
	}

	public int insertSelective(UseCarInfo record) {

		return this.UseCarInfoMapper.insertSelective(record);
	}

	public UseCarInfo selectByPrimaryKey(Integer id) {

		return this.UseCarInfoMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(UseCarInfo record) {

		return this.UseCarInfoMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(UseCarInfo record) {

		return this.UseCarInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public Page getPageList(UseCarInfo useCarInfo,Integer pageNow) {
		int start = (pageNow-1) * (Page.PSize);
		//获取页面数据
		Integer id = SessionUtil.getManagerId();
		List<?> list = this.UseCarInfoMapper.getPageList(useCarInfo,start,Page.PSize,id);
		int count = this.UseCarInfoMapper.getCount(useCarInfo,id);//根据参数获取对应消息的总条数
		return new Page(list,pageNow,count);
	}

	@Override
	public int batchDelete(Integer[] checkId) {
		// TODO Auto-generated method stub
		return this.UseCarInfoMapper.batchDelete(checkId);
	}

	@Override
	public int batchFinish(Integer[] checkId) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("endTime", DateUtil.getNow());
		params.put("checkId", checkId);
		//释放被占用车辆
		this.UseCarInfoMapper.releaseCar(checkId);
		return this.UseCarInfoMapper.batchFinish(params);
	}
	
	
}
