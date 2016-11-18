<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<link rel="shortcut icon" href="./css/images/webicon.png"
	type="image/x-icon" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="telephone=no" name="format-detection" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />

<title>电子围栏</title>
<link rel="stylesheet" type="text/css"
	href="./pages/css/set-Electronic(1).css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>pages/css/base1.css" />
<link href="./pages/css/bootstrap.css" rel="stylesheet">
<link href="./pages/zTreeStyle/zTreeStyle.css" rel="stylesheet" />
<script src="./pages/My97DatePicker/WdatePicker.js"></script>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="./pages/js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="./pages/js/jquery.ztree.core-3.5.min.js"></script>
<script src="./pages/js/jquery.ztree.excheck.min.js"></script>
<script src="./pages/js/jquery.ztree.exedit.min.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=Vd7Dc0nXYFLcVfLWSqZitEXk"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/library/GeoUtils/1.2/src/GeoUtils.js"></script>
<script>
	
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
		function zTreeOnClick(event, treeId, treeNode) {
			$("#manage-Monitor-work-map-id").load("manage-Monitor-Realtime.html");
			alert(treeNode.flag + "., " + treeNode.name,+","+treeNode.id);
		};

		var data = '${sectorDataWithCar}';
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
		
		var setting1 = {
				edit: {
					enable: true,
					showRemoveBtn: false,
					showRenameBtn: false
				},
				data: {
					simpleData: {
						enable: true
					}
				},
				callback: {
					beforeDrag: beforeDrag,
					beforeDrop: beforeDrop
				}
			};
			
			function beforeDrag(treeId, treeNodes) {
				for (var i=0,l=treeNodes.length; i<l; i++) {
					if (treeNodes[i].drag === false) {
						return false;
					}
				}
				return true;
			}
			function beforeDrop(treeId, treeNodes, targetNode, moveType) {
				return targetNode ? targetNode.drop !== false : true;
			}
		
		function showCode(str) {
			if (!code) code = $("#code");
			code.empty();
			code.append("<li>"+str+"</li>");
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#menuTree"), setting, zNodes);//左侧栏目录
			$.fn.zTree.init($("#menuTree1"), setting1, zNodes);//未设置车辆目录
			$.fn.zTree.init($("#menuTree2"), setting1);//未设置车辆目录
			setCheck();
			/* setCheck1(); */
			$("#py").bind("change", setCheck);
			$("#sy").bind("change", setCheck);
			$("#pn").bind("change", setCheck);
			$("#sn").bind("change", setCheck);
		});
		
	</script>
