package com.jbt.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.jbt.bean.ManagerInfo;

public interface ManagerInfoService {

	int deleteByPrimaryKey(Integer id);

    int insert(ManagerInfo managerInfo);

    int insertSelective(ManagerInfo managerInfo);

    ManagerInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ManagerInfo managerInfo);

    int updateByPrimaryKey(ManagerInfo managerInfo);
    
    List<ManagerInfo> selectByPage(int startPos,int pageSize);  
    
    int getCount();

	ManagerInfo selectByName(String username);

	JSONObject regist(HttpServletRequest request);

	JSONObject managerLogin(HttpServletRequest request);

	int resetPwdByTel(String tel, String password);

	ManagerInfo selectByNameAndTel(ManagerInfo manager);

}
