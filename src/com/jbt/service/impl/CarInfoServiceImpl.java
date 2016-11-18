package com.jbt.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.jbt.bean.CarInfo;
import com.jbt.bean.DeviceInfo;
import com.jbt.dao.CarInfoMapper;
import com.jbt.dao.DeviceInfoMapper;
import com.jbt.service.CarInfoService;
import com.jbt.util.DateUtil;
import com.jbt.util.Page;
import com.jbt.util.SessionUtil;

@Service("CarInfoService")
public class CarInfoServiceImpl implements CarInfoService {
	private final Logger log = LoggerFactory.getLogger(CarInfoServiceImpl.class);
	@Resource
	private CarInfoMapper CarInfoMapper;
	@Resource
	private DeviceInfoMapper DeviceInfoMapper;
	
	public int deleteByPrimaryKey(Integer id) {
		return this.CarInfoMapper.deleteByPrimaryKey(id);
	}

	public int insert(CarInfo record) {
		log.info("添加汽车:"+record.getPlatenumber()+"并绑定设备:"+ record.getSn());
		DeviceInfoMapper.changeStateBySn(record.getSn());
		return this.CarInfoMapper.insert(record);
	}

	public int insertSelective(CarInfo record) {
		return this.CarInfoMapper.insertSelective(record);
	}

	public CarInfo selectByPrimaryKey(Integer id) {
		return this.CarInfoMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(CarInfo record) {
		return this.CarInfoMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(CarInfo record) {
		return this.CarInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public Page getPageList(CarInfo CarInfo,Integer pageNow) {
		int start = (pageNow-1) * (Page.PSize);
		//获取页面数据
		Integer id = SessionUtil.getManagerId();
		List<?> list = this.CarInfoMapper.getPageList(CarInfo,start,Page.PSize,id);
		int count = this.CarInfoMapper.getCount(CarInfo,id);//根据参数获取对应消息的总条数
		return new Page(list,pageNow,count);
	}

	@Override
	public int batchDelete(Integer[] checkId) {
		// TODO Auto-generated method stub
		return this.CarInfoMapper.batchDelete(checkId);
	}
	
	@Override
	public List<CarInfo> selectAll() {
		// TODO Auto-generated method stub
		return this.CarInfoMapper.selectAll(SessionUtil.getManagerId());
	}

	@Override
	public void updateDriverName(Integer id,  Integer staffId) {
		// TODO Auto-generated method stub
		this.CarInfoMapper.updateDriverName(id, staffId);
	}

	@Override
	public int insert(DeviceInfo device) {
		// TODO Auto-generated method stub
		return this.DeviceInfoMapper.insert(device);
	}

	@Override
	public HashMap<String, Object> getDataByNum(String carNum) {
		// TODO Auto-generated method stub
		String time = DateUtil.getNow().substring(0,7);//查询本月累计消耗油量
		HashMap<String, Object> hs = this.CarInfoMapper.getDataByNum(carNum,time);
		if(hs == null || hs.isEmpty()){
			return null;
		}
		//Double b =  this.CarInfoMapper.getDataByTime(carNum, time);
		//hs.put("totalOil",b==null?0:b);
		return hs;
	}

	@Override
	public List<CarInfo> searchBySn(String[] snList) {
		// TODO Auto-generated method stub
		return this.CarInfoMapper.searchBySn(snList);
	}
	

}
