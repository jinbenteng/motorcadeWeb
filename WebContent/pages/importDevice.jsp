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

<title>导入设备</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/manage-Section-add.css" />
<script src="<%=basePath%>pages/js/jquery-1.8.1.min.js" type="text/javascript"></script>  
</head>
<body class="manage-car-add-importData-main">
	<div class="manage-car-add-importData-main-wrap">
  
		<form action="<%=basePath%>importDevice" method="post" enctype="multipart/form-data" class="manage-car-add-importData-main-wrap-from">
		     <div class="manage-Section-add-wrap">
		     	  <p style="font-size:16px; color:#999">数据源信息:</p>  
		          <div style="width:100%; height:2px; background:#ccc;"></div>   
		          <div class="manage-Section-add-wrap-fileImport">   
					        <p style="width:25%; height:70%;float:left;text-align:right">选择文件:</p>
		           			<input type="file" id="fileImport" name="fileName" class="fileImport">
		           			<input type="submit" value="导入" id="importData" class="importData"/>
		          </div>			
		    </div>
		</form>
	
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
	}else{
		alert(msg);
	}
	$("#importData").click(function(){
		var filePath = $("#fileImport").val();
		if(filePath == "" || filePath.length <= 0){
			alert("请选择需要导入的文件!");	
			return false;
		}
		if(filePath.indexOf(".xls")<=0){
			alert("文件格式错误,目前只支持excel(.xls,xlsx)格式的文件!");
			return false;
		}
		$("#myForm").submit();
	})
});
</script>

</html>