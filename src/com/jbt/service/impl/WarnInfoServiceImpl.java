package com.jbt.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jbt.bean.CrawlInfo;
import com.jbt.bean.WarnInfo;
import com.jbt.dao.WarnInfoMapper;
import com.jbt.service.WarnInfoService;
import com.jbt.util.Page;
import com.jbt.util.SessionUtil;

@Service("WarnInfoService")
public class WarnInfoServiceImpl implements WarnInfoService {
	@Resource
	private WarnInfoMapper WarnInfoMapper;
	
	public int deleteByPrimaryKey(Integer id) {
		return this.WarnInfoMapper.deleteByPrimaryKey(id);
	}

	public int insert(WarnInfo record) {
		return this.WarnInfoMapper.insert(record);
	}

	public int insertSelective(WarnInfo record) {
		return this.WarnInfoMapper.insertSelective(record);
	}

	public WarnInfo selectByPrimaryKey(Integer id) {
		return this.WarnInfoMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(WarnInfo record) {
		return this.WarnInfoMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(WarnInfo record) {
		return this.WarnInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Map<?, ?>> searchByManager(CrawlInfo crawlInfo,Integer managerId) {
		Integer id = SessionUtil.getManagerId();
		List<Map<?, ?>> list = this.WarnInfoMapper.getPageList(crawlInfo,managerId);
		return list;
	}

	@Override
	public int getMaxId(CrawlInfo crawlInfo, Integer manager) {
		// TODO Auto-generated method stub
		Integer maxId = this.WarnInfoMapper.getMaxId(crawlInfo, manager);
		if(maxId == null)
			return 0;
		return maxId;
	}

	@Override
	public List<Map<?, ?>> getMaxList(CrawlInfo crawlInfo, Integer manager,
			Integer maxId) {
		// TODO Auto-generated method stub
		return this.WarnInfoMapper.getMaxList(crawlInfo, manager, maxId);
	}	

}
