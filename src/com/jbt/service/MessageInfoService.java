package com.jbt.service;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.jbt.bean.MessageInfo;

public interface MessageInfoService {

	int deleteByPrimaryKey(Integer id);

    int insert(MessageInfo managerInfo);

    int insertSelective(MessageInfo managerInfo);

    MessageInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MessageInfo managerInfo);

    int updateByPrimaryKey(MessageInfo managerInfo);

	JSONObject getTelMessageCode(HttpServletRequest request);
    

}
