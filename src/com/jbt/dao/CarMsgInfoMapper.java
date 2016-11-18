package com.jbt.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.jbt.bean.CarMsgInfo;

public interface CarMsgInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CarMsgInfo record);

    int insertSelective(CarMsgInfo record);

    CarMsgInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CarMsgInfo record);

    int updateByPrimaryKey(CarMsgInfo record);
    
    //查询多个设备的运行状态
    List<Map<?, ?>> searchBySnList(Integer sectorId);
    //查询单个设备运行状态
    Map<?, ?> searchBySn(String sn);
    //多车监控中显示一个
    Map<?, ?> searchBySn1(String sn);
    //查询一段时间内设备运行轨迹
    @Select("SELECT longitude,latitude,recorderVelocity,instantFuelConsumption,addTime FROM car_msg_info WHERE sn = #{0} AND addTime BETWEEN #{1} AND #{2} ORDER BY addTime ASC")
    List<Map<?, ?>> searchPeriodWay(String sn,String startTime,String endTime);
}