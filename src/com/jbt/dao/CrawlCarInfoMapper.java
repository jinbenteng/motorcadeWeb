package com.jbt.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jbt.bean.CrawlCarInfo;
import com.jbt.bean.CrawlInfo;

public interface CrawlCarInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CrawlCarInfo record);

    int insertSelective(CrawlCarInfo record);

    CrawlCarInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CrawlCarInfo record);

    int updateByPrimaryKey(CrawlCarInfo record);
    
    @Select("SELECT c.sn,c.plateNumber FROM crawl_car_info as cc JOIN crawl_warn_info AS cw ON cc.crawlwarnId=cw.id JOIN car_info AS c ON cc.carId=c.id WHERE cc.crawlName=#{crawlName} AND cw.warnType=#{crawlwarType}")
    List<Map<?, ?>> searchCarByNameAndType(String crawlName,Integer crawlwarType);
//    @Select("SELECT a.* from (SELECT cw.id,c.crawlName,cw.warnType,cw.validityStart,cw.validityEnd,cw.idleTime,cw.parkTime,cw.chartType,cw.circlePoint,cw.circleRadius,cw.polygonPoint FROM crawl_info AS c JOIN crawl_warn_info AS cw ON c.id=cw.crawlInfo  WHERE c.state=0 AND c.manager=#{managerId})AS a")
    List<Map<?, ?>> searchCrawlByManager(@Param(value="crawlInfo")CrawlInfo crawlInfo,@Param(value="managerId")Integer managerId);
    //@Select("SELECT a.* from (SELECT cc.crawlwarnId,cm.longitude,cm.latitude,cm.state,cm.sn,c.plateNumber FROM crawl_car_info AS cc JOIN car_msg_info AS cm ON cc.sn=cm.sn join car_info as c on c.id=cc.carId WHERE cc.managerId=#{managerName} ORDER BY cm.addTime desc) AS a GROUP BY a.sn")
    List<Map<?, ?>> searchByCrawlWarnId(@Param(value="crawlInfo")CrawlInfo crawlInfo,@Param(value="managerId")Integer managerId);

    List<CrawlCarInfo> searchSnAndCrawlName(@Param(value="sn")String sn,@Param(value="managerName")String managerName);
    
    List<String> searchBySn(@Param(value="sn")String sn);
}