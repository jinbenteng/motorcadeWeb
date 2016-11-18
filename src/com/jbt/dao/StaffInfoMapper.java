package com.jbt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jbt.bean.StaffInfo;

public interface StaffInfoMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(StaffInfo record);

    int insertSelective(StaffInfo record);

    StaffInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StaffInfo record);

    int updateByPrimaryKey(StaffInfo record);

	List<StaffInfo> getPageList(@Param(value="staffInfo") StaffInfo staffInfo, @Param(value="start") int start,@Param(value="pageSize")  int pageSize,@Param(value="managerId") Integer managerId);

	int getCount(@Param(value="staffInfo")StaffInfo staffInfo,@Param(value="managerId") Integer managerId);

	@Select("select * from staff_info where stafftype = 1 and sectorInfo in (select id from sector_info where managerInfo = #{managerId})")
	List<StaffInfo> selectDriver(Integer managerId);
	
	int batchDelete(Integer[] checkId);
}