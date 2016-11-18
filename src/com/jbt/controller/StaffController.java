package com.jbt.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jbt.bean.SectorInfo;
import com.jbt.bean.StaffInfo;
import com.jbt.service.SectorInfoService;
import com.jbt.service.StaffInfoService;
import com.jbt.util.DateUtil;
import com.jbt.util.Page;

@Controller
public class StaffController {

	private final Logger log = LoggerFactory.getLogger(StaffController.class);
	@Resource
	private StaffInfoService staffService;
	@Resource
	private SectorInfoService sectorService;
	
	//跳转到员工添加页面
	@RequestMapping(value = "/staff_add_page")
    public String staff_add_page(Model model) {
		model.addAttribute("sectorList", sectorService.selectCoreSector());
		model.addAttribute("staffinfo", new StaffInfo());
		return "staff_add";
    }
	
	//添加员工
	@RequestMapping(value = "/staff_add")
    public String staff_add(StaffInfo staffinfo,Model model) {
		if(staffinfo.getStafftype() == 0)staffinfo.setDrivertype(null);
		staffinfo.setCreatedate(DateUtil.getNow());
		staffinfo.setState(0);
		try {
			staffService.insert(staffinfo);
			return "redirect:/staff_all?pageNow=1";
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e.getMessage());
			model.addAttribute("staffinfo", sectorService.selectCoreSector());
			model.addAttribute("msg", "添加失败,可能是一个已经添加过的数据。");
			return "staff_add";
		}
    }
	
	//员工展示界面
	@RequestMapping(value = "/staff_all")
    public String staff_all(StaffInfo staffinfo,Model model,Integer pageNow) {
		Page page = staffService.getPageList(staffinfo,pageNow);
		model.addAttribute("staffinfo", staffinfo);
		model.addAttribute("page",page);
		model.addAttribute("sectorData",sectorService.getTreeData().toString());
		return "staff_manage";
    }
	
	//查询登陆者添加的所有警队
	public List<SectorInfo> getSectorList(String managerName){
		List<SectorInfo> sectorList = sectorService.selectByManagerName(managerName);
		return sectorList;
	}
	
	//批量删除操作
	@RequestMapping(value = "/staff_delete")
    public String car_delete(@RequestParam(required=false) Integer[] checkId) {
		//接收到id拼接的参数
		try {
			log.info("delete staff .....");
			this.staffService.batchDelete(checkId);
		} catch (Exception e) {
			// TODO: handle exception
			log.error("delete car error...." + e.getMessage() + e.getCause());
		}
		return "redirect:/staff_all?pageNow=1";
    }
	
}
