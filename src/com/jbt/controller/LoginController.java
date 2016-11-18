package com.jbt.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jbt.bean.ManagerInfo;
import com.jbt.service.ManagerInfoService;
import com.jbt.util.DateUtil;

@Controller
public class LoginController {

	private final Logger log = LoggerFactory.getLogger(LoginController.class);
	@Resource
	private ManagerInfoService managerService;
	
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public String home() {
		log.info("返回首页！");
		return "index";
	}
	
	//添加用户
	@RequestMapping(value = "/manager_add")
    public String addManager(ManagerInfo manager,Model model) {
		//查询用户名和手机号
		ManagerInfo manager1 = managerService.selectByNameAndTel(manager);
		if(manager1 != null){
			model.addAttribute("msg","用户名或手机号已存在！");
			model.addAttribute("manager",manager);
			return "register";
		}else{
			manager.setState(0);
			manager.setCreatedate(DateUtil.getNow());
			managerService.insert(manager);
			model.addAttribute("msg","注册成功");
			return "login";
		}
    }
	
	//退出登陆
	@RequestMapping(value = "/manager_outLogin",method = RequestMethod.GET)
    public String outLogin(HttpServletRequest request) {
		String userName = (String) request.getSession().getAttribute("username");
		if(userName != null){
			request.getSession().removeAttribute("username");
			return "login";
		}else{
			return "login";
		}
    }
	
	//忘记密码
	@RequestMapping(value = "/manager_forget",method = RequestMethod.GET)
    public String forget(HttpServletRequest request,@RequestParam String tel,@RequestParam String password) {
		managerService.resetPwdByTel(tel,password);
		return "login";
    }
	
	@RequestMapping(value = "/manager_login",method = RequestMethod.POST)
    public String login(HttpServletRequest request,@RequestParam String userName, @RequestParam String password,Model model) {
    	if(userName == null || userName.trim().equals("") || password == null || password.trim().equals("")){
    		model.addAttribute("msg", "用户名或密码为空");
    		return "login";
    	}
		ManagerInfo manager = managerService.selectByName(userName);
    	if(manager!=null){
    		if(manager.getPassword().equals(password)){
    			request.getSession().setAttribute("username", userName);
    			request.getSession().setAttribute("managerId", manager.getId());
    			//return "redirect:/staff_all?pageNow=1"; 
    			return "fleetmanage-main";
    		}else{
    			log.info("密码错误");
    			//model.addAttribute("userName", "游客");
    			model.addAttribute("msg", "密码错误,登录失败");
        		return "login";
    		}
    	}else{
    		log.info("用户名不存在");  
    		model.addAttribute("msg", "用户名不存在,登录失败");
    		return "login"; 
    	}
    }
	
	
}
