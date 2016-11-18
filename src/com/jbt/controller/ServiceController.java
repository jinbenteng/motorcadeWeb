package com.jbt.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jbt.service.CarInfoService;
import com.jbt.service.CarMsgInfoService;
import com.jbt.service.MessageInfoService;
import com.jbt.util.ConfigUtil;
import com.jbt.util.Constant;

@Controller
public class ServiceController {

	private final Logger log = LoggerFactory.getLogger(ServiceController.class);
	
	@Resource
	private MessageInfoService messageInfoService;
	@Resource
	private CarInfoService carInfoService;
	
	/*
	 * 提供接口服务
	 * BASEURL :  http://localhost:8080/keylocker/service?
	 */
	
	@ResponseBody
	@RequestMapping(value = "/service", produces = {"application/json;charset=UTF-8"})  
	public Object service(HttpServletRequest request) throws IOException{
		JSONObject obj = null;
		//获取请求信息
		String IP = request.getRemoteAddr();
		String method = request.getMethod();
		Enumeration<String> enu = request.getParameterNames();
		StringBuffer paramStr = new StringBuffer();
		while(enu.hasMoreElements()){
			String paraName=(String)enu.nextElement();
			paramStr.append("\n" + paraName + ": " + request.getParameter(paraName));
		}
		log.info("IP： " + IP
				+ "\nMethod: " + method
				+ "\nURI: " + request.getRequestURI()
				+ "\nParams: " + paramStr.toString());
		
		int serviceNo = 0;
		String num = request.getParameter("serviceNo");
		if(ConfigUtil.isCanBeInt(num)){
			serviceNo = Integer.parseInt(num);
		}
		//登陆校验
		//不需要验证session的接口有注册1001，登陆1002，获取验证码9001
		if(serviceNo == 1001 || serviceNo == 1002 || serviceNo == 9001){
			
		}
		try {
			switch (serviceNo) {
				//获取短信校验码
				case Constant.service_getTelMessageCode:{
					/*
					 * 接口功能:注册
					 * requestParam: serviceNo=9001&tel=18611551449
					 */
					obj = messageInfoService.getTelMessageCode(request);
					break;
				}			
				default:{
					/*
					 * 不存在的接口编号
					 */
					obj = new JSONObject();
					obj.put("resultCode", "0001");
					break;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			obj = new JSONObject();
			obj.put("resultCode", "9999");
			log.error("异常信息:接口"  + serviceNo + ":" + e.getStackTrace());
		}
		if(obj == null){
			obj = new JSONObject();
			obj.put("resultCode", "9999");
		}
		return obj.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/service_car", produces = {"application/json;charset=UTF-8"})  
	public String getCarInfo(HttpServletRequest request) throws UnsupportedEncodingException{
		JSONObject obj = new JSONObject();
		String carNum = request.getParameter("carNum");
		if(carNum == null || carNum.trim().equals("")){
			obj.put("resultCode", "0001");//参数为空
		}else{
			//转码
			carNum = new String(carNum.getBytes("iso-8859-1"), "utf-8");
			HashMap<String, Object> data = carInfoService.getDataByNum(carNum);
			if(data == null || data.size() == 0){
				obj.put("resultCode", "0002");//无数据
			}else{
				obj.put("resultCode", "0000");//
				obj.put("carNum", carNum);
				obj.put("currentOil", data.get("currentOil")==null?0:data.get("currentOil"));
				obj.put("mileage", data.get("mileage")==null?0:data.get("mileage"));
				obj.put("totalOil", data.get("totalOil")==null?0:data.get("totalOil"));
				obj.put("totalMileage", data.get("totalMileage")==null?0:data.get("totalMileage"));
			}
		}
		return obj.toString();
	}
}
