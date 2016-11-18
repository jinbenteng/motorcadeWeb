package com.jbt.service;


import com.jbt.bean.UseCarInfo;
import com.jbt.util.Page;

public interface UseCarInfoService {

	int deleteByPrimaryKey(Integer id);

    int insert(UseCarInfo useCarInfo);

    int insertSelective(UseCarInfo useCarInfo);

    UseCarInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UseCarInfo useCarInfo);

    int updateByPrimaryKey(UseCarInfo useCarInfo);

	Page getPageList(UseCarInfo useCarInfo, Integer pageNow);

	int batchDelete(Integer[] checkId);

	int batchFinish(Integer[] checkId);

}
