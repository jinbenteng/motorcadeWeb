package com.jbt.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jbt.bean.DriveLogInfo;

public interface DriveLogInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DriveLogInfo record);

    int insertSelective(DriveLogInfo record);

    DriveLogInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DriveLogInfo record);

    int updateByPrimaryKey(DriveLogInfo record);
    
	List<DriveLogInfo> getPageList(@Param(value="driveLogInfo") DriveLogInfo driveLogInfo,@Param(value="start") int start,@Param(value="pageSize") int pageSize,@Param(value="managerId") Integer managerId,@Param(value="sectorId") Integer sectorId);

	int getCount(@Param(value="driveLogInfo") DriveLogInfo driveLogInfo,@Param(value="managerId") Integer managerId,@Param(value="sectorId") Integer sectorId);
	
	@Select("select * from drive_log_info")
	List<DriveLogInfo> selectAll();

	int batchDelete(Integer[] checkId);

	List<Map<String, Object>> selectTotalOil(
			@Param(value="startTime") String startTime,
			@Param(value="endTime") String endTime,
			@Param(value="sectorId") Integer sectorId, 
			@Param(value="managerId") Integer managerId);

	List<Map<String, Object>> selectStatistical_car(
			@Param(value="startTime")String startTime,
			@Param(value="endTime")String endTime, 
			@Param(value="sn")String sn,
			@Param(value="dateType")Integer dateType);
}