package com.jbt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jbt.bean.CrawlInfo;

public interface CrawlInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CrawlInfo record);

    int insertSelective(CrawlInfo record);

    CrawlInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CrawlInfo record);

    int updateByPrimaryKey(CrawlInfo record);
    
    List<CrawlInfo> getCrawlList(@Param(value="crawlInfo") CrawlInfo crawlInfo, @Param(value="start") int start,@Param(value="pageSize")  int pageSize,@Param(value="managerId") Integer managerId);
    
    int getCrawlCount(@Param(value="crawlInfo") CrawlInfo crawlInfo,@Param(value="managerId") Integer managerId);
}