package com.jbt.controller;

import java.io.File;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jbt.bean.CarInfo;
import com.jbt.bean.DeviceInfo;
import com.jbt.service.CarInfoService;
import com.jbt.service.SectorInfoService;
import com.jbt.service.StaffInfoService;
import com.jbt.util.DateUtil;
import com.jbt.util.Page;

@Controller
public class CarController {

	private final Logger log = LoggerFactory.getLogger(CarController.class);
	@Resource
	private StaffInfoService staffService;
	@Resource
	private CarInfoService carService;
	@Resource
	private SectorInfoService sectorService;

	
	//跳转到用车添加页面
	@RequestMapping(value = "/car_add_page")
    public String car_add_page(Model model) {
		//提供警队，车辆，和司机列表初始化表单
		model.addAttribute("sectorList", sectorService.selectCoreSector());//应该是根据部门ID选择对应对的车辆和司机
		model.addAttribute("brandList", sectorService.selectVehicleBrand());
		//初始化form 
		model.addAttribute("carInfo", new CarInfo());
		return "car_add";
    }
	
	//添加用车记录
	@RequestMapping(value = "/car_add")
    public String car_add(CarInfo carInfo,Model model) {
		carInfo.setState(0);
		if(carInfo.getTotalmileage() == null){
			carInfo.setTotalmileage((float) 0);
		}
		try {
			carService.insert(carInfo);
			return "redirect:/car_all?pageNow=1";
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e.getMessage());
			model.addAttribute("sectorList", sectorService.selectCoreSector());//应该是根据部门ID选择对应对的车辆和司机
			model.addAttribute("carInfo", carInfo);
			model.addAttribute("brandList", sectorService.selectVehicleBrand());
			model.addAttribute("msg", "添加失败,可能是一个已经添加过的数据或sn号不存在！");
			return "car_add";
		}
    }
	
	//用车查询界面
	@RequestMapping(value = "/car_all")
    public String car_all(CarInfo carInfo,Model model,@RequestParam(required=false) Integer pageNow) {
		Page page = carService.getPageList(carInfo,pageNow);
		model.addAttribute("carInfo", carInfo);
		model.addAttribute("page",page);
		model.addAttribute("sectorData",sectorService.getTreeData().toString());
		return "car_manage";
    }
	
	//批量删除操作
	@RequestMapping(value = "/car_delete")
    public String car_delete(@RequestParam(required=false) Integer[] checkId) {
		//接收到id拼接的参数
		try {
			log.info("delete car .....");
			this.carService.batchDelete(checkId);
		} catch (Exception e) {
			// TODO: handle exception
			log.error("delete car error...." + e.getMessage() + e.getCause());
		}
		return "redirect:/car_all?pageNow=1";
    }

	
	@ResponseBody
	@RequestMapping(value="/car_getSeries", produces = {"application/text;charset=UTF-8"})
	public String car_getSeries(@RequestParam (required=false) String brand){
		//构建ztree节点数据格式
		List<String> seriesList = sectorService.selectVehicleSeries(brand);
		StringBuffer sb = new StringBuffer();
		for (String string : seriesList) {
			sb.append(string + ",");
		}
		sb.deleteCharAt(sb.length()-1);
		return sb.toString();
	}
	@ResponseBody
	@RequestMapping(value="/car_getModel", produces = {"application/text;charset=UTF-8"})
	public String car_getModel(@RequestParam (required=false) String series){
		List<String> modelList = sectorService.selectVehicleModel(series);
		StringBuffer sb = new StringBuffer();
		for (String string : modelList) {
			sb.append(string + ",");
		}
		sb.deleteCharAt(sb.length()-1);
		return sb.toString();
	}
	
	//获取未绑定车辆的sn编号
	@ResponseBody
	@RequestMapping(value="/getDeviceSn", produces = {"application/text;charset=UTF-8"})
	public String getDeviceSn(String sn){
		List<String> modelList = sectorService.getDeviceSn(sn);
		StringBuffer sb = new StringBuffer();
		for (String string : modelList) {
			sb.append("<option>" + string + "</option>");
		}
		return sb.toString();
	}
	@RequestMapping(value = "/importDevice")
    public String importDevice(Model model,HttpServletRequest request,@RequestParam("fileName") MultipartFile file) {
		try {
			String temp = request.getSession().getServletContext()
			        .getRealPath(File.separator)
			        + "temp"; // 临时目录
			    File tempFile = new File(temp);
			    if (!tempFile.exists()) {
			      tempFile.mkdirs();
			    }
			    if (file != null){
			    	InputStream in = file.getInputStream();
			    	String fileName = file.getOriginalFilename();
			    	System.out.println(fileName);
			    	if(fileName.endsWith(".xls")){
			    		//2003版
			    		POIFSFileSystem fs = new POIFSFileSystem(in);
			    		Workbook book = new HSSFWorkbook(fs);
						HSSFSheet sheet = (HSSFSheet) book.getSheetAt(0);
						int total = sheet.getLastRowNum();
						String date = DateUtil.getNow();
						DeviceInfo device;
						for (int i = 1; i <= total; i++) {
							HSSFRow row = sheet.getRow(i);
							if (row != null) {
								device = new DeviceInfo();
								device.setSn(getValue(row.getCell(0)));
								device.setAdder("excel");
								device.setState(0);
								device.setCardstate(0);
								device.setCreatedate(date);
								try {
									carService.insert(device);
								} catch (Exception e) {
									// TODO: handle exception
									model.addAttribute("msg", device.getSn() + ":已存在，请删除该数据后重新导入！");
									return "importDevice";
								}
							}
						}
				    	model.addAttribute("msg", "导入成功");
			    	}else if(fileName.endsWith(".xlsx")){
			    		//2007版
			    		XSSFWorkbook book = new XSSFWorkbook(in);
						XSSFSheet sheet = (XSSFSheet) book.getSheetAt(0);
						int total = sheet.getLastRowNum();
						String date = DateUtil.getNow();
						DeviceInfo device;
						for (int i = 1; i <= total; i++) {
							XSSFRow row = sheet.getRow(i);
							if (row != null) {
								device = new DeviceInfo();
								device.setSn(getValue(row.getCell(0)));
								device.setAdder("excel");
								device.setState(0);
								device.setCardstate(0);
								device.setCreatedate(date);
								try {
									carService.insert(device);
								} catch (Exception e) {
									// TODO: handle exception
									model.addAttribute("msg", device.getSn() + ":已存在，请删除该数据后重新导入！");
									return "importDevice";
								}
							}
						}
				    	model.addAttribute("msg", "导入成功");
			    	}else{
			    		model.addAttribute("msg", "读取文件错误");
			    	}
			    }
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "导入失败");
		}
		return "importDevice";
    }
	private String getValue(HSSFCell hssfCell) {
		if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
		    return String.valueOf(hssfCell.getBooleanCellValue());
		} else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
		    return String.valueOf(hssfCell.getNumericCellValue());
		} else {
		    return String.valueOf(hssfCell.getStringCellValue());
		}
	}
	private String getValue(XSSFCell xssfRow) {
		if (xssfRow.getCellType() == xssfRow.CELL_TYPE_BOOLEAN) {
		    return String.valueOf(xssfRow.getBooleanCellValue());
		} else if (xssfRow.getCellType() == xssfRow.CELL_TYPE_NUMERIC) {
		   return String.valueOf(xssfRow.getNumericCellValue());
		} else {
		    return String.valueOf(xssfRow.getStringCellValue());
		}
	}
}
