package com.jbt.controller;


import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jbt.bean.DriveLogInfo;
import com.jbt.service.DriveLogInfoService;
import com.jbt.service.SectorInfoService;
import com.jbt.util.Page;

@Controller
public class DriveLogController {

	/*
	 * 快速显示出行程司机和车牌的方法
	 * 车牌：新加字段车牌号 添加新的行程数据时将SN绑定的车辆车牌号添加到行程表中
	 * 司机姓名: 新加字段司机名称，同事给车辆添加司机字段（String）默认为‘未录入’
	 * 分配车辆时将车辆的司机字段设置为司机姓名，并在结束行程时重新设置为‘未录入’
	 * 这样当添加新的行程数据时就可以将对应车辆的负责人添加到行程中
	 */
	
	private final Logger log = LoggerFactory.getLogger(DriveLogController.class);
	@Resource
	private DriveLogInfoService driveLogService;
	@Resource
	private SectorInfoService sectorService;
	
	//用车查询界面
	@RequestMapping(value = "/driveLog_all")
    public String driveLog_all(DriveLogInfo driveLogInfo,Model model, Integer pageNow,@RequestParam(required=false)Integer sectorId) {
		Page page = driveLogService.getPageList(driveLogInfo,pageNow,sectorId);
		model.addAttribute("driveLogInfo", driveLogInfo);
		model.addAttribute("page",page);
		model.addAttribute("sectorData",sectorService.getTreeData().toString());
		return "driveLog_manage";
    }
	
	//批量删除操作
	@RequestMapping(value = "/driveLog_delete")
    public String driveLog_delete(@RequestParam(required=false) Integer[] checkId) {
		//接收到id拼接的参数
		try {
			log.info("delete driveLog .....");
			this.driveLogService.batchDelete(checkId);
		} catch (Exception e) {
			// TODO: handle exception
			log.error("delete driveLog error...." + e.getMessage() + e.getCause());
		}
		return "redirect:/driveLog_all?pageNow=1";
    }
	
}
