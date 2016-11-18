package com.jbt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jbt.util.DateUtil;
import com.jbt.util.RequestUtil;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private final Logger log = LoggerFactory.getLogger(LoginInterceptor.class); 
	private static final String[] IGNORE_URI = {"/manager","/service","/msgservice","/js"};

	 @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if ("GET".equalsIgnoreCase(request.getMethod())) {  
	            RequestUtil.saveRequest();  
        }  
        //log.info("==============执行顺序: 1、preHandle================");    
        String requestUri = request.getRequestURI();  
        String contextPath = request.getContextPath();  
        String url = requestUri.substring(contextPath.length());  
        
        log.info("requestUri:"+requestUri);    
/*        log.info("contextPath:"+contextPath);    
        log.info("url:"+url);   */
        
        for (String s : IGNORE_URI) {
            if (url.contains(s)) {
                return true;
            }
        }
        
        String username =  (String) request.getSession().getAttribute("username");   
        if(username == null){  
            //log.info("Interceptor：跳转到login页面！");  
            //response.getWriter().write("session null");
            request.getRequestDispatcher("pages/login.jsp").forward(request, response);  
            return false;
        }
        return true;
    }
 
    /** 
     * 在业务处理器处理请求执行完成后,生成视图之前执行的动作    
     * 可在modelAndView中加入数据，比如当前时间 
     */  
    @Override    
    public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {     
        //log.info("==============执行顺序: 2、postHandle================");    
        if(modelAndView != null){  //加入当前时间    
            modelAndView.addObject("time", DateUtil.getNow());    
        } 
    }
	 
    /**  
     * 在DispatcherServlet完全处理完请求后被调用,可用于清理资源等   
     *   
     * 当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion()  
     */    
    @Override    
    public void afterCompletion(HttpServletRequest request,    
            HttpServletResponse response, Object handler, Exception ex)    
            throws Exception {    
        //log.info("==============执行顺序: 3、afterCompletion================");    
    } 
    
}
