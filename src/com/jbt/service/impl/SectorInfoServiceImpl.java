package com.jbt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.jbt.dao.CarInfoMapper;
import com.jbt.dao.DeviceInfoMapper;
import com.jbt.dao.SectorInfoMapper;
import com.jbt.bean.CarInfo;
import com.jbt.bean.SectorInfo;
import com.jbt.service.SectorInfoService;
import com.jbt.util.SessionUtil;

@Service("SectorInfoService")
public class SectorInfoServiceImpl implements SectorInfoService {
	
	@Resource
	private SectorInfoMapper SectorInfoMapper;
	@Resource
	private CarInfoMapper carInfoMapper;
	@Resource
	private DeviceInfoMapper deviceInfoMapper;
	
	public int deleteByPrimaryKey(Integer id) {

		return this.SectorInfoMapper.deleteByPrimaryKey(id);
	}

	public int insert(SectorInfo record) {

		return this.SectorInfoMapper.insert(record);
	}

	public int insertSelective(SectorInfo record) {

		return this.SectorInfoMapper.insertSelective(record);
	}

	public SectorInfo selectByPrimaryKey(Integer id) {

		return this.SectorInfoMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(SectorInfo record) {

		return this.SectorInfoMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(SectorInfo record) {

		return this.SectorInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<SectorInfo> selectByManagerName(String managerName) {
		// TODO Auto-generated method stub
		return this.SectorInfoMapper.selectByManagerName(managerName);
	}

	@Override
	public List<SectorInfo> selectByParentId(Integer parentId) {
		// TODO Auto-generated method stub
		return this.SectorInfoMapper.selectByParentId(parentId);
	}

	@Override
	public String selectCoreSector() {
		//获取JSON格式的一级部门数据
		List<SectorInfo> sectorList = this.SectorInfoMapper.selectCoreSector(SessionUtil.getManagerId());
		JSONArray jArr = new JSONArray();
		JSONObject jdata = null;
		for (SectorInfo sectorInfo : sectorList) {
			jdata = new JSONObject();
			jdata.put("id", sectorInfo.getId());
			jdata.put("name", sectorInfo.getSectorname());
			jArr.add(jdata);
		}
		return jArr.toString();
	}

	@Override
	public List<SectorInfo> selectAll() {
		// TODO Auto-generated method stub
		return this.SectorInfoMapper.selectAll(SessionUtil.getManagerId());
	}

	@Override
	public JSONArray getTreeData() {
		//获取JSON格式的ZTREE部门数据
		List<SectorInfo> sectorList = this.SectorInfoMapper.selectAll(SessionUtil.getManagerId());
		JSONArray sectorData = new JSONArray();
		JSONObject jdata = null;
		for (SectorInfo sectorInfo : sectorList) {			
			jdata = new JSONObject();
			jdata.put("id", sectorInfo.getId());
			jdata.put("pId",
					sectorInfo.getLevel() == 1 ? 0 : sectorInfo.getParentinfo());
			jdata.put("name", sectorInfo.getSectorname());
			jdata.put("open", sectorInfo.getLevel() < 3 ? true : false);
			jdata.put("isParent", true);
			sectorData.add(jdata);			
		}		
		return sectorData;
	}
	@Override
	public JSONArray getTreeDataWithCar() {
		List<SectorInfo> sectorList = this.SectorInfoMapper.selectAll(SessionUtil.getManagerId());
		JSONArray jArr = new JSONArray();
		JSONObject jdata = null;
		for (SectorInfo sectorInfo : sectorList) {
			jdata = new JSONObject();
			jdata.put("id", sectorInfo.getId());
			jdata.put("pId", sectorInfo.getLevel()==1?0:sectorInfo.getParentinfo());
			jdata.put("name", sectorInfo.getSectorname());
			jdata.put("open", sectorInfo.getLevel()<3?true:false);
			jdata.put("isParent", true);
			jdata.put("flag", 1);
			jArr.add(jdata);
			//查询出部门下车辆信息
			List<CarInfo> snList = carInfoMapper.searchSnBySectorId(sectorInfo
					.getId());
			if (snList != null && snList.size() > 0) {
				for (CarInfo car : snList) {
					jdata = new JSONObject();
					jdata.put("id", car.getSn());
					jdata.put("pId", sectorInfo.getId());
					jdata.put("name", car.getPlatenumber());
					jdata.put("open", true);
					jdata.put("isParent", true);
					jdata.put("flag", 2);
					jArr.add(jdata);
				}				
			}			
		}
		return jArr;
	}

	@Override
	public String selectVehicleBrand() {
		// TODO Auto-generated method stub
		List<String> brandList = this.SectorInfoMapper.selectVehicleBrand();
		StringBuffer sb = new StringBuffer();
		if(brandList != null && brandList.size() > 0)
		{
			for (String string : brandList) {
				sb.append(string + ",");
			}
			sb.deleteCharAt(sb.length()-1);
		}		
		return sb.toString();
	}

	@Override
	public List<String> selectVehicleSeries(String brand) {
		// TODO Auto-generated method stub
		return this.SectorInfoMapper.selectVehicleSeries(brand);
	}

	@Override
	public List<String> selectVehicleModel(String series) {
		// TODO Auto-generated method stub
		return this.SectorInfoMapper.selectVehicleModel(series);
	}

	@Override
	public List<String> getDeviceSn(String sn) {
		// TODO Auto-generated method stub
		return this.deviceInfoMapper.getDeviceSn(sn);
	}

	@Override
	public void setRootId(Integer id) {
		// TODO Auto-generated method stub
		
	}

	
}
