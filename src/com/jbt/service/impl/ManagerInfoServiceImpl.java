package com.jbt.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.jbt.bean.ManagerInfo;
import com.jbt.controller.ServiceController;
import com.jbt.dao.ManagerInfoMapper;
import com.jbt.service.ManagerInfoService;
import com.jbt.util.ConfigUtil;
import com.jbt.util.Constant;
import com.jbt.util.DateUtil;

@Service("ManagerInfoService")
public class ManagerInfoServiceImpl implements ManagerInfoService {
	private final Logger log = LoggerFactory.getLogger(ManagerInfoServiceImpl.class);
	@Resource
	private ManagerInfoMapper ManagerInfoMapper;
	
	public int deleteByPrimaryKey(Integer id) {

		return this.ManagerInfoMapper.deleteByPrimaryKey(id);
	}

	public int insert(ManagerInfo record) {

		return this.ManagerInfoMapper.insert(record);
	}

	public int insertSelective(ManagerInfo record) {

		return this.ManagerInfoMapper.insertSelective(record);
	}

	public ManagerInfo selectByPrimaryKey(Integer id) {

		return this.ManagerInfoMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(ManagerInfo record) {

		return this.ManagerInfoMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(ManagerInfo record) {

		return this.ManagerInfoMapper.updateByPrimaryKey(record);
	}

	public List<ManagerInfo> selectByPage(int startPos, int pageSize) {

		return this.ManagerInfoMapper.selectByPage(startPos, pageSize);
	}

	public int getCount() {

		return this.ManagerInfoMapper.getCount();
	}

	@Override
	public ManagerInfo selectByName(String username) {
		return this.ManagerInfoMapper.selectByName(username);
	}
	
	@Override
	public int resetPwdByTel(String tel, String password) {
		// TODO Auto-generated method stub
		return this.ManagerInfoMapper.resetPwdByTel(tel,password);
	}

	@Override
	public JSONObject regist(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public JSONObject managerLogin(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ManagerInfo selectByNameAndTel(ManagerInfo manager) {
		// TODO Auto-generated method stub
		return this.ManagerInfoMapper.selectByNameAndTel(manager);
	}

	

}