</head>
<body>

	<div class="manage-Monitor-title">

		<div class="manage-Monitor-title-date">
			<img src="<%=basePath%>pages/img/date-logo.png" width="25px"
				height="25px"
				style="margin-left: 15px; margin-right: 20px; float: left"></img>
			<div
				style="width: 250px; height: 30px; padding-left: 30px; font-size: 20px; color: #FFF">
				<script>
					var now = new Date()
					document.write(1900+now.getYear()+"年"+(now.getMonth()+1)+"月"+(now.getDate()+"日"))
                </script>
			</div>
		</div>

		<div class="manage-Monitor-title-logo">
			<img src="<%=basePath%>pages/img/login-logo-jt.png" width="10%"
				height="50%"
				style="margin-left: 65px; margin-top: 3%; margin-right: 20px; float: left;"></img>
			<img src="<%=basePath%>pages/img/login-title-jt.png" width="60%"
				height="50%" style="margin-top: 5%;"></img>
		</div>
		<div class="manage-Monitor-title-handle">
			<div
				style="font-size: 16px; height: 60%; width: 60%; float: left; margin-top: 2%;">
				<a href="<%=basePath%>pages/fleetmanage-main.jsp"
					style="font-size: 16px; width: 35%; float: left; text-align: right;">返回首页</a>

				<p id="username-value"
					style="font-size: 14px; width: 25%; float: right; color: #666">
					${username}</p>
				<p id="username"
					style="font-size: 16px; width: 40%; float: right; text-align: right;">
					当前用户:</p>


			</div>
			<button class="btn-reflash" id="refresh"
				onclick="javascript:location.reload()">刷新</button>
			<button id="cancel" class="btn-exit">退出</button>
		</div>

	</div>


	<div class="manage-Monitor-left-menu-title"
		id="manage-Monitor-left-menu-title-id">
		<div id="manage-Monitor-left-menu-title-panel-group">
			<div class="panel-group" id="accordion" role="tablist"
				aria-multiselectable="true" style="padding: 10px 0;">
				<div class="panel panel-default zl-panel" style="background: #3CC">
					<div id="collapseOne" class="panel-collapse collapse in"
						role="tabpanel" aria-labelledby="headingOne"
						style="background: #bfd9f6">
						<div id="collapseOneBody" class="panel-body"
							style="height: 300px; overflow-y: auto; overflow-x: hidden;">
							<ul id="menuTree" class="ztree">
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="manage-Monitor-right-work-wap"
		id="manage-Monitor-right-work-wap-id">

		<button id="manage-Monitor-right-work-data-MenuDisplay-btn"
			onClick="showMeaun()">显示目录</button>

		<div class="manage-Monitor-right-work"
			id="manage-Monitor-right-work-id">

			<%-- <div class="set_Electronic_menu">
              
                	<div class="set_Electronic_menu_seach">
                    
                   		<form:form id="form" commandName="crawlinfo"
						action="crawlWarn_manage" method="post">
						<!-- 代表当前属于第几页 -->
						<input id="pageNow" type="hidden" name="pageNow"
							value="${crawlPage.pageNow}">
						<form:input id="crawlname" class="input_seach" path="crawlname" />
						<button class="btn_seach" type="submit">检索</button>
					</form:form>
                    </div>
                  
                    <div class="set_Electronic_menu_list">
                        <ul>
                        	<c:forEach items="${crawlPage.list}" var="crawlinfo">
							<li>
								<div>
									<p >${crawlinfo.crawlname}</p>									
								</div>
							</li>
						</c:forEach>
                        </ul>
                    </div>
                    
                </div> --%>

			<div class="manage-Monitor-work-map" id="manage-Monitor-work-map-id">
				<div class="manage-Monitor-realtime-work-map-float">
					<div class="manage-Monitor-realtime-work-map-float-add">
						<p style="text-align: center; margin-top: 10px"
							onclick="createCircle()">绘画</p>
					</div>
				</div>
				<div style="height: 70%; border: #ccc solid 1px; font-size: 12px"
					id="map"></div>
				<div class="set_Electronic">
					<div class="set_Electronic_left">

						<ul>

							<li><span>围栏名称:</span> <input class="electronic_name"
								id="crawlName"></input></li>
							<li><input type="radio" name="radio_alarm"
								onClick="radio_click()" value="1" checked="checked">驶出报警</input>
								<input type="radio" name="radio_alarm" onClick="radio_click()"
								value="2">驶入报警</input> <input type="radio" name="radio_alarm"
								onClick="radio_click()" value="3">禁停报警</input></li>
							<li><input type="radio" name="radio_alarm"
								onClick="radio_click()" value="4">未按规定停车</input> <input
								type="radio" name="radio_alarm" onClick="radio_click()"
								value="5">长时间停车</input></li>
							<li class="Time_set" id="TimeID_set"><span>时间设置:</span> <input
								class="Wdate" type="text" id="startTime"
								onClick="WdatePicker({dateFmt:'HH:mm:ss'})" value="00:00:00">
								</input> <h style=" font-size:14px;">~</h> <input class="Wdate"
								type="text" id="endTime"
								onClick="WdatePicker({dateFmt:'HH:mm:ss'})" value="23:59:59">
								</input></li>
							<li class="stopTime_set" id="stopTimeID_set"
								style="display: none;"><span>停车时长:</span> <input
								class="input_stop_alarm" type="text" id="parkTime"></input> <span>分钟</span>
							</li>
							<li class="sldingTime_set" id="sldingTimeID_set"
								style="display: none;"><span>怠速时长:</span> <input
								class="input_slding_alarm" type="text" id="idleTime"></input> <span>分钟</span>
							</li>

						</ul>

					</div>
					<div class="set_Electronic_center">
						<div class="set_Electronic_center_left">
							<p style="text-align: center">设置车辆</p>
							<ul id="menuTree2" class="ztree"></ul>
						</div>
						<div class="set_Electronic_center_center"></div>
						<div class="set_Electronic_center_right">
							<p style="text-align: center">未设置车辆</p>
							<ul id="menuTree1" class="ztree"></ul>
						</div>
					</div>
					<div class="set_Electronic_right">
						<button class="save_btn" type="button" onclick="save();">保存</button>

						<button class="save_resert" type="button" onclick="reset()">恢复</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<form action="<%=basePath%>crawlcar_add" method="post" id="form">
		<input type="hidden" name="str" id="str" value="">
	</form>


	<script type="text/javascript">
