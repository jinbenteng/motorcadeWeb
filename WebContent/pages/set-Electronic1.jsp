<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/set-Electronic(2).css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/base1.css" />
<title>电子围栏</title>
<%-- <link rel="stylesheet" type="text/css" href="<%=basePath%>pages/css/set-Electronic.css" /> --%>
<link href="<%=basePath%>pages/css/bootstrap.css" rel="stylesheet">
<link href="<%=basePath%>pages/zTreeStyle/zTreeStyle.css" rel="stylesheet" />
<script src="<%=basePath%>pages/My97DatePicker/WdatePicker.js"></script>
<script src="<%=basePath%>pages/js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

 
<script src="./js/jquery.ztree.core-3.5.min.js"></script>
<script src="./js/jquery.ztree.excheck.min.js"></script>
<script src="./js/jquery.ztree.exedit.min.js"></script>

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
      
    	<div class = "manage-Monitor-title-date">
        	<img src ="<%=basePath%>pages/img/date-logo.png" width="25px" height="25px" style="margin-left:15px;  margin-right:20px;float:left"></img>
            <div style=" width:250px; height:30px; padding-left:30px;  font-size:20px; color:#FFF"  >
				<script>
					var now = new Date()
					document.write(1900+now.getYear()+"年"+(now.getMonth()+1)+"月"+(now.getDate()+"日"))
                </script>
            </div>
        </div>
     
        <div class = "manage-Monitor-title-logo">
        	 <img src ="<%=basePath%>pages/img/login-logo-jt.png" width="10%" height="50%" style="margin-left:65px; margin-top:3%; margin-right:20px;float:left;"></img>
             <img src ="<%=basePath%>pages/img/login-title-jt.png" width="60%" height="50%" style=" margin-top:5%;"></img>
        </div>
        <div class = "manage-Monitor-title-handle">
        	<div style="font-size:16px; height:60%;width:60%; float:left; margin-top:2%;">
        		 <a  href="<%=basePath%>pages/fleetmanage-main.jsp" style="font-size:16px; width:35%; float:left;text-align:right;">返回首页</a>
				
					<p id = "username-value" style="font-size:14px; width:25%; float:right; color:#666">
					 ${username}
				 </p>
				 <p id = "username" style="font-size:16px; width:40%; float:right; text-align:right;">
				 	当前用户:
				 </p>

				 
			 </div>
             <button  class = "btn-reflash" id="refresh" onclick="javascript:location.reload()">刷新</button>
             <button id="cancel" class = "btn-exit">退出</button>
        </div>  
       
    </div>



	
	    
	<div class = "manage-Monitor-left-menu-title" id="manage-Monitor-left-menu-title-id">

            <div id="manage-Monitor-left-menu-title-panel-group">
        		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="padding: 10px 0;" >
					<div class="panel panel-default zl-panel" >
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="set-Electronic-right-work-data-map-left-set">				 	
								<div class="set-Electronic-right-work-data-map-left-setElectronicName">
									<p style="color:#fff;width:100%;height:20%;background:#5ea4e0;text-align:center">围栏名称:</p> 
									 
									<input class="input-ElectronicName"></input>
									<p style="color:#fff;width:100%;height:20%;background:#5ea4e0;text-align:center">设置类型:</p>
									<select class="select-Electronictype">
										<option value = "-1">驶出报警</option>
                          				<option value = "0">驶入报警</option>
                          				<option value = "1">禁停报警</option>
                          				<option value = "0">长时间停车</option>
                          				<option value = "1">未按规定停车</option>
									</select>
		
								</div>
								<div class="set-Electronic-right-work-data-map-left-setElectronicOther">
									<p style="color:#fff;width:100%;height:20%;background:#5ea4e0;text-align:center">时间设置:</p>
									<input class="Wdate"
											type="text" id="startTime"
											onClick="WdatePicker({dateFmt:'HH:mm:ss'})"
											placeholder="精确到秒"></input>~

									<input class="Wdate" type="text" id="endTime"
											onClick="WdatePicker({dateFmt:'HH:mm:ss'})"
											placeholder="精确到秒"></input>
									<p style="color:#fff;width:100%;height:20%;background:#5ea4e0;text-align:center">停车时常:</p>
									<input class="select-Electronictype" type="text" placeholder="精确分钟"></input>	
									<p style="color:#fff;width:100%;height:20%;background:#5ea4e0;text-align:center">怠速时常:</p>
									<input class="select-Electronictype" type="text" placeholder="精确分钟"></input>		
								</div>														
							</div>
							<div id="collapseOneBody" class="panel-body" style="height: 50%;width:100%; 	border: 1px solid #000;">
								<ul id="menuTree" class="ztree" >	
								</ul>
							</div>
							<div class="set_Electronic_right">
								<button class="save_btn" type="button "  onclick="save()">保存</button>
								 <button class="save_resert" type="button "  onclick="reset()">恢复</button>
								
							</div>
						</div>
					</div>
				</div>
        	</div>
     </div>
   
	<div class="set-Electronic-right-work-wap" id="set-Electronic-right-work-wap-id">

		 <button id="manage-Monitor-right-work-data-MenuDisplay-btn" onClick="showMeaun()">》》</button>
		  
		<div class="manage-Monitor-right-work" id="manage-Monitor-right-work-id"> 
		
                <div class="manage-Monitor-right-work-data">
                    <nav class="manage-Monitor-right-work-navigation-nav" >
                        <ul>
                        <li >
                        	<a  href="sector_allwithcar?sectorId=1">
 		                       	 <div style="width:30%;height:45%;margin-top:10%;margin-left:35%;background:url(<%=basePath%>pages/img/i-1.png);background-size:100% 100%;	background-repeat: no-repeat;"></div>
                        		<em style="width:100%;height:30%;color:#FFF;">车辆监控</em>
							</a>
						</li>
                        <li>
                        	<a href="driveLog_all?pageNow=1">
                        		<div style="width:30%;height:45%;margin-top:10%;margin-left:35%;background:url(<%=basePath%>pages/img/i-2.png);background-size:100% 100%;	background-repeat: no-repeat;"></div>	
                        		<em style="width:100%;height:40%;color:#FFF;">行程纪录</em>
                        	</a>
                        </li>
                        <li>
                        	<a href="staff_all?pageNow=1" onclick="javascript:document.getElementById('sectorinfo').value = 0">
                        	    <div style="width:30%;height:45%;margin-top:10%;margin-left:35%;background:url(<%=basePath%>pages/img/i-3.png);background-size:100% 100%;	background-repeat: no-repeat;"></div>	
                        		<em style="width:100%;height:30%;color:#FFF;">围栏监控</em>
                        	</a>
                        </li>
                        <li class = "active">
                        	<a href="staff_all?pageNow=1" onclick="javascript:document.getElementById('sectorinfo').value = 0">
                        	     <div style="width:30%;height:45%;margin-top:10%;margin-left:35%;background:url(<%=basePath%>pages/img/i-11.png);background-size:100% 100%;	background-repeat: no-repeat;"></div>
                        		<em style="width:100%;height:30%;color:#FFF;">设置围栏</em>
                        	</a>
                        </li>                        
						
                        </ul>
                    </nav>
                </div>
                <div class="set-Electronic-right-work-data-map">

					<div class="set-Electronic-right-work-data-map-left-setseach">

						
							<p style="color:#fff;width:100%;height:5%;background:#5ea4e0;text-align:center">围栏查询</p>
							<div class="set_Electronic_menu">
								<div class="set_Electronic_menu_seach">			
									<input class ="input_seach"></input>
									<button class="btn_seach" type="button">检索</button>
								</div>
								<div class="set_Electronic_menu_list">
									<ul>
										<li><a href="#">
												<p >电子围栏(11辆)</p>
												<p >驶入报警</p>
												<p >18:00~8:00</p>
											</a>
										</li>
										<li><a href="#">
												<p >电子围栏(11辆)</p>
												<p >驶入报警</p>
												<p >18:00~8:00</p>
											</a>
										</li>	
										<li><a href="#">
												<p >电子围栏(11辆)</p>
												<p >驶入报警</p>
												<p >18:00~8:00</p>
											</a>
										</li>
										<li><a href="#">
												<p >电子围栏(11辆)</p>
												<p >驶入报警</p>
												<p >18:00~8:00</p>
											</a>
										</li>
										<li><a href="#">
												<p >电子围栏(11辆)</p>
												<p >驶入报警</p>
												<p >18:00~8:00</p>
											</a>
										</li>	
																															
									</ul>
								</div>
					            <div class="set_Electronic_menu-work-end">
					                <div class="set_Electronic_menu-wor-page">
			               				 <p style="color:#fff;width:100%;height:20%;text-align:center">第 ${page.pageNow} 页;   共 ${page.totalPageCount} 页</p>
			                		      <div class="set_Electronic_menu-wor-page-check" >
				                    		<a id="first" href="#" >首页</a>
				                        	<a id="last" href="#" >上一页</a>
				                        	<a id="next" href="#">下一页</a>
				                        	<a id="end" href="#" >尾页</a>
				                        </div>
					                </div>
					            </div>
							</div>
						


					</div>
					<div class="set-Electronic-right-work-data-map-right-map">
						<div style="height: 100%; border: #ccc solid 1px; font-size: 12px"
							id="map">
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
        circle = e.overlay;
        circle.enableEditing();
        circle.addEventListener('lineupdate', function(e){
        	 /* console.log(e.target.getCenter().lat+","+e.target.getRadius()); */
        	 radius = e.target.getRadius();   //圆半径
        	 point = e.target.getCenter();	  //圆心坐标
        });
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
			var radio = document.getElementsByName("crawlwarnType");
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
						alert("怠速报警不能为空");
						return;
					}
					jobj.idleTime = idleTime;
				} 
				break;
						
				case "4":  //未按规定停车:怠速时间，停车时间不能为空						
				{
					parkTime = document.getElementById("parkTime").value;
					idleTime = document.getElementById("idleTime").value;
					if(idleTime == "" || idleTime.length <= 0)
					{
						alert("怠速报警不能为空");
						circle.enableEditing();
						return;
					}
					if(parkTime == "" || parkTime.length <= 0)
					{
						alert("停车报警不能为空");
						return;
					}
					jobj.idleTime = idleTime;
					jobj.parkTime = parkTime;
				} 
					break;
				case "5":  //长时间停车:停车时长不能为空						
				{
					parkTime = document.getElementById("parkTime").value;
					if(parkTime == "" || parkTime.length <= 0)
					{
						alert("停车报警不能为空");
						return;
					}
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
							if(point == null)
								{
								alert("请编辑圆形");
								return;
								}
							jobj.circlePoint = point.lng+","+point.lat;							
							jobj.circleRadius = radius;
							alert(radius);
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
					obj.startTime = startTime;
					jobj.endTime = endTime;
					//获取所有设置车辆数据
					var snList = "";
					var menuTree2 = $.fn.zTree.getZTreeObj("menuTree2");
					var nodes = menuTree2.transformToArray(menuTree2.getNodes());
					for(var i = 0 ; i < nodes.length; i++)
						{
							if(nodes[i].flag == 2)
								{
								snList += nodes[i].sn + ",";
								if(i == (nodes.length - 1))
									snList += nodes[i].sn;
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
		/* createCircle();		 */
		
		var parkTime,idleTime,startTime,endTime;
		var jobj = {};
        
		crawlName = document.getElementById("crawlName").value;	  //2⃣️判断围栏名称是否为空
		if(crawlName == "" || crawlName.length <= 0)
		{
			alert("围栏名称不能为空");
			return;
		}
		
		var radio = document.getElementsByName("crawlwarnType");
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
					alert("怠速报警不能为空");
					return;
				}
				jobj.idleTime = idleTime;
			} 
			break;
					
			case "4":  //未按规定停车:怠速时间，停车时间不能为空						
			{
				parkTime = document.getElementById("parkTime").value;
				idleTime = document.getElementById("idleTime").value;
				if(idleTime == "" || idleTime.length <= 0)
				{
					alert("怠速报警不能为空");
					circle.enableEditing();
					return;
				}
				if(parkTime == "" || parkTime.length <= 0)
				{
					alert("停车报警不能为空");
					return;
				}
				jobj.idleTime = idleTime;
				jobj.parkTime = parkTime;
			} 
				break;
			case "5":  //长时间停车:停车时长不能为空						
			{
				parkTime = document.getElementById("parkTime").value;
				if(parkTime == "" || parkTime.length <= 0)
				{
					alert("停车报警不能为空");
					return;
				}
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
						if(point == null)
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
							snList += nodes[i].id + ",";
						if(i == (nodes.length - 1))
							snList += nodes[i].id;
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
				circle.disableEditing();	
		var str = document.getElementById("str");
		str.value=JSON.stringify(jsonData);
		var form = document.getElementById("form");
		form.submit();
	}
	

	
	
	function changeRadio()
	{
				var radio = document.getElementsByName("crawlwarnType");
				for(var i = 0 ; i < radio.length; i++)
				{
					if(radio[i].checked == true)
						{
							crawlwarnType = radio[i].value;
						}
				}
				switch(crawlwarnType)
				{
							
					case "1":
								 $("#startTime").val("");
								 $("#endTime").val("");
								 $("#parkTime").val("");
								 $("#parkTime").attr("disabled",true);//不可编辑，不可以传值
								 $("#parkTime").attr("style","background-color:gray");
								 $("#idleTime").val("");
								 $("#idleTime").attr("disabled",true);//不可编辑，不可以传值
								 $("#idleTime").attr("style","background-color:gray");
								 break;
					case "2":
								$("#startTime").val("");
								 $("#endTime").val("");
								$("#parkTime").val("");
								 $("#parkTime").attr("disabled",true);//不可编辑，不可以传值
								 $("#parkTime").attr("style","background-color:gray");
								 $("#idleTime").val("");
								 $("#idleTime").attr("disabled",true);//不可编辑，不可以传值
								 $("#idleTime").attr("style","background-color:gray");
								 break;
					case "3":
								$("#startTime").val("");
								 $("#endTime").val("");
								 $("#parkTime").val("");
								 $("#parkTime").attr("disabled",true);//不可编辑，不可以传值
								 $("#parkTime").attr("style","background-color:gray");
								 $("#idleTime").val("");
								 $("#idleTime").attr("disabled",false);//不可编辑，不可以传值
								 $("#idleTime").attr("style","");
								 break;
					case "4":
								$("#startTime").val("");
								 $("#endTime").val("");
								 $("#parkTime").val("");
								 $("#parkTime").attr("disabled",false);//不可编辑，不可以传值
								 $("#parkTime").attr("style","");
								 $("#idleTime").val("");
								 $("#idleTime").attr("disabled",false);//不可编辑，不可以传值
								 $("#idleTime").attr("style","");
								 break;
					case "5":
								$("#startTime").val("");
								 $("#endTime").val("");
								 $("#parkTime").val("");
								 $("#parkTime").attr("disabled",false);//不可编辑，不可以传值
								 $("#parkTime").attr("style","");
								 $("#idleTime").val("");
								 $("#idleTime").attr("disabled",true);//不可编辑，不可以传值
								 $("#idleTime").attr("style","background-color:gray");
								 break;
						}
					}
			
		<%-- 
		var param = {
			"crawlName" : crawlName,
			"crawlwarnType" : crawlwarnType
		};
		var url = "<%=basePath%>crawlcar_car";
			$.post(url, param, function(data) {
				alert(1);
			}); 
		--%>
		
		
		var work_layout = document.getElementById('set-Electronic-right-work-wap-id');

		var zTree_menu = document.getElementById('manage-Monitor-left-menu-title-id');
		function showMeaun() {

			if (zTree_menu.style.display == "block") {
				zTree_menu.style.display = "none";
				work_layout.style.width = "100%";
				$("#manage-Monitor-right-work-data-MenuDisplay-btn").html(
						'》》');
			} else {
				zTree_menu.style.display = "block";
				$("#manage-Monitor-right-work-data-MenuDisplay-btn").html(
						'《《');
				work_layout.style.width = "80%";

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
	</script>
</body>
</html>