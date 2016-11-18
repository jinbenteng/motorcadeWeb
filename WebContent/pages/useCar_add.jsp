<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<link rel="shortcut icon" href="<%=basePath%>pages/css/images/webicon.png" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="telephone=no" name="format-detection"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>

<title>指派车辆</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/manage-Car-task-allot.css" />
<script src="<%=basePath%>pages/My97DatePicker/WdatePicker.js"></script>
<script src="<%=basePath%>pages/js/jquery-1.8.1.min.js" type="text/javascript"></script>  
</head>
<body class="manage-Car-task-allot-main">
	<div class="manage-Car-task-allot-main-wrap">
		<form:form id="form" commandName="useCarInfo" action="useCar_add" method="post" class="manage-Car-task-allot-main-wrap-form">
			<form:hidden path="managername" value="${username}"/>

		        <div class="manage-Car-task-allot-info">
		        	<p style="font-size:16px; color:#999">驾驶人信息:</p>  
		            <div style="width:100%; height:2px; background:#ccc; "></div>
		            <div style="margin-left:30px; margin-top:10px">
			            <div class="manage-Car-task-allot-info-sectorinfo">  
			            	<p style="width:25%; height:70%;float:left;text-align:right">所在警队:</p>
			                <form:select id="sectorinfo" 
			                 path="carinfo.sectorinfo.id" items="${sectorList}" itemLabel="sectorname" itemValue="id"/>
			            </div>
		            	<div  class="manage-Car-task-allot-info-driverinfo">  
			            	<p style="width:25%; height:70%;float:left;text-align:right">选择司机:</p>
			                <form:select id="driverinfo" 
			                 path="driverinfo.id" items="${driverList}" itemLabel="staffname" itemValue="id"/>
			            </div>
			            <div class="manage-Car-task-allot-info-carinfo">  
			            	<p style="width:25%; height:70%;float:left;text-align:right">选择车辆:</p>
			                <form:select id="sectorinfo" 
			                 path="carinfo.id" items="${carList}" itemLabel="platenumber" itemValue="id"/>
			            </div>
			            <div class="manage-Car-task-allot-info-usercardate">   
		            		<p style="width:25%; height:70%;float:left;text-align:right">用车时间:</p>
					     	<form:input  path="starttime" id="time"  class ="Wdate" type="text"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" placeholder="精确到秒"></form:input>                
		            	</div> 
		            	<div class="manage-Car-task-allot-info-remark">   
		            		<p style="width:25%; height:70%;float:left;text-align:right">任务描述:</p>     
		                 	<form:textarea  path="descprition" class ="textarea-task-info"  placeholder="最多不能超过50个字"></form:textarea>      
		            	</div>
		            </div>	

			       
		         
		        </div>
	     	   <div style="width:100%; height:2px; background:#ccc; "></div>  
		        <div class="manage-Car-task-allot-submit" >
			            <button id="submit" class = "btn_submit" type="submit">提交</button>
		            	<button class = "btn_reset" id="reset" type="reset">重置</button>
		         </div>
		    
		</form:form>

	</div>	
	
	  <div class = "login-copy-end">
	    	<div class="login-copy" >© 北京金奔腾汽车科技有限公司&nbsp;&nbsp;版权所有</div>
	    	<div class="login-remark">（访问本网站建议您使用Chrome、IE9及以上版本浏览器，至少1024*768分辨率）</div>
	   </div>
   
</body>

<script type = "text/javascript">
$(function () {
	var msg = '${msg}';
	if(msg == null || msg == ""){
		return;
	}else{
		alert(msg);
	}
	$("#submit").click(function(){
		var regTime = /^([0-2][0-9]):([0-5][0-9]):([0-5][0-9])$/;
		var time = $("#time").val();
		 if(!regTime.test(time)){
			alert("时间格式错误 -- 例：2016-12-12 23:59:59");
			return false;
		 }
	});
});
</script>

</html>