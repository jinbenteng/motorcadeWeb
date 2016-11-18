package com.jbt.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jbt.bean.CarInfo;
import com.jbt.bean.StaffInfo;
import com.jbt.bean.UseCarInfo;
import com.jbt.service.CarInfoService;
import com.jbt.service.SectorInfoService;
import com.jbt.service.StaffInfoService;
import com.jbt.service.UseCarInfoService;
import com.jbt.util.DateUtil;
import com.jbt.util.Page;

@Controller
public class UseCarController {

	private final Logger log = LoggerFactory.getLogger(UseCarController.class);
	@Resource
	private UseCarInfoService usecarService;
	@Resource
	private StaffInfoService staffService;
	@Resource
	private CarInfoService carService;
	@Resource
	private SectorInfoService sectorService;
	
	//跳转到用车添加页面
	@RequestMapping(value = "/useCar_add_page")
    public String useCar_add_page(Model model) {
		//提供警队，车辆，和司机列表初始化表单
		UseCarInfo useCar = new UseCarInfo();
		useCar.setStarttime(DateUtil.getNow());
		model.addAttribute("useCarInfo", useCar);
		model.addAttribute("sectorList", sectorService.selectAll());//应该是根据部门ID选择对应对的车辆和司机
		List<CarInfo> list = carService.selectAll();
		if(list == null || list.size()==0){
			model.addAttribute("msg", "无闲置车辆!");
			return "useCar_add";
		}
		model.addAttribute("carList", list);
		List<StaffInfo> list1 = staffService.selectDriver();
		if(list1 == null || list1.size()==0){
			model.addAttribute("msg", "无空闲司机!");
			return "useCar_add";
		}
		model.addAttribute("driverList", list1);
		//初始化form 
		
		return "useCar_add";
    }
	
	//添加用车记录
	@RequestMapping(value = "/useCar_add")
    public String useCar_add(UseCarInfo useCarInfo,Model model) {
		useCarInfo.setState(0);
		try {
			usecarService.insert(useCarInfo);
			//设置车辆负责人，设置车辆状态为占用
			carService.updateDriverName(useCarInfo.getCarinfo().getId(),useCarInfo.getDriverinfo().getId());
			return "redirect:/useCar_all?pageNow=1";
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e.getMessage());
			model.addAttribute("sectorList", sectorService.selectAll());//应该是根据部门ID选择对应对的车辆和司机
			model.addAttribute("carList", carService.selectAll());
			model.addAttribute("driverList", staffService.selectDriver());
			model.addAttribute("useCarInfo", useCarInfo);
			model.addAttribute("msg", "添加失败,可能是一个已经添加过的数据。");
			return "useCar_add";
		}
    }
	
	//用车查询界面
	@RequestMapping(value = "/useCar_all")
    public String useCar_all(UseCarInfo useCarInfo,Model model,Integer pageNow) {
		Page page = usecarService.getPageList(useCarInfo,pageNow);
		model.addAttribute("useCarInfo", useCarInfo);
		model.addAttribute("page",page);
		model.addAttribute("sectorData",sectorService.getTreeData().toString());
		return "useCar_manage";
    }
	
	//批量删除操作
	@RequestMapping(value = "/useCar_delete")
    public String useCar_delete(@RequestParam(required=false) Integer[] checkId) {
		//接收到id拼接的参数
		try {
			log.info("delete useCar .....");
			this.usecarService.batchDelete(checkId);
		} catch (Exception e) {
			// TODO: handle exception
			log.error("delete useCar error...." + e.getMessage() + e.getCause());
		}
		return "redirect:/useCar_all?pageNow=1";
    }
	
	//批量完成行程操作
	@RequestMapping(value = "/useCar_finish")
    public String useCar_finish(@RequestParam(required=false) Integer[] checkId) {
		//接收到id拼接的参数
		try {
			log.info("useCar finish .....");
			this.usecarService.batchFinish(checkId);
		} catch (Exception e) {
			// TODO: handle exception
			log.error("useCar finish error...." + e.getMessage() + e.getCause());
		}
		return "redirect:/useCar_all?pageNow=1";
    }
	
}
