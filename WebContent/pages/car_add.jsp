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

<title>新增车辆</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/manage-Car-add.css" />
<script src="<%=basePath%>pages/My97DatePicker/WdatePicker.js"></script>
<script src="<%=basePath%>pages/js/jquery-1.8.1.min.js" type="text/javascript"></script>  
</head>
<body class="manage-Car-add-main">
	<div class="manage-Car-add-main-wrap">
		<form:form commandName="carInfo" action="car_add" method="post" class="manage-Car-add-main-wrap-form">
			<form:hidden path="managername" value="${username}"/>

		        <div class="manage-Car-add-info-main-sn">
		       		 <p style="font-size:16px; color:#999">设备信息:</p>  
			            <div style="width:100%; height:2px; background:#ccc;"></div>
			            
			            <div class="manage-Car-add-info-sn">   
			            	<p style="width:25%; height:70%;float:left;text-align:right">设备SN编号:</p>
		               		<form:input path="sn" id="sn" list="suggest_ul" class = "input_SN" type="text" />
			            	<datalist id="suggest_ul">
			            	</datalist>
			            	<input type="button" value="导入设备" id="importData" class="input_importSN"/>
			            </div>
			            
						<!-- <div style="margin-left:30px; margin-top:10px">  
			            	<span >校验码:</span> 
			          		<input class = "input_SysCode" type="text" style="margin-left:68px"/>
			            </div> -->
			     </div>
		        <div class="manage-Car-add-info-main-car">
		        	<p style="font-size:16px; color:#999">车辆信息:</p>    
		            <div style="width:100%; height:2px; background:#ccc;"></div>  
		            <div class="manage-Car-add-info-main-car-num">   
		            	<p style="width:25%; height:70%;float:left;text-align:right">车牌号:</p>
						<form:input path="platenumber" id="plateNumber" class = "input_CarNum" type="text" />                
		            </div>
		            <div class="manage-Car-add-info-main-car-drivertype">   
		            	<p style="width:25%; height:70%;float:left;text-align:right">驾照类型:</p>
						<form:select path="drivertype" class="select-DriverType" >
			                <form:option value="C1" selected="selected">C1</form:option>
		                    <form:option value = "A3">A3</form:option>
		                    <form:option value = "B1">B1</form:option>
		                    <form:option value = "B2">B2</form:option>
		                    <form:option value = "C2">C2</form:option>
		                    <form:option value = "C3">C3</form:option>  
		                    <form:option value = "C4">C4</form:option>   
		                    <form:option value = "M">M</form:option>                     
		                </form:select>                  
		            </div> 
		           <!--  <div style="margin-left:30px;margin-top:10px">   
		            	<span>上次保养时间:</span>
						<input class ="Wdate" type="text" onClick="WdatePicker()" style="margin-left:20px; font-size:14px"/>          
		            </div> -->
		            <div class="manage-Car-add-info-main-car-seatnum">   
		            	<p style="width:25%; height:70%;float:left;text-align:right">可乘坐个数:</p>
		                <form:select path="seatnum"  class="select-SeatNum">
		                    <form:option value = "5" selected="selected">5座</form:option>
		                    <form:option value = "7">7座</form:option>
		                    <form:option value = "12">12座</form:option>
		                </form:select>             
		            </div>
		            <div class="manage-Car-add-info-main-car-carmodel">   
		            	<p style="width:25%; height:70%;float:left;text-align:right">车型选择:</p>
			            <form:hidden id="carmodel" path="carmodel" value=''/>
			            <div class="manage-Car-add-info-main-car-carmodel-select"> 
			                <select id="carBrand" class="select-Brand" >
			                	<option>请选择品牌</option>
			                </select>               
			                <select id="carSeries" class="select-Cartype" >
			               	 	<option>请选择车型</option>
			                </select>               
			                <select id="carModel" class="select-ModelYear" >
			                	<option>请选择年款</option>
			                </select>
		                </div>               
		            </div>
		            <div class="manage-Car-add-info-main-car-totalmileage">   
		            	<p style="width:25%; height:70%;float:left;text-align:right">当前总里程:</p>
						<form:input path="totalmileage" class = "input_Stafftel" type="text" />                
		            </div>
		            </div>
		           <div class="manage-Car-add-team-mian">  
		           <p style="font-size:16px; color:#999">所属警队:</p>    
		           <div style="width:100%; height:2px; background:#ccc;"></div>
				     <form:hidden id="sectorinfo" path="sectorinfo.id" value="-1"/>
		            <div id="manage-Car-add-team" class="manage-Car-add-team-class">   
		                <ul style="list-style:none;">
		                   <li> 
		                   		<p style="width:25%; height:70%;float:left;text-align:right">一级:</p>
		                   		
				                <select id="sectorOne">
					                <option value="-1">请选择一级警队</option>
				                </select>
				                <a  id="addOne" href="#">添加一级警队</a>
				              
				            </li>
		                    <li >
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
				                 <select id="sectorFour">
					                <option value="-1">请选择四级警队:</option>
				                </select>
				                <a  id="addFour" href="#">添加四级警队</a>
				            </li>
		                </ul>
		            </div>
	
		    </div>
		     
		 	     <div style="width:100%; height:2px; background:#ccc; margin-top:30px; margin-bottom:10px"></div>  
		        <div class="manage-Car-add-submit" >
			            <button id="btn_submit" class = "btn_submit" type="submit"  >提交</button>
		            	<button class = "btn_reset" id="reset" type="button">重置</button>
		         </div>
		         
		</form:form>
	 </div>	
	  
    <div class = "login-copy-end">
    	<div class="login-copy" >© 北京金奔腾汽车科技有限公司&nbsp;&nbsp;版权所有</div>
    	<div class="login-remark">（访问本网站建议您使用Chrome、IE9及以上版本浏览器，至少1024*768分辨率）</div>
    </div>
  
</body>

<script type = "text/javascript">
$(function(){
	$("#importData").click(function(){
		window.location.href = "<%=basePath%>pages/importDevice.jsp";
	})
});
$(function(){
    //载入时隐藏下拉li
    $("#suggest_ul").hide(0);
    console.log("隐藏");
});

$("#sn").keyup(function(){
    //如果文本框为空，不发送请求
    if($("#sn").val().length == 0){
        $("#suggest_ul").hide(0);
        return false;
    }
    console.log($("#sn").val());
    var url = "getDeviceSn";
    var sn = $("#sn").val();
    $.ajax({
        type:"post",
        url :url,
        data: {"sn":sn},
        datatype:"json",
        success:function(json){
            if(json){
                $("#suggest_ul").show(0);
                $("#suggest_ul").html(json);
            }
        }
    })
})
$(function(){
    //按下按键后300毫秒显示下拉提示
    $("#sn").keyup(function(){
        setInterval(changehover,300);
        function changehover(){
            $("#suggest_ul li").hover(function(){
                $(this).css("background","#eee");},function(){ $(this).css("background","#fff");});
            $("#suggest_ul li").click(function(){
                $("#sn").val($(this).html());
                $("#suggest_ul").hide(0);
            });
        }
    });
});


$(function () {
	var msg = '${msg}';
	if(msg == null || msg == ""){
	}else{
		alert(msg);
	}
	//初始化carBrand
	var carBrand= document.getElementById("carBrand"); 
	var brandStr = '${brandList}';
	var brandArr = brandStr.split(",");
	for (var i = 0 ; i < brandArr.length ; i++) {
		carBrand.options.add(new Option(brandArr[i]));
	}
	//初始化一级警队sectorOne
	var sectorOne= document.getElementById("sectorOne");
	var json = ${sectorList};
	for(var i = 0 ; i < json.length ; i++){
		$("#sectorOne").append(
                "<option value='"+json[i].id+"'>"+json[i].name
                + "</option>");
	}
	
	//品牌改变
	$("#carBrand").change(function(){
		$("#carSeries option").remove();
		$("#carSeries").append("<option>请选择车型</option>");
		$this = $("#carBrand");
		var url = "car_getSeries";
		var param = {
			"brand" : $this.find("option:selected").text()
		}
		$.post(url,param,function(data){
			var seriseArr = data.split(",");
			for (var i = 0 ; i < seriseArr.length ; i++) {
				$("#carSeries").append("<option>"+seriseArr[i]+"</option>");
			}
		})
	})
	//车型改变
	$("#carSeries").change(function(){
		$("#carModel option").remove();
		$("#carModel").append("<option>请选择年款</option>");
		$this = $("#carSeries");
		var url = "car_getModel";
		var param = {
			"series" : $this.find("option:selected").text()
		}
		$.post(url,param,function(data){
			var modelArr = data.split(",");
			for (var i = 0 ; i < modelArr.length ; i++) {
				$("#carModel").append("<option>"+modelArr[i]+"</option>");
			}
		})
	})
	
	//选择年款
	$("#carModel").change(function(){
		$("#carmodel").val($("#carBrand").find("option:selected").text()+" "+$("#carSeries").find("option:selected").text()+" "+$("#carModel").find("option:selected").text());
	})
	
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
		if($("#carmodel").val() == null || $("#carmodel").val() == ''){
			alert("请选择车型");
			return false;
		}
		if($("#sectorinfo").val() == -1){
			alert("请选择员工所属部门");
			return false;
		}
		if($("#sn").val() == null || $("#sn").val().trim() == ''){
			alert("请填写绑定的设备SN");
			return false;
		}
		if($("#plateNumber").val() == null || $("#plateNumber").val().trim() == ''){
			alert("请填写车牌号");
			return false;
		}
	})
	
		
	$("#addOne").click(function(){
		var sectorId = 0;
		window.location.href = 'sector_add_page?sectorId='+sectorId+'&url=car_add_page';
	})
	
	$("#addTwo").click(function(){
		if($("#sectorOne").val() == -1){
			alert("请选择要添加部门的上级部门！");
			return false;
		}
		$("#addTwo").attr("href",'sector_add_page?sectorId='+$("#sectorOne").val()+'&url=car_add_page');
	})
	
	$("#addThree").click(function(){
		if($("#sectorTwo").val() == -1){
			alert("请选择要添加部门的上级部门！");
			return false;
		}
		$("#addThree").attr("href",'sector_add_page?sectorId='+$("#sectorTwo").val()+'&url=car_add_page');
	})
	
	/* $("#addFour").click(function(){
		if($("#sectorThree").val() == -1){
			alert("请选择要添加部门的上级部门！");
			return false;
		}
		$("#addFour").attr("href",'sector_add_page?sectorId='+$("#sectorThree").val()+'&url=car_add_page');
	}) */
});
</script>

</html>