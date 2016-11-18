package com.jbt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jbt.dao.CarInfoMapper;
import com.jbt.dao.DeviceInfoMapper;
import com.jbt.service.StatisticsService;

@Service("StatisticsService")
public class StatisticsServiceImpl implements StatisticsService {

	@Resource
	private CarInfoMapper CarInfoMapper;
	@Resource
	private DeviceInfoMapper DeviceInfoMapper;

}
