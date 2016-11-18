package com.jbt.service;

import java.util.HashMap;
import java.util.List;

import com.jbt.bean.CarInfo;
import com.jbt.bean.DeviceInfo;
import com.jbt.util.Page;

public interface CarInfoService {

	int deleteByPrimaryKey(Integer id);

    int insert(CarInfo CarInfo);

    int insertSelective(CarInfo CarInfo);

    CarInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CarInfo CarInfo);

    int updateByPrimaryKey(CarInfo CarInfo);

	Page getPageList(CarInfo CarInfo, Integer pageNow);

	List<CarInfo> selectAll();
	
	int batchDelete(Integer[] checkId);

	void updateDriverName(Integer id, Integer staffId);
	
	int insert(DeviceInfo device);

	HashMap<String, Object> getDataByNum(String carNum);
	
	List<CarInfo> searchBySn(String[] snList);

}
