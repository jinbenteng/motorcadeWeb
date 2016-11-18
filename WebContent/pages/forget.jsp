<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
    <% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<link rel="shortcut icon" href="./css/images/webicon.png" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="telephone=no" name="format-detection"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>

<title>忘记密码</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/base.css" />
<link rel="stylesheet" type="text/css" href="./css/forget.css" />
<script src="./js/jquery-1.8.1.min.js" type="text/javascript"></script>  
</head>
<body class="forget-main">
	

	    <div class="forget-login-container">
	     <form action="<%=basePath%>manager_forget" class="forget-login-container-form">
	        <div class="reg-telValidate" >
	        	 
	        	<p style="font-size:16px; color:#999">手机号验证:</p>  
	        	
	            <div style="width:100%; height:2px; background:#ccc;"></div>
	            <div class="forget-setTel">
		               
		            	<p style="width:25%; height:70%;float:left;text-align:right">手机号码:</p>
		                <input class = "input_tel" name="tel" type="text"/>
		               <!--  <input id="input_getCode" type="button" value="发送验证码"/>  -->
		           
	            </div>
	            <!-- <br/>
				<div style="margin-left:30px">  
	            	<span >验证码:</span> 
	          		<input id="telCode" type="text" style="margin-left:48px"/>
	            </div> -->
	        </div>
		
	        <div class="forget-setpassword">
	        	<p style="font-size:16px; color:#999">新密码:</p>    
	            <div style="width:100%; height:2px; background:#ccc;"></div>  
	            <div  class="forget-password">   
	            	<p style="width:25%; height:70%;float:left;text-align:right">密码:</p>
	            	<input type="password" id="pwd1" name="password" />
	            </div>
	           
	           
				<div  class="forget-truepassword">   
	            	<p style="width:25%; height:70%;float:left;text-align:right">确认密码:</p>
	            	<input type="password" id="pwd2" name="password2"  />
	            </div>
	          
	
	        </div>
	        
	        	 <div style="width:100%; height:2px; background:#ccc;"></div> 	                
	        <div class="forget-submit">
 
		            <button class = "btn_submit" id="btn_submit" type="submit" >提交</button>
	            	<button class = "btn_reset" id="reset" type="button">重置</button>
	            	
	         </div>
		</form>
	   


	
    </div>
  	<div class="login-copy-end">
   		<div class="login-copy" >© 北京金奔腾汽车科技有限公司&nbsp;&nbsp;版权所有</div>
   		<div class="login-remark">（访问本网站建议您使用Chrome、IE9及以上版本浏览器，至少1024*768分辨率）</div>
    </div> 
</body>

<script type = "text/javascript">
<%-- var InterValObj; //timer变量，控制时间  
var count = 60; //间隔函数，1秒执行  
var curCount;//当前剩余秒数  
var code = ""; //验证码  
var codeLength = 6;//验证码长度  
$(function(){
	$("#input_getCode").click(function() {  
		curCount = count;  
		var phone=$(".input_tel").val();//手机号码  
		if(phone != ""){  
			//产生验证码  
			for (var i = 0; i < codeLength; i++) {  
				code += parseInt(Math.random() * 9).toString();  
			}  
			//设置button效果，开始计时  
			$("#input_getCode").attr("disabled", "true");  
			
			$("#input_getCode").val("请在" + curCount + "秒内输入验证码");  
		   InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次  
			//向后台发送处理数据 
		   var url = '<%= basePath%>service';
			var param = {
					"serviceNo" : 9001,
					"tel" : phone
			}
			$.post(url,param,function(data){
				//若 data 的返回值为 1, 则提示 删除成功, 且把当前行删除
				var msg = eval(data);
				code = msg['msgCode'];
				//$("#telCode").val(code);
			});
		}else{  
			alert("手机号码不能为空！");  
		}  
	}); 
		//timer处理函数  
	function SetRemainTime() {  
		if (curCount == 0) {                  
			window.clearInterval(InterValObj);//停止计时器  
			$("#input_getCode").removeAttr("disabled");//启用按钮  
			$("#input_getCode").val("重新发送验证码");  
			code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效      
		}  
		else {  
			curCount--;  
			$("#input_getCode").val("请在" + curCount + "秒内输入验证码");  
		}  
	}
	 --%>	
	$(".btn_submit").click(function(){
		//var input_code = $("#telCode").val();
		var p1 = $("#pwd1").val();
		var p2 = $("#pwd2").val();
		/* if(input_code != code){
			alert("请输入正确的校验码！");
			return false;
		}else if(p1 == null || p1 ==""){
			alert("请输入密码");
			return false;
			
		}else  */
		if(p1 == null || p1 ==""){
			alert("请输入密码");
			return false;
			
		}
		if(p1 != p2){
			alert("两次密码输入不一致！");
			return false;
		}else{
			return;
		}
	});
});
</script>
</html>