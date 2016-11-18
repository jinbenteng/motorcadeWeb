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

<title>新增部门</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/manage-Section-add.css" />
<script src="<%=basePath%>pages/js/jquery-1.8.1.min.js" type="text/javascript"></script>  
</head>
<body class="manage-car-add-importData-main">
	<div class="manage-car-add-importData-main-wrap">
		<form:form commandName="sectorInfo" action="sector_add" method="post" class="manage-car-add-importData-main-wrap-from">
			<form:hidden path="level" value="${level}"/>
			<form:hidden path="parentinfo" value="${sectorId}"/>
			<input type="hidden" name="url" value="${url}">
		     <div class="manage-Section-add-wrap-check">
		       

		        	<p style="font-size:16px; color:#999">当前部门添加部门级别:${level}</p>  
		            <div style="width:100%; height:2px; background:#ccc;"></div>   
		            <div class="manage-Section-add-info-SectionName">   
						<p style="width:25%; height:70%;float:left;text-align:right">所属部门:</p>
						<p style="width:25%; height:70%;float:left;text-align:left; margin-left: 5%;">${parentSector}</p>
					            
		            </div>			
		
					<div class="manage-Section-add-info-SetSectionName">            
						<p style="width:25%; height:70%;float:left;text-align:right">添加部门:</p>
						<form:input path="sectorname" id="sectorName" class = "input_add_section" style="margin-left:34px"/> 
				
					</div>
		    </div>

		    <div style="width:100%; height:2px; background:#ccc;"></div>  
			<div class="manage-Staff-add-submit" >
			    <button id="btn_submit" class = "btn_submit" type="submit"  >提交</button>
			   	<button class = "btn_reset" id="reset" type="reset">重置</button>
			</div>
		</form:form>
	</div>
	 
	<div class="login-copy-end">
   		<div class="login-copy" >© 北京金奔腾汽车科技有限公司&nbsp;&nbsp;版权所有</div>
   		<div class="login-remark">（访问本网站建议您使用Chrome、IE9及以上版本浏览器，至少1024*768分辨率）</div>
    </div>

</body>

<script type = "text/javascript">
$(function () {
	$("#btn_submit").click(function(){
		if($("#sectorName").val() == null || $("#sectorName").val() == ""){
			alert("请输入部门名称！")
			return false;
		}
	})
});
</script>

</html>