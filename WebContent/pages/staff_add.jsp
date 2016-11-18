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

<title>新增员工</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/manage-Staff-add.css" />
<script src="<%=basePath%>pages/js/jquery-1.8.1.min.js" type="text/javascript"></script>  
</head>
<body class="manage-Car-add-staff-main">
	<div class="manage-Car-add-staff-main-wrap">
		<form:form commandName="staffinfo" action="staff_add" method="post" class="manage-Car-add-staff-main-wrap-form">
			<form:hidden path="adder" value="${username}"/>
		    
		        <div class="manage-Car-add-staff-main-wrap-form-info">
		        	<p style="font-size:16px; color:#999">员工信息:</p>  
		            <div style="width:100%; height:2px; background:#ccc;"></div>
		            <div class="manage-Car-add-staff-main-wrap-form-info-name">
			           
			            	<p style="width:25%; height:70%;float:left;text-align:right">员工姓名:</p>
			                <form:input id="staffname" class = "input_Staffname" path="staffname" />
			          
		           </div>
					<div class="manage-Car-add-staff-main-wrap-form-info-tel">  
		            	<p style="width:25%; height:70%;float:left;text-align:right">手机号:</p> 
		          		<form:input id="tel" class = "input_Stafftel" path="tel" size="11"/>
		            </div>
		           
		            <div class="manage-Car-add-staff-main-wrap-form-info-sex">  
		            	<p style="width:25%; height:70%;float:left;text-align:right">性别:</p> 
		          		    <form:select path="sex" >
		                        <option value = "1">男</option>
		                        <option value = "0">女</option>
		                    </form:select>
		            </div>
		            
		                <div class="manage-Car-add-staff-main-wrap-form-info-stafftype">  
		                    <p style="width:25%; height:70%;float:left;text-align:right">司机师傅:</p> 
		                    <form:select path="stafftype"  >
		                        <option value ="1" >是</option>
		                        <option value ="0">否</option>
		                    </form:select>
		                </div>
		         
		            <div class="manage-Car-add-staff-main-wrap-form-info-drivertype">  
		            	<p style="width:25%; height:70%;float:left;text-align:right">驾照类型:</p> 
		          		<form:select path="drivertype" >
		                    <option value = "C1">C1</option>
		                    <option value = "C2">C2</option>
		                    <option value = "B1">B1</option>
		                    <option value = "B2">B2</option>
		                    <option value = "A1">A1</option>
		                    <option value = "A2">A2</option>
		                </form:select>
		            </div>
		        </div>
		
		        <div class="manage-Staff-add-section">
		        	<p style="font-size:16px; color:#999">警队选择:</p>    
		            <div style="width:100%; height:2px; background:#ccc;"></div>  
				     <form:hidden id="sectorinfo" path="sectorinfo.id" value="-1"/>
		            <div class="manage-Staff-add-section-team-class">   
		                <ul>
		                    <li> 
		                    	<p style="width:25%; height:70%;float:left;text-align:right">一级:</p>
				                <select id="sectorOne" >
					                <option value="-1">请选择一级警队</option>
				                </select>
				                <a  id="addOne" href="#">添加一级警队</a>
				            </li>
		                    <li>
		                    	<p style="width:25%; height:70%;float:left;text-align:right">二级:</p>
				                 <select id="sectorTwo" >
					                <option value="-1">请选择二级警队:</option>
				                </select>
				                <a  id="addTwo" href="#">添加二级警队</a>
				            </li>
		                    <li>
		                     <p style="width:25%; height:70%;float:left;text-align:right">三级:</p>
				                 <select id="sectorThree" >
					                <option value="-1">请选择三级警队:</option>
				                </select>
				                <a  id="addThree" href="#">添加三级警队</a>
				            </li>
		                    <li>
		                    <p style="width:25%; height:70%;float:left;text-align:right">四级:</p>
				                 <select id="sectorFour" >
					                <option value="-1">请选择四级警队:</option>
				                </select>
				                <a  id="addFour" href="#">添加四级警队</a>
				            </li>
		                </ul>
		            </div>   
		        </div>
		        <div style="width:100%; height:2px; background:#ccc;"></div>  
		        <div class="manage-Staff-add-submit" style="margin-bottom:40px">
			            <button id="btn_submit" class = "btn_submit" type="submit"  >提交</button>
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
	}else{
		alert(msg);
	}
	//sectorinfo
	//选择所在部门 //sectorOne  sectorTwo  sectorThree  sectorFour
	var sectorOne= document.getElementById("sectorOne");
	var json = ${sectorList};
	for(var i = 0 ; i < json.length ; i++){
		$("#sectorOne").append(
                "<option value='"+json[i].id+"'>"+json[i].name
                + "</option>");
	}
	//一级警队改变二级内容随之改变
	$("#sectorOne").change(function(){
		$("#sectorTwo").empty(); 
		$("#sectorTwo").append("<option value='-1'>请选择二级警队:</option>");
		var sectorId = $("#sectorOne").val();
		$("#sectorinfo").val(sectorId);
		if(sectorId == -1){return false;}
		var param = {
			"sectorId" : sectorId,
		};
		var url = "sectorById";
		$.post(url , param , function(data){
			if(data != null && data != ""){
				var json = eval(data);
				for(var i=0 ; i<json.length;i++){
	                 $("#sectorTwo").append(
	                         "<option value='"+json[i].id+"'>"+json[i].name
	                                 + "</option>");			              
	            }
			}
		});
	});
	//二级警队改变三级内容随之改变
	$("#sectorTwo").change(function(){
		$("#sectorThree").empty(); 
		$("#sectorThree").append("<option value='-1'>请选择二级警队:</option>");
		var sectorId = $("#sectorTwo").val();
		$("#sectorinfo").val(sectorId);
		if(sectorId == -1){return false;}
		var param = {
			"sectorId" : sectorId,
		};
		var url = "sectorById";
		$.post(url , param , function(data){
			if(data != null && data != ""){
				var json = eval(data);
				for(var i=0 ; i<json.length;i++){
	                 $("#sectorThree").append(
	                         "<option value='"+json[i].id+"'>"+json[i].name
	                                 + "</option>");			              
	            }
			}
		});
	});
	//三级警队改变四级内容随之改变
	$("#sectorThree").change(function(){
		$("#sectorFour").empty(); 
		$("#sectorFour").append("<option value='-1'>请选择二级警队:</option>");
		var sectorId = $("#sectorThree").val();
		$("#sectorinfo").val(sectorId);
		if(sectorId == -1){return false;}
		var param = {
			"sectorId" : sectorId,
		};
		var url = "sectorById";
		$.post(url , param , function(data){
			if(data != null && data != ""){
				var json = eval(data);
				for(var i=0 ; i<json.length;i++){
	                 $("#sectorFour").append(
	                         "<option value='"+json[i].id+"'>"+json[i].name
	                                 + "</option>");			              
	            }
			}
		});
	});
	//四级改变
	$("#sectorFour").change(function(){
		$("#sectorinfo").val($("#sectorFour").val());
	})
	
	$("#btn_submit").click(function(){
		if($("#sectorinfo").val() == -1){
			alert("请选择员工所属部门");
			return false;
		}else if(S("#staffname").val()==null || S("#staffname").val()==""){
			alert("请填写员工姓名");
			return false;
		}
	})
	
	$("#addOne").click(function(){
		var sectorId = 0;
		window.location.href = 'sector_add_page?sectorId='+sectorId+'&url=staff_add_page';
	})
	
	$("#addTwo").click(function(){
		if($("#sectorOne").val() == -1){
			alert("请选择要添加部门的上级部门！");
			return false;
		}
		$("#addTwo").attr("href",'sector_add_page?sectorId='+$("#sectorOne").val()+'&url=staff_add_page');
	})
	
	$("#addThree").click(function(){
		if($("#sectorTwo").val() == -1){
			alert("请选择要添加部门的上级部门！");
			return false;
		}
		$("#addThree").attr("href",'sector_add_page?sectorId='+$("#sectorTwo").val()+'&url=staff_add_page');
	})
	
	$("#addFour").click(function(){
		if($("#sectorThree").val() == -1){
			alert("请选择要添加部门的上级部门！");
			return false;
		}
		$("#addFour").attr("href",'sector_add_page?sectorId='+$("#sectorThree").val()+'&url=staff_add_page');
	})
	
});
</script>
</html>