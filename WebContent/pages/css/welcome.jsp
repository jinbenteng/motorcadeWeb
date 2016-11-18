<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    登陆成功${username}
    <button id="cancel">注销</button>
</body>
<script src="<%=basePath%>pages/js/jquery-1.8.1.min.js" type="text/javascript"></script> 
<script type="text/javascript">
$(function(){
	$("#cancel").click(function(){
		if(confirm("是否确认退出当前用户?"))
			window.location.href = "<%=basePath%>outLogin";
	});	
});
</script>
</html>