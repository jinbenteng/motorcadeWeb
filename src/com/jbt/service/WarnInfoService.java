package com.jbt.service;

import java.util.List;
import java.util.Map;

import com.jbt.bean.CrawlInfo;
import com.jbt.bean.WarnInfo;

public interface WarnInfoService {

	int deleteByPrimaryKey(Integer id);

    int insert(WarnInfo WarnInfo);

    int insertSelective(WarnInfo WarnInfo);

    WarnInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(WarnInfo WarnInfo);

    int updateByPrimaryKey(WarnInfo WarnInfo);
    
    List<Map<?, ?>> searchByManager(CrawlInfo crawlInfo,Integer managerId);
    
    List<Map<?, ?>> getMaxList(CrawlInfo crawlInfo,Integer manager,Integer maxId);
    
    int getMaxId(CrawlInfo crawlInfo,Integer manager);

}
