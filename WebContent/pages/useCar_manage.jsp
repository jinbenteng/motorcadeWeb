<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>用车管理</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/manage-Car-allot.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/base.css" />

<link href="<%=basePath%>pages/css/bootstrap.css" rel="stylesheet">
<link href="<%=basePath%>pages/zTreeStyle/zTreeStyle.css" rel="stylesheet"/>
<script src="<%=basePath%>pages/js/jquery-2.1.3.min.js"></script>
<script src="<%=basePath%>pages/My97DatePicker/WdatePicker.js"></script>
<script src="<%=basePath%>pages/js/jquery.ztree.core-3.5.min.js" ></script>
<script src="<%=basePath%>pages/js/bootstrap.min.js"></script>

</head>
<body >
	<div class="manage-Monitor-title">
    	<div class = "manage-Monitor-title-date">
        	<img src ="<%=basePath%>pages/img/date-logo.png" width="25px" height="25px" style="margin-left:15px;  margin-right:20px;float:left"></img>
            <div style=" width:250px; height:30px; padding-left:30px;  font-size:20px; color:#FFF"  >
				<script>
					var now = new Date();
					document.write(1900+now.getYear()+"年"+(now.getMonth()+1)+"月"+(now.getDate()+"日"));
                </script>
            </div>
        </div>
        <div class = "manage-Monitor-title-logo">
        	 <img src ="./pages/img/login-logo-jt.png" width="10%" height="50%" style="margin-left:65px; margin-top:3%; margin-right:20px;float:left;"></img>
             <img src ="./pages/img/login-title-jt.png" width="60%" height="50%" style=" margin-top:5%;"></img>
        </div>
        
        <div class = "manage-Monitor-title-handle">
        	<div style="font-size:16px; width:56%; float:left; margin-top:2%;">
				 <p id = "username" style="font-size:16px; width:60%; float:left; text-align:right;margin-right:10px">
				 	当前用户:
				 </p>
				 <p id = "username-value" style="font-size:14px; width:30%; float:left; color:#666">
					 ${username}
				 </p>
			 </div>
             <button  class = "btn-reflash" id="refresh" onclick="javascript:location.reload()">刷新</button>
             <button id="cancel" class = "btn-exit">退出</button>
        </div>  
	</div>
	        	<!--  
        <form:form id="form" commandName="useCarInfo" action="useCar_all" method="post"> 


       		<div class="manage-Car-allot-work-seach">
                <div class="manage-Car-allot-work-seach-info2">
                	<span>姓名:</span>
                     <form:input path="driverinfo.staffname" class="manage-Car-allot-work-seach-info1-carnum" value=""/>
                </div>
                <div class="manage-Car-allot-work-seach-info2">
					<span>手机号:</span>
                     <form:input path="driverinfo.tel" class="manage-Car-allot-work-seach-info1-carnum" value=""/>
                </div>
            </div>
            
            <div class="manage-Car-allot-work-seach-info3">
                     <button class="manage-Car-allot-work-btn-seach">检&nbsp;&nbsp;索</button>
            </div>
        </form:form>
        -->
     <div class = "manage-Monitor-left-menu-title" id="manage-Monitor-left-menu-title-id"> 
         <form:form class="manage-car-right-work-data-top-seach-form" id="form" commandName="useCarInfo" action="useCar_all" method="post"> 
			<div class="manage-car-right-work-data-top-seach" style="background:#bfd9f6">
	       	    <input id="pageNow" type="hidden" name="pageNow" value="${page.pageNow}">	
	       	    <form:hidden id="sectorinfo" path="driverinfo.sectorinfo.id" value="0"/>
   	    	    <div class="manage-Car-allot-work-seach">
                   
                 	<div class="manage-Car-allot-work-seach-driverinfoName">
                      <h style=" font-size:14px; width:30%; height:26px;">&nbsp &nbsp姓名:</h>
                      <form:input path="driverinfo.staffname" class="manage-Car-allot-work-seach-input-driverinfoName" />
                     
                    </div>  
                    <div class="manage-Car-allot-work-seach-driverinfoTel">  
                      <h style=" font-size:14px; width:30%; height:26px;">手机号:</h>
                      <form:input path="driverinfo.tel" class = "manage-Car-allot-work-seach-input-driverinfoTel" />
                     </div>    
                                    
                 </div>
                 
                 <button class="manage-Car-allot-work-seach-btn-class">检&nbsp;&nbsp;索</button>
			</div>
	
        </form:form>          
        <div id="manage-Monitor-left-menu-title-panel-group">
        		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="padding: 10px 0;" >
					<div class="panel panel-default zl-panel" >
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne" style="background:#bfd9f6">
							<div id="collapseOneBody" class="panel-body" style="height: 300px; overflow-y: auto; overflow-x: hidden; #616161;">
								<ul id="menuTree" class="ztree" >	
								</ul>
							</div>
						</div>
					</div>
			</div>
        </div>
      </div>   
	 
   		<div class="manage-Car-allot-work" id="manage-Car-allot-work-id"> 
	   		<button  id="manage-Monitor-right-work-data-MenuDisplay-btn" onClick="showMeaun()">》》</button>
	   		<div class="manage-Monitor-right-work" id= "manage-car-right-work-tableid">
                <div class="manage-Monitor-right-work-data">
                    <nav class="manage-Monitor-right-work-navigation-nav" >
                        <ul>
                        <li >
                        	<a  href="car_all?pageNow=1">
                        		<div style="width:40%;height:45%; margin-left:35%;margin-top:10%; background:url(./pages/img/nav-bg.png);background-position:80px -5px;"></div>
                        		<em style="width:100%;height:40%;color:#FFF;">车辆管理</em>
                        	</a>
                        </li>
                       
                        <li>
                        	<a href="driveLog_all?pageNow=1">
                        		<div style="width:35%;height:45%;margin-left:35%; margin-top:10%;background:url(./pages/img/nav-bg.png);background-position:0px 36px;"></div>
                        		<em style="width:100%;height:40%;color:#FFF;">行程纪录</em>
                        	</a>
                        </li>
                        <li >
                        	<a  href="sector_allwithcar?sectorId=1">
                        		<div style="width:30%;height:55%; margin-top:4%;margin-left:35%;background:url(./pages/img/nav-bg.png);background-position:40px 5px;"></div>
                        		<em style="width:100%;height:30%;color:#FFF;">车辆监控</em>
							</a>
						</li>
                        <li >
                        	<a href="staff_all?pageNow=1" onclick="javascript:document.getElementById('sectorinfo').value = 0">
                        	    <div style="width:30%;height:45%;margin-top:10%;margin-left:35%;background:url(./pages/img/nav-bg.png);background-position:120px -3px;"></div>
                        		<em style="width:100%;height:30%;color:#FFF;">员工管理</em>
                        	</a>
                        </li>
                        <li class = "active">
                        	<a href="useCar_all?pageNow=1">
                        	    <div style="width:30%;height:45%;margin-top:10%;margin-left:35%;background:url(./pages/img/i-9.png);background-size:100% 100%"></div>
                        		<em style="width:100%;height:30%;color:#FFF;">用车管理</em>
                        	</a>
                        </li>
                        <li>
                        	<a href="statistical">
                        	    <div style="width:30%;height:45%;margin-top:10%;margin-left:35%;background:url(./pages/img/nav-bg.png);background-size:100% 100%"></div>
                        		<em style="width:100%;height:30%;color:#FFF;">统计管理</em>
                        	</a>
                        </li>
                        </ul>
                    </nav>
                </div>
         
   	
   
     
		<form:form id="form_batch_operation" method="post">
		 
            <div class="manage-Car-allot-work-table">
             	<a class="manage-Car-allot-work-btn-add" href ="<%=basePath%>useCar_add_page" target="_blank">分配车辆</a>
                <a class="manage-Car-allot-work-btn-add" href ="<%=basePath%>useCar_finish" target="_blank" onclick="batch_operation(this.href)">任务完成</a>
            	<table class="table table-bordered" >
                	<thead style="background-image:url(<%=basePath%>pages/img/end-page-bg.png)">
                    	<tr >
                        	<th>
                            	<input type="checkbox" onClick="CheckAll()"></input>
                            </th>
                            <td>指派人</td>
                            <td>车牌号</td> 
                            <td>司机</td>                         
                            <td>联系方式</td>
                            <td>所属部门</td>
                            <td>驾照类型</td>
                            <td>任务开始时间</td>
                            <td>任务结束时间</td>
                            <td>任务状态</td>                      
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.list}" var="useCar"> 
                    	<tr>
                        	<th>
	                            <input type="checkbox" name="checkId" value="${useCar.id}"></input>
                            </th>
                            <td>${useCar.managername}</td>
                            <td>${useCar.carinfo.platenumber}</td>
                            <td>${useCar.driverinfo.staffname}</td>
                            <td>${useCar.driverinfo.tel}</td>
                            <td>${useCar.driverinfo.sectorinfo.sectorname}</td>
                            <td>${useCar.driverinfo.drivertype}</td>
                            <td>${useCar.starttime}</td>
                            <td>${useCar.endtime}</td>
                            <td>${useCar.state==0?'已指派':'已完成'}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <a class="manage-Car-allot-work-btn-del" href ="<%= basePath%>useCar_delete" target="_blank" onclick="batch_operation(this.href)">删除</a><br/>
            </div>
              <div class="manage-car-work-end">
	                <div class="manage-car-work-page">
	                		第 ${page.pageNow} 页   ;   共 ${page.totalPageCount} 页   &nbsp;
		                    	<a id="first" href="#" style="width:50px">首页</a>&nbsp;
		                        <a id="last" href="#" style="width:50px">上一页</a>&nbsp;
		                        <a id="next" href="#" style="width:50px">下一页</a>&nbsp;
		                        <a id="end" href="#" style="width:50px">尾页</a>
	                </div>
	         </div>
		</form:form>
	</div>
 </div>

  
   	
