<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
    <% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<link rel="shortcut icon" href="<%=basePath%>pages/css/images/webicon.png" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="telephone=no" name="format-detection"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<title>登录</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/login.css" />

<script src="<%=basePath%>pages/js/jquery-1.8.1.min.js" type="text/javascript"></script>  
<%-- <script type="text/javascript" src="<%=basePath%>/pages/js/index.js"></script> --%>
</head>
<body >
    <div class="login-wrap">
        <div class="login-container">     
     		 <img src ="./pages/img/login-logo-jt.png" width="10%" height="60%" style="margin-left:65px; margin-top:3%; margin-right:20px;float:left;"></img>
             <img src ="./pages/img/login-title-jt.png" width="40%" height="30%" style=" margin-top:5%;"></img> 
        </div>
        <div class="login-center">
	        <div class="login-center-info">
	      		  
	           <form action="<%=basePath%>manager_login" method="post">
	        	   <div class ="div-user">
	               		<img src="<%=basePath%>pages/img/login-user-logo.png" width="10%" height="40%"; style=" margin-left:5%; margin-top:3%; float:left"></img>
		                <input class = "input-user" name="userName" type="text"; placeholder="请输入用户名" ></input>
	                   
	               </div>
	               <div class ="div-pwd">
	               		<img src="<%=basePath%>pages/img/login-pwd-logo.png" width="10%" height="40%"; style=" margin-left:5%; margin-top:3%;float:left"></img>
	                    <input class = "input-pwd" name="password" type="password" placeholder="密码" ></input>
	               </div>
	               <div class ="div-btn">
		                <a href="<%=basePath%>pages/forget.jsp" style="color:#fff; margin-right:40px; float:right">忘记密码!</a>
		               
		               <button type="submit"  class ="btn_login">登录</button>
		               <a style="font-size:15px; float:left; margin-top:5px;color:#ccc">还不是用户 , 立即</a>
	               		<a  class ="btn_reg" href="<%=basePath%>pages/register.jsp">注册!</a>
	               </div> 
	            </form>
	          	

	              
	        </div>
   
       </div>
        <div class="login-copy-end">
      
            <div class="login-copy" >© 北京金奔腾汽车科技有限公司&nbsp;&nbsp;版权所有</div>
	        <div class="login-remark">（访问本网站建议您使用Chrome、IE9及以上版本浏览器，至少1024*768分辨率）</div>
	       
	    </div> 
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
	$(".btn_login").click(function () { //“登录”按钮单击事件
		var username = $(".input-user").val();
		var pwd = $(".input-pwd").val();
		if(username != ""){
			
			if(pwd !=""){ 
				return;
			}else{
				alert("密码不能为空");
				return false;
			}
		}else{
				alert("用户名不能为空");  
				return false;
		}
	})
})
</script>
</html>