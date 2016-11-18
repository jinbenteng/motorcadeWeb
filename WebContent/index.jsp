<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
    <% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
if(request.getSession().getAttribute("username") == null ){
	request.getRequestDispatcher("pages/login.jsp").forward(request,response); 
}else{
	response.sendRedirect(basePath + "pages/fleetmanage-main.jsp");   
}
%>
<html>
<body>
</body>
</html>
