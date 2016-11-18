package com.jbt.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.jbt.bean.UseCarInfo;

public interface UseCarInfoMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(UseCarInfo record);

    int insertSelective(UseCarInfo record);

    UseCarInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UseCarInfo record);

    int updateByPrimaryKey(UseCarInfo record);

	List<?> getPageList(@Param(value="useCarInfo") UseCarInfo useCarInfo,@Param(value="start") int start,@Param(value="pageSize")  int pageSize,@Param(value="managerId") Integer managerId);

	int getCount(@Param(value="useCarInfo") UseCarInfo useCarInfo,@Param(value="managerId") Integer managerId);

	int batchDelete(Integer[] checkId);

	int batchFinish(Map<String, Object> params);
	
	int releaseCar(Integer[] checkId);
}