</body>
<script type="text/javascript">
var username = '${username}';
if(username == null || username == ""){
	alert('登陆超时');
	window.location.href = 'login';
}

var work_layout =	document.getElementById('manage-Car-allot-work-id');
var zTree_menu = document.getElementById('manage-Monitor-left-menu-title-id');
function showMeaun(){
	  if(zTree_menu.style.display == "block"){
            zTree_menu.style.display = "none";
			work_layout.style.width="100%";
			$("#manage-Monitor-right-work-data-MenuDisplay-btn").html('》》');
	  }
      else{
            zTree_menu.style.display = "block";
			$("#manage-Monitor-right-work-data-MenuDisplay-btn").html('《《');
			work_layout.style.width="80%";
	  }
}

//初始化ztree
var setting = {
	check: {
		enable: true
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		onClick: zTreeOnClick
	}
};
//点击事件回调函数
function zTreeOnClick(event, treeId, treeNode) {
	$("#sectorinfo").val(treeNode.id);
	$("#pageNow").val(1);
	$("#form").submit();
};
var data = '${sectorData}';
var zNodes =eval(data);
var code;
function setCheck() {
	var zTree = $.fn.zTree.getZTreeObj("menuTree"),
	py = "p",
	sy = "s",
	pn = "p",
	sn = "s",
	type = { "Y":py + sy, "N":pn + sn};
	zTree.setting.check.chkboxType = type;
	showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
}
function showCode(str) {
	if (!code) code = $("#code");
	code.empty();
	code.append("<li>"+str+"</li>");
}
$(document).ready(function(){
	$.fn.zTree.init($("#menuTree"), setting, zNodes);
	setCheck();
	$("#py").bind("change", setCheck);
	$("#sy").bind("change", setCheck);
	$("#pn").bind("change", setCheck);
	$("#sn").bind("change", setCheck);
});

//checkbox反选
function CheckAll(){
	var obj = document.getElementsByName("checkId");
	for(var i=0;i<obj.length;i++){
		obj[i].click();
	}
}
function batch_operation(url){
	var checkboxes = $("input[name='checkId']");
	if(!checkboxes.is(":checked")){
		alert("请至少选中一列");
		if(event.preventDefault){
			event.preventDefault();
		}else{
			event.returnValue = false;
		}
		return false;
	}
	if(confirm("确定执行选中的项吗？")){
		$("#form_batch_operation").attr("action",url);
		$("#form_batch_operation").submit();
	}
	//终止默认动作
	if(event.preventDefault){
		event.preventDefault();
	}else{
		event.returnValue = false;
	}
	return false;
}

function batch_operation(url){
	var checkboxes = $("input[name='checkId']");
	if(!checkboxes.is(":checked")){
		alert("请至少选中一列");
		if(event.preventDefault){
			event.preventDefault();
		}else{
			event.returnValue = false;
		}
		return false;
	}
	if(confirm("确定执行选中的项吗？")){
		$("#form_batch_operation").attr("action",url);
		$("#form_batch_operation").submit();
	}
	//终止默认动作
	if(event.preventDefault){
		event.preventDefault();
	}else{
		event.returnValue = false;
	}
	return false;
}
$(function () {
	var pageNow = $("#pageNow").val();
	var endPage = ${page.totalPageCount};
	$("#first").click(function(){
		if(pageNow == 1){
			alert("已经是第一页了！")
			return false;
		}
		$("#pageNow").val(1);
		$("#form").submit();
		return false;
	})
	$("#last").click(function(){
		if(pageNow == 1){
			alert("已经是第一页了！")
			return false;
		}
		$("#pageNow").val(pageNow-1);
		$("#form").submit();
		return false;
	})
	$("#next").click(function(){
		if(pageNow == endPage){
			alert("已经是最后一页了！")
			return false;
		}
		$("#pageNow").val(parseInt(pageNow)+1);
		$("#form").submit();
		return false;
	})
	$("#end").click(function(){
		if(pageNow == endPage){
			alert("已经是最后一页了！")
			return false;
		}
		$("#pageNow").val(endPage);
		$("#form").submit();
		return false;
	})
	$("#cancel").click(function(){
		if(confirm("是否确认退出当前用户?"))
			window.location.href = "<%=basePath%>manager_outLogin";
	});	
});
</script> 
</html>