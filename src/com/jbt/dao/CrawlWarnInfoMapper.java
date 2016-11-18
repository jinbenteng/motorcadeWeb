package com.jbt.dao;

import java.util.List;

import com.jbt.bean.CrawlWarnInfo;

public interface CrawlWarnInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CrawlWarnInfo record);

    int insertSelective(CrawlWarnInfo record);

    CrawlWarnInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CrawlWarnInfo record);

    int updateByPrimaryKey(CrawlWarnInfo record);
    
    List<CrawlWarnInfo> searchById(String[] s);
}