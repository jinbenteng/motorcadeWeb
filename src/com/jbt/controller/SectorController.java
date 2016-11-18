package com.jbt.controller;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jbt.bean.ManagerInfo;
import com.jbt.bean.SectorInfo;
import com.jbt.service.ManagerInfoService;
import com.jbt.service.SectorInfoService;
import com.jbt.util.DateUtil;


@Controller
public class SectorController {

	private final Logger log = LoggerFactory.getLogger(SectorController.class);
	@Resource
	private SectorInfoService sectorService;
	@Resource
	private ManagerInfoService managerService;
	
		@RequestMapping(value = "/sector_add_page" ,method = RequestMethod.GET )
	    public String sector_add_page(Model model,@RequestParam Integer sectorId,String url) {
			if(sectorId == 0){
				model.addAttribute("sectorId", 0);
				model.addAttribute("parentSector", "无");
				model.addAttribute("level", 1);
				model.addAttribute("url", url);
			}else{
				SectorInfo s =  sectorService.selectByPrimaryKey(sectorId);
				model.addAttribute("sectorId", s.getId());
				model.addAttribute("parentSector", s.getSectorname());
				model.addAttribute("level", s.getLevel() + 1);
				model.addAttribute("url", url);
			}
			//初始化form 
			model.addAttribute("sectorInfo", new SectorInfo());
			return "sector_add";
	    }
		
		@RequestMapping(value = "/sector_add")
	    public String sector_add(HttpServletRequest request,SectorInfo sectorInfo,Model model,String url) {
			ManagerInfo manager = managerService.selectByName((String)request.getSession().getAttribute("username"));
			if(manager == null){
				return "redirect:/";
			}
			sectorInfo.setManagerinfo(manager);
			sectorInfo.setCreatedate(DateUtil.getNow());
			if(sectorInfo.getParentinfo() == 0){
				sectorInfo.setParentinfo(null);
			}
			sectorInfo.setState(0);
			try {
				sectorService.insert(sectorInfo);
				if(sectorInfo.getLevel() == 1){
					sectorService.setRootId(sectorInfo.getId());
				}
			} catch (Exception e) {
				// TODO: handle exception
				log.error(e.getMessage());
			}
			return "redirect:/" + url;
	    }
	
	@ResponseBody
	@RequestMapping(value="/sectorById", produces = {"application/json;charset=UTF-8"})
	public String sectorById(Integer sectorId){
		JSONArray jsonArr = new JSONArray();
		JSONObject jdata = null;
		List<SectorInfo> sectorList = sectorService.selectByParentId(sectorId);
		if(sectorList == null || sectorList.size() == 0){
			return "";
		}
		for (Iterator<SectorInfo> iterator = sectorList.iterator(); iterator.hasNext();) {
			SectorInfo sectorInfo =  iterator.next();
			jdata = new JSONObject();
			jdata.put("id", sectorInfo.getId());
			jdata.put("name", sectorInfo.getSectorname());
			jsonArr.add(jdata);
		}
		return jsonArr.toString();
	}
	
}
