package com.jbt.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.jbt.bean.CrawlInfo;
import com.jbt.bean.WarnInfo;

public interface WarnInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WarnInfo record);

    int insertSelective(WarnInfo record);

    WarnInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(WarnInfo record);

    int updateByPrimaryKey(WarnInfo record);
    
    List<Map<?, ?>> getPageList(@Param(value="crawlInfo")CrawlInfo crawlInfo,@Param(value="manager")Integer manager);
    
    List<Map<?, ?>> getMaxList(@Param(value="crawlInfo")CrawlInfo crawlInfo,@Param(value="manager")Integer manager,@Param(value="maxId")Integer maxId);
    
    Integer getMaxId(@Param(value="crawlInfo")CrawlInfo crawlInfo,@Param(value="manager")Integer manager);
    
//    int getCount(@Param(value="manager")Integer manager);
}