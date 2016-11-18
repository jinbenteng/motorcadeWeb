package com.jbt.service;

import java.util.List;

import com.jbt.bean.StaffInfo;
import com.jbt.util.Page;

public interface StaffInfoService {

	int deleteByPrimaryKey(Integer id);

    int insert(StaffInfo staffInfo);

    int insertSelective(StaffInfo staffInfo);

    StaffInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StaffInfo staffInfo);

    int updateByPrimaryKey(StaffInfo staffInfo);

	Page getPageList(StaffInfo staffInfo, Integer pageNow);

	List<StaffInfo> selectDriver();
    
	int batchDelete(Integer[] checkId);

}