var map = new BMap.Map("map");
var point,circle,radius,chartType;
var chartType = 0;  //图形类别，1为圆形，2为四边形，默认为0
var crawlName,crawlwarnType;
var isOverlay = 0;
var jsonData = {data:[]};
map.centerAndZoom(new BMap.Point(116.404, 39.915), 15);
map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
map.addControl(new BMap.NavigationControl());   //缩放按钮
	var styleOptions = {
        strokeColor:"red",    //边线颜色。
        fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
        strokeWeight: 3,       //边线的宽度，以像素为单位。
        strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
        fillOpacity: 0.3,      //填充的透明度，取值范围0 - 1。
        strokeStyle: 'solid' //边线的样式，solid或dashed。
    };
	var drawingManager = new BMapLib.DrawingManager(map, {
		//使用鼠标工具需要引入鼠标工具开源库DrawingManager_min.js及样式文件DrawingManager_min.css  
		isOpen : false, //是否开启绘制模式  
		enableDrawingTool : true, //是否显示工具栏  
		drawingToolOptions : {
			anchor : BMAP_ANCHOR_TOP_RIGHT, //位置  
			offset : new BMap.Size(5, 5) //偏离值
		},
		circleOptions: styleOptions //圆的样式
	});
	//绘制圆形
	drawingManager.setDrawingMode(BMAP_DRAWING_CIRCLE);
	var overlaycomplete = function(e){
		drawingManager.close();
		//alert(e.overlay.point.lng+","+e.overlay.point.lat);
		//alert("半径==="+e.overlay.wa);
		point = e.overlay.point;
		radius = e.overlay.wa;
        circle = e.overlay;
        circle.enableEditing();
        circle.addEventListener('lineupdate', function(e){
        	 /* console.log(e.target.getCenter().lat+","+e.target.getRadius()); */
        	 radius = e.target.getRadius();   //圆半径
        	 point = e.target.getCenter();	  //圆心坐标
        });
        //chartType = 0;
    };
   
	//添加鼠标绘制工具监听事件，用于获取绘制结果
    drawingManager.addEventListener('overlaycomplete', overlaycomplete);
	
	//点击创建圆形按钮
	function createCircle()
	{	var jobj = {};		
		if(chartType == 0)
		{
		drawingManager.open();
		chartType = 1;
		return;
		}
		
		var parkTime,idleTime,startTime,endTime;
		var result = confirm("是否新增围栏?[确定]新增围栏，[取消]修改围栏");
		//新增围栏,保存之前围栏数据
		if(result == true)
		{					                                  
			crawlName = document.getElementById("crawlName").value;	  //2⃣️判断围栏名称是否为空
			if(crawlName == "" || crawlName.length <= 0)
			{
				alert("围栏名称不能为空");
				return;
			}
			var radio = document.getElementsByName("radio_alarm");
			for(var i = 0 ; i < radio.length; i++)
			{
				if(radio[i].checked == true)
				{
					crawlwarnType = radio[i].value;
				}
			}					
			jobj.warnType = crawlwarnType;								//3⃣️保存报警类型					
			switch(crawlwarnType)										//4⃣️当报警类型为3，4，5时判断时间不能为空
			{
				case "3": //禁停报警:怠速时长
				{
					idleTime = document.getElementById("idleTime").value;						
					if(idleTime == "" || idleTime.length <= 0)
					{
						idleTime = 20;
					}
					jobj.idleTime = idleTime;
				} 
				break;
						
				case "4":  //未按规定停车:停车时长				
				{
					parkTime = document.getElementById("parkTime").value;
					if(parkTime == "" || parkTime.length <= 0)
					{
						parkTime=10;
					}
					jobj.parkTime = parkTime;
				} 
					break;
				case "5":  //长时间停车:停车时长和怠速时长					
				{
					parkTime = document.getElementById("parkTime").value;
					idleTime = document.getElementById("idleTime").value;
					if(idleTime == "" || idleTime.length <= 0)
					{
						idleTime = 20;
					}
					if(parkTime == "" || parkTime.length <= 0)
					{
						parkTime = 10;
					}
					jobj.idleTime = idleTime;
					jobj.parkTime = parkTime;
					
				} 
					break;
			}
			//判断围栏图形是否绘画
			switch(chartType)                                      //5⃣️判断围栏图形是否绘画
			{
			case 0: //未编辑
						{
						alert("请编辑围栏区域");
						return;
						}
						break;
					case 1:  //圆形
						{
							
							if(radius == null)
								{
								alert("请编辑圆形");
								return;
								}
							jobj.circlePoint = point.lng+","+point.lat;							
							jobj.circleRadius = radius;
						}						
						break;
					case 2: //四边形
					{
						
					}
						break
					}
					jobj.chartType = chartType; 
					startTime = document.getElementById("startTime").value;               //6⃣️判断时间是否为空
					endTime = document.getElementById("endTime").value;
					if(startTime != "" && endTime != "")
						{
						/* var myDate = new Date();
						var mytime=myDate.toLocaleTimeString();
						alert(mytime); */
						}
					else
						{
						
						startTime = "00:00:00";
						endTime = "23:59:59";					
						}
					jobj.startTime = startTime;
					jobj.endTime = endTime;
					//获取所有设置车辆数据
					var snList = "";
					var menuTree2 = $.fn.zTree.getZTreeObj("menuTree2");
					var nodes = menuTree2.transformToArray(menuTree2.getNodes());
					for(var i = 0 ; i < nodes.length; i++)
						{
							if(nodes[i].flag == 2)
								{
								if(i == (nodes.length - 1))
									snList += nodes[i].id;
								else
									snList += nodes[i].id + ",";
								
								}						
						}
					jobj.sn = snList;
					circle.disableEditing();											//1⃣️关闭圆形编辑功能
					drawingManager.open();
					chartType = 1;
					jsonData.data.push(jobj);					
					/* if(crawlName != jsonData.crawlName && jsonData.crawlName != "")
						{
							alert("禁止修改围栏名称");
							return;
						} */
					jsonData.crawlName = crawlName;
				}
		
	}
	
	//点击保存
	function save()
	{
		var parkTime,idleTime,startTime,endTime;
		var jobj = {};        
		crawlName = document.getElementById("crawlName").value;	  //2⃣️判断围栏名称是否为空
		if(crawlName == "" || crawlName.length <= 0)
		{
			alert("围栏名称不能为空");
			return;
		}
		
		var radio = document.getElementsByName("radio_alarm");
		for(var i = 0 ; i < radio.length; i++)
		{
			if(radio[i].checked == true)
			{
				crawlwarnType = radio[i].value;
			}
		}					
		jobj.warnType = crawlwarnType;								//3⃣️保存报警类型					
		switch(crawlwarnType)										//4⃣️当报警类型为3，4，5时判断时间不能为空
		{
			case "3": //禁停报警:怠速时间不能为空
			{
				idleTime = document.getElementById("idleTime").value;						
				if(idleTime == "" || idleTime.length <= 0)
				{
					idleTime=20;
				}
				jobj.idleTime = idleTime;
			} 
			break;
					
			case "4":  //未按规定停车:停车时长						
			{
				parkTime = document.getElementById("parkTime").value;
				if(parkTime == "" || parkTime.length <= 0)
				{
					parkTime = 10;
				}
				jobj.parkTime = parkTime;
			} 
				break;
			case "5":  //长时间停车:停车时长，怠速时长						
			{
				parkTime = document.getElementById("parkTime").value;
				idleTime = document.getElementById("idleTime").value;
				if(idleTime == "" || idleTime.length <= 0)
				{
					idleTime = 20;
				}
				if(parkTime == "" || parkTime.length <= 0)
				{
					parkTime = 10;
				}
				jobj.idleTime = idleTime;
				jobj.parkTime = parkTime;
			} 
				break;
		}
				//判断围栏图形是否绘画
				switch(chartType)                                      //5⃣️判断围栏图形是否绘画
				{
				case 0: //未编辑
					{
					alert("请编辑围栏区域");
					return;
					}
					break;
				case 1:  //圆形
					{
						if(radius == null)
							{
							alert("请编辑圆形");
							return;
							}
						jobj.circlePoint = point.lng+","+point.lat;							
						jobj.circleRadius = radius;
					}						
					break;
				case 2: //四边形
				{
					
				}
					break
				}
				jobj.chartType = chartType; 
				startTime = document.getElementById("startTime").value;               //6⃣️判断时间是否为空
				endTime = document.getElementById("endTime").value;
				if(startTime == "" || endTime != "")
					{
						startTime = "00:00:00";
						endTime = "23:59:59";
					}
				jobj.startTime = startTime;
				jobj.endTime = endTime;
				//获取所有设置车辆数据
				var snList = "";
				var menuTree2 = $.fn.zTree.getZTreeObj("menuTree2");
				var nodes = menuTree2.transformToArray(menuTree2.getNodes());
				for(var i = 0 ; i < nodes.length; i++)
					{
						if(nodes[i].flag == 2)
						{	
							if(i == (nodes.length - 1))
								snList += nodes[i].id;
							else
								snList += nodes[i].id + ",";
						}	
					}
				jobj.sn = snList;
				circle.disableEditing();											//1⃣️关闭圆形编辑功能
				drawingManager.open();
				chartType = 1;
				jsonData.data.push(jobj);					
				jsonData.crawlName = crawlName;
				circle.disableEditing();
				var str = document.getElementById("str");
				str.value=JSON.stringify(jsonData);
				var form = document.getElementById("form");
				form.submit();
	}
	
	function reset()
	{
		map.clearOverlays();
		$("#startTime").val("00:00:00");
		$("#endTime").val("23:59:59");
		$("#crawlName").val("");
		$("#parkTime").val("");
		$("#idleTime").val("");
		var radio_alarm =document.getElementsByName('radio_alarm');
		radio_alarm[0].checked =true;
	}
	
	function radio_click(){
		 
		var TimeID_set =	    document.getElementById('TimeID_set');
		var stopTimeID_set =	document.getElementById('stopTimeID_set');
		var sldingTimeID_set =	document.getElementById('sldingTimeID_set');
		var radio_alarm =document.getElementsByName('radio_alarm');
		
		if(radio_alarm[0].checked ==true){
			$("#startTime").val("00:00:00");
			$("#endTime").val("23:59:59");
			$("#parkTime").val("");
			$("#idleTime").val("");
			sldingTimeID_set.style.display = "none";
			stopTimeID_set.style.display = "none";
		}
		if(radio_alarm[1].checked ==true){
			$("#startTime").val("00:00:00");
			$("#endTime").val("23:59:59");
			$("#parkTime").val("");
			$("#idleTime").val("");
			sldingTimeID_set.style.display = "none";
			stopTimeID_set.style.display = "none";
		}
		if(radio_alarm[2].checked ==true){
			$("#startTime").val("00:00:00");
			$("#endTime").val("23:59:59");
			$("#parkTime").val("");
			$("#idleTime").val("");
			stopTimeID_set.style.display = "none";
			sldingTimeID_set.style.display = "block";
		}
		if(radio_alarm[3].checked ==true){
			$("#startTime").val("00:00:00");
			$("#endTime").val("23:59:59");
			$("#parkTime").val("");
			$("#idleTime").val("");
			sldingTimeID_set.style.display = "none";
			stopTimeID_set.style.display = "block";
		}
		if(radio_alarm[4].checked ==true){
			$("#startTime").val("00:00:00");
			$("#endTime").val("23:59:59");
			$("#parkTime").val("");
			$("#idleTime").val("");
			stopTimeID_set.style.display = "block";
			sldingTimeID_set.style.display = "block";
		}	
	}
		

		var work_layout = document
				.getElementById('manage-Monitor-right-work-wap-id');
		var map_layout = document.getElementById('manage-Monitor-work-map-id');
		var zTree_menu = document
				.getElementById('manage-Monitor-left-menu-title-id');
		function showMeaun() {
			if (zTree_menu.style.display == "block") {
				zTree_menu.style.display = "none";
				work_layout.style.width = "100%";
				$("#manage-Monitor-right-work-data-MenuDisplay-btn").html(
						'显示目录');
			} else {
				zTree_menu.style.display = "block";
				$("#manage-Monitor-right-work-data-MenuDisplay-btn").html(
						'隐藏目录');
				work_layout.style.width = "83%";

			}
		}

		function showmenu(id) {
			var list = document.getElementById("list" + id);
			var menu = document.getElementById("menu" + id)
			if (list.style.display == "none") {
				document.getElementById("list" + id).style.display = "block";
				menu.className = "title1";
			} else {
				document.getElementById("list" + id).style.display = "none";
				menu.className = "title";
			}
		}
		$("#cancel").click(function(){
			if(confirm("是否确认退出当前用户?"))
				window.location.href = "<%=basePath%>manager_outLogin";
		});
		var msg = '${msg}';
		if (msg != "")
			alert(msg);
	</script>
</body>
</html>