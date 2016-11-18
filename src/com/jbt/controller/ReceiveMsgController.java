package com.jbt.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jbt.bean.CarMsgInfo;
import com.jbt.bean.CrawlCarInfo;
import com.jbt.bean.CrawlWarnInfo;
import com.jbt.bean.DriveLogInfo;
import com.jbt.bean.FaultInfo;
import com.jbt.bean.RegisterInfo;
import com.jbt.bean.WarnInfo;
import com.jbt.service.CarMsgInfoService;
import com.jbt.service.CrawlCarInfoService;
import com.jbt.service.CrawlWarnInfoService;
import com.jbt.service.DriveLogInfoService;
import com.jbt.service.FaultInfoService;
import com.jbt.service.RegisterInfoService;
import com.jbt.service.WarnInfoService;
import com.jbt.util.BDconver;
import com.jbt.util.DateUtil;
import com.jbt.util.Distribution;
import com.jbt.util.TCPUtil;

@Controller
public class ReceiveMsgController {

	private final Logger log = LoggerFactory
			.getLogger(ReceiveMsgController.class);

	@Resource
	CarMsgInfoService carMsgService;
	@Resource
	CrawlCarInfoService crawlCarInfoService;
	@Resource
	CrawlWarnInfoService crawlWarnInfoService;
	@Resource
	DriveLogInfoService driveLogService;
	@Resource
	RegisterInfoService registerService;
	@Resource
	FaultInfoService faultService;
	@Resource
	WarnInfoService warnService;
	private static Gson gson = new Gson();

