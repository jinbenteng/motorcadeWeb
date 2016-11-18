package com.jbt.service;

import java.util.List;
import java.util.Map;

import com.jbt.bean.DriveLogInfo;
import com.jbt.util.Page;

public interface DriveLogInfoService {

	int deleteByPrimaryKey(Integer id);

    int insert(DriveLogInfo DriveLogInfo);

    int insertSelective(DriveLogInfo DriveLogInfo);

    DriveLogInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DriveLogInfo DriveLogInfo);

    int updateByPrimaryKey(DriveLogInfo DriveLogInfo);

	Page getPageList(DriveLogInfo DriveLogInfo, Integer pageNow,Integer sectorId);

	List<DriveLogInfo> selectAll();
	
	int batchDelete(Integer[] checkId);

	List<Map<String, Object>> selectTotalOil(String startTime, String endTime,
			Integer sectorId);

	List<Map<String, Object>> selectStatistical_car(String startTime,
			String endTime, String sn,Integer dateType);


}
