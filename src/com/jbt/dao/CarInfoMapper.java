package com.jbt.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.jbt.bean.CarInfo;

public interface CarInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CarInfo record);

    int insertSelective(CarInfo record);

    CarInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CarInfo record);

    int updateByPrimaryKey(CarInfo record);

	List<?> getPageList(@Param(value="carInfo") CarInfo carInfo,@Param(value="start") int start,@Param(value="pageSize") int pageSize,@Param(value="managerId") Integer managerId);

	int getCount(@Param(value="carInfo") CarInfo carInfo,@Param(value="managerId") Integer managerId);
	
	//查找所有闲置状态的车辆
	@Select("select * from car_info where state = 0 and sectorInfo in (select id from sector_info where managerInfo = #{managerId})")
	List<CarInfo> selectAll(Integer managerId);

	int batchDelete(Integer[] checkId);

	@Update("update car_info set state = 1 , driverName = (select staffName from staff_info where id = #{staffId}) where id = #{id}")
	void updateDriverName(@Param(value="id")Integer id, @Param(value="staffId")Integer staffId);
	
	@Select("select * from car_info where sectorinfo = #{sectorId}")
	List<CarInfo> searchSnBySectorId(int sectorId);

	HashMap<String, Object> getDataByNum(@Param(value="carNum")String carNum,@Param(value="time")String time);
	
	//@Select("select sum(d.totalOil) from car_info c left join drive_log_info d on c.sn = d.sn where d.departuretime like CONCAT(CONCAT('%', #{time}),'%') and c.plateNumber = #{carNum}")
	//Double getDataByTime(@Param(value="carNum")String carNum,@Param(value="time")String time);
	List<CarInfo> searchBySn(String[] snList);

}