	/*
	 * 提供接口服务 BASEURL : http://localhost:8080/keylocker/service?
	 */
	@ResponseBody
	@RequestMapping(value = "/msgservice", produces = { "application/json;charset=UTF-8" })
	public Object service(String data) throws IOException {
//		CarMsgInfo car = new CarMsgInfo();
//		car.setAddtime(DateUtil.getCurrentDate(DateUtil.DATE_FORMAT_3));
//		car.setAirflow(0.f);
//		car.setCoolanttemperature(1);
//		car.setCumulativekilometers(0.f);
//		car.setDevicetime((long) 1234545);
//		car.setDirection(1);
//		car.setDynamicfuelconsumption(0.f);
//		car.setElevation(1);
//		car.setFuelconsumption(0.f);
//		car.setIdlefuelconsumption(0.f);
//		car.setInstantfuelconsumption(0.f);
//		car.setLatitude((float) 39.913395);
//		car.setLongitude((float) 116.418804);
//		car.setSn("87C0ABC412464CC5");
//		car.setManifoldpressure(1);
//		car.setMileage(0.f);
//		car.setOilmass(0.f);
//		car.setRecordervelocity(1);
//		car.setSerialnumber(1);
//		car.setSim("1111");
//		car.setSpeed(1);
//		car.setState(1);
//		car.setTime("11");
//		car.setVelocity(1);
//		car.setVoltage(0.f);
//		car.setWarn(1);
//		String s1 = getString(car);
		
		
		// data = new String(data.getBytes("ISO-8859-1"),"UTF-8");
		data = URLDecoder.decode(data, "UTF-8");
		log.info("receive:" + data);
		if (data == null || data.trim().equals("")) {
			log.error("data == null");
			return "error";
		}
		if (data.equals("data")) {
			// 用于测试连接是否可用
			return "success";
		}
		// 将被替换的空格恢复
		data = data.replaceAll("--", " ");
		try {
			// 解析数据
			String msgType = data.substring(0, data.indexOf(":{"));
			String json = data.substring(data.indexOf("{"));
			if (msgType.equals(CarMsgInfo.class.getSimpleName())) {
				// 接收到汽车行驶数据，直接保存
				CarMsgInfo msg = gson.fromJson(json, CarMsgInfo.class);
				log.debug("receive car msg");
				try {
					carMsgService.insert(msg);
					List<String> stringList = crawlCarInfoService
							.searchBySn(msg.getSn());
					if (!stringList.isEmpty()) {
						for (int i = 0; i < stringList.size(); i++) {
							String s[] = stringList.get(i).split(",");
							List<CrawlWarnInfo> warnList = crawlWarnInfoService
									.searchById(s);
							if (!warnList.isEmpty()) {
								for (int j = 0; j < warnList.size(); j++) {
									CrawlWarnInfo warn = warnList.get(j);
									if(DateUtil.compairTime(warn.getValiditystart(), warn.getValidityend()))
									{
										switch (warn.getWarntype()) {
										case 1:// 驶出围栏
										{
											double temp1 = msg.getLatitude();
											double temp2 = msg.getLongitude();
											Distribution start = new Distribution();
											start.setLongitude(temp2);
											start.setDimensionality(temp1);
											Distribution end = new Distribution();
											String[] tempStr2 = warn
													.getCirclepoint().split(",");
											double temp3 = Double
													.valueOf(tempStr2[0]);
											double temp4 = Double
													.valueOf(tempStr2[1]);
											end.setLongitude(temp3);
											end.setDimensionality(temp4);
											// 两点的距离
											double aaaa = Distribution.getDistance(
													start, end);
											// 半径
											String aaatemp = warn.getCircleradius();
											double circleRadius = Double
													.valueOf(aaatemp);
											if (aaaa > circleRadius) {
												WarnInfo warnInfo = new WarnInfo();
												warnInfo.setSn(msg.getSn());
												warnInfo.setWarntype(6);
												warnInfo.setCreatedate(DateUtil
														.getCurrentDate(DateUtil.DATE_FORMAT_3));
												warnService.insert(warnInfo);
											}
										}

											break;
										case 2: {
//											double[] point = BDconver.wgs2bd(Double
//													.valueOf(msg.getLatitude()),
//													Double.valueOf(msg
//															.getLongitude()));
//											double temp1 = point[0];
//											double temp2 = point[1];
											double temp1 = msg.getLatitude();
											double temp2 = msg.getLongitude();
											Distribution start = new Distribution();
											start.setLongitude(temp2);
											start.setDimensionality(temp1);
											Distribution end = new Distribution();
											String[] tempStr2 = warn
													.getCirclepoint().split(",");
											double temp3 = Double
													.valueOf(tempStr2[0]);
											double temp4 = Double
													.valueOf(tempStr2[1]);
											end.setLongitude(temp3);
											end.setDimensionality(temp4);
											// 两点的距离
											double aaaa = Distribution.getDistance(
													start, end);
											// 半径
											String aaatemp = warn.getCircleradius();
											double circleRadius = Double
													.valueOf(aaatemp);
											if (aaaa <= circleRadius) {
												WarnInfo warnInfo = new WarnInfo();
												warnInfo.setSn(msg.getSn());
												warnInfo.setWarntype(7);
												warnInfo.setCreatedate(DateUtil
														.getCurrentDate(DateUtil.DATE_FORMAT_3));
												warnService.insert(warnInfo);
											}
										}
											break;
										case 3:

											break;
										case 4:

											break;
										case 5:

											break;

										default:
											break;
										}
									}
									
								}
							}
						}
					}
					log.debug("insert success,sn:" + msg.getSn()
							+ ",msgType:CarMsgInfo");
				} catch (Exception e) {
					e.printStackTrace();
					log.error("insert car msg error,data:" + json + "."
							+ e.getMessage());
					return "error";
				}
			} else if (msgType.equals(DriveLogInfo.class.getSimpleName())) {
				// 行程记录数据，处理后保存
				DriveLogInfo msg = gson.fromJson(json, DriveLogInfo.class);
				log.debug("receive driveLog msg");
				try {
					// 改写insert方法，设置司机和车牌号
					driveLogService.insert(msg);
					log.debug("insert success,sn:" + msg.getSn()
							+ ",msgType:DriveLogInfo");
				} catch (Exception e) {
					log.error("insert driveLog msg error,data:" + json + "."
							+ e.getMessage());
				}
			} else if (msgType.equals(RegisterInfo.class.getSimpleName())) {
				// 车辆注册数据，处理后保存
				RegisterInfo msg = gson.fromJson(json, RegisterInfo.class);
				log.debug("receive register msg");
				try {
					// 改写insert方法，设置司机和车牌号
					registerService.insert(msg);
					log.debug("insert success,sn:" + msg.getSn()
							+ ",msgType:RegisterInfo");
				} catch (Exception e) {
					log.error("insert register msg error,data:" + json + "."
							+ e.getMessage());
				}
			} else if (msgType.equals(FaultInfo.class.getSimpleName())) {
				// 车辆故障数据，处理后保存
				FaultInfo msg = gson.fromJson(json, FaultInfo.class);
				// 设置为
				msg.setState(0);
				log.debug("receive fault msg");
				try {
					faultService.insert(msg);
					log.debug("insert success,sn:" + msg.getSn()
							+ ",msgType:FaultInfo");
				} catch (Exception e) {
					log.error("insert fault msg error,data:" + json + "."
							+ e.getMessage());
				}
			} else if (msgType.equals(WarnInfo.class.getSimpleName())) {
				// 车辆故障数据，处理后保存
				WarnInfo msg = gson.fromJson(json, WarnInfo.class);
				// 设置为
				msg.setState(0);
				log.debug("receive fault msg");
				try {
					warnService.insert(msg);
					log.debug("insert success,sn:" + msg.getSn()
							+ ",msgType:WarnInfo");
				} catch (Exception e) {
					log.error("insert fault msg error,data:" + json + "."
							+ e.getMessage());
				}
			} else {
				log.error("unknow msgType");
			}
		} catch (Exception e) {
			// TODO: handle exception
			log.error("msg data error" + e.getMessage());
			return "error";
		}
		return "success";
	}

	String ip;
	int port;

	@Value("#{address.ip}")
	public void setIp(String ip) {
		this.ip = ip;
	}

	@Value("#{address.port}")
	public void setPort(String port) {
		this.port = Integer.parseInt(port);
	}

	@ResponseBody
	@RequestMapping(value = "/sendOrder")
	public String sendOrder() {
		try {
			TCPUtil.sendOrder(ip, port, "1234567812345678");
		} catch (IOException e) {
		}
		return "success";
	}
	
	public String getString(Object obj){
		return obj.getClass().getSimpleName()+":"+gson.toJson(obj);
	}

}