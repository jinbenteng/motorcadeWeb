package com.jbt.service;

import java.util.List;

import net.sf.json.JSONArray;

import com.jbt.bean.SectorInfo;

public interface SectorInfoService {

	int deleteByPrimaryKey(Integer id);

    int insert(SectorInfo record);

    int insertSelective(SectorInfo record);

    SectorInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SectorInfo record);

    int updateByPrimaryKey(SectorInfo record);

	List<SectorInfo> selectByManagerName(String managerName);

	List<SectorInfo> selectByParentId(Integer parentId);

	String selectCoreSector();

	List<SectorInfo> selectAll();

	JSONArray getTreeData();
	
	JSONArray getTreeDataWithCar();
	
    String selectVehicleBrand();
    
    List<String> selectVehicleSeries(String brand);
    
    List<String> selectVehicleModel(String series);

	List<String> getDeviceSn(String sn);

	void setRootId(Integer id); 

}
