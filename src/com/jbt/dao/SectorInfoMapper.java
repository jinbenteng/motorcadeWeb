package com.jbt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.jbt.bean.SectorInfo;

public interface SectorInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SectorInfo record);

    int insertSelective(SectorInfo record);

    SectorInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SectorInfo record);

    int updateByPrimaryKey(SectorInfo record);

	List<SectorInfo> selectByManagerName(String managerName);

	//根据上级警队查询支队
	@Select("select id,sectorname from sector_info where parentInfo = #{parentId}")
	List<SectorInfo> selectByParentId(Integer parentId);
	//查询所有一级总队
	@Select("select id,sectorname from sector_info where level = 1 and id in (select id from sector_info where managerInfo = #{managerId})")
	List<SectorInfo> selectCoreSector(Integer managerId);
	
	@Select("select * from sector_info where id in (select id from sector_info where managerInfo = #{managerId})")
	List<SectorInfo> selectAll(Integer managerId);
	
    //查询车型
    @Select("select distinct brand from vehicle_info order by convert(brand using gbk)")
    List<String> selectVehicleBrand();
    @Select("select distinct series from vehicle_info where brand = #{brand} order by convert(series using gbk)")
    List<String> selectVehicleSeries(String brand);
    @Select("select model from vehicle_info where series = #{series} order by convert(model using gbk)")
    List<String> selectVehicleModel(String series);

}