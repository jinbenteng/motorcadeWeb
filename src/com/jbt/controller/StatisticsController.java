package com.jbt.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jbt.service.DriveLogInfoService;
import com.jbt.service.SectorInfoService;

@Controller
public class StatisticsController {

	@Resource
	DriveLogInfoService driveLogService;
	@Resource
	private SectorInfoService sectorService;

	/*
	 * 提供统计图数据
	 * BASEURL :  http://localhost:8080/keylocker/service?
	 */
	@ResponseBody
	@RequestMapping(value = "/data_carOil", produces = {"application/json;charset=UTF-8"})  
	public String service(HttpServletRequest request) throws IOException{
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		if(startTime != null){
			startTime = startTime.trim();
		}
		if(endTime != null){
			endTime = endTime.trim();
		}
		JSONObject jdata = new JSONObject();
		JSONArray plateNumberArr = new JSONArray();//车牌
		JSONArray sumTotalOilArr = new JSONArray();//统计油耗
		JSONArray sumTotalTimeArr = new JSONArray();//统计时长
		JSONArray sumTotalMileageArr = new JSONArray();//统计里程
		//查找
		List<Map<String,Object>> list = driveLogService.selectTotalOil(startTime,endTime,null);
		for (Iterator<Map<String, Object>> iterator = list.iterator(); iterator.hasNext();) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			plateNumberArr.add(map.get("plateNumber"));
			sumTotalOilArr.add(map.get("totalOil"));
			sumTotalTimeArr.add(map.get("totalRavelTime"));
			sumTotalMileageArr.add(map.get("totalMileage"));
		}
		jdata.put("carNum", plateNumberArr);
		jdata.put("data_oil", sumTotalOilArr);
		jdata.put("data_time", sumTotalTimeArr);
		jdata.put("data_mileage", sumTotalMileageArr);
		return jdata.toString();
	}
	
	//跳转到统计图页面
	@RequestMapping(value = "/statistical")
    public String statistical(Model model) {
		model.addAttribute("sectorDataWithCar",sectorService.getTreeDataWithCar().toString());
		return "statistical";
    }
	
	//statistical_car  单车数据
	@ResponseBody
	@RequestMapping(value = "/statistical_car", produces = {"application/json;charset=UTF-8"})  
	public String statistical_car(HttpServletRequest request) throws IOException{
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String sn = request.getParameter("sn");
		Integer dateType = Integer.parseInt(request.getParameter("dateType"));
		
		if(startTime != null){
			startTime = startTime.trim();
		}
		if(endTime != null){
			endTime = endTime.trim();
		}
		JSONObject jdata = new JSONObject();
		JSONArray dateArr = new JSONArray();//车牌
		JSONArray sumTotalOilArr = new JSONArray();//统计油耗
		JSONArray sumTotalTimeArr = new JSONArray();//统计时长
		JSONArray sumTotalMileageArr = new JSONArray();//统计里程
		//查找
		List<Map<String,Object>> list = driveLogService.selectStatistical_car(startTime,endTime,sn,dateType);
		for (Iterator<Map<String, Object>> iterator = list.iterator(); iterator.hasNext();) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			dateArr.add(map.get("date"));
			sumTotalOilArr.add(map.get("totalOil"));
			sumTotalTimeArr.add(map.get("totalRavelTime"));
			sumTotalMileageArr.add(map.get("totalMileage"));
		}
		jdata.put("date", dateArr);
		jdata.put("data_oil", sumTotalOilArr);
		jdata.put("data_time", sumTotalTimeArr);
		jdata.put("data_mileage", sumTotalMileageArr);
		return jdata.toString();
	}
}