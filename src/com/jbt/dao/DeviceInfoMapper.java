package com.jbt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.jbt.bean.DeviceInfo;

public interface DeviceInfoMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(DeviceInfo record);

    int insertSelective(DeviceInfo record);

    DeviceInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DeviceInfo record);

    int updateByPrimaryKey(DeviceInfo record);
    
    // and sectorInfo in (select id from sector_info where managerInfo = #{managerId})")
    @Select("select sn from device_info where sn like concat(#{sn},'%') and state = 0")
	List<String> getDeviceSn(String sn);

    @Update("update device_info set state = 1 where sn = #{sn}")
	int changeStateBySn(String sn); 
}