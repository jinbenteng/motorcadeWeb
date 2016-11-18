package com.jbt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.jbt.bean.ManagerInfo;

public interface ManagerInfoMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(ManagerInfo record);

    int insertSelective(ManagerInfo record);

    ManagerInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ManagerInfo record);

    int updateByPrimaryKey(ManagerInfo record);
    
    List<ManagerInfo> selectByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize);  

    int getCount();
    
	@Select("select * from manager_info where userName = #{userName}")
	ManagerInfo selectByName(String userName);

	@Update("update manager_info set password = #{password} where tel = #{tel}")
	int resetPwdByTel(@Param(value="tel")String tel, @Param(value="password")String password);

	@Select("select * from manager_info where username = #{username} or tel = #{tel}")
	ManagerInfo selectByNameAndTel(ManagerInfo manager); 
}