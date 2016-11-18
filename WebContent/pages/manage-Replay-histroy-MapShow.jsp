<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!DOCTYPE html>

<html>

<head>
<meta charset=utf-8>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="telephone=no" name="format-detection"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0"> 
<link rel="stylesheet" type="text/css" href="./pages/css/manage-Replay-histroy-MapShow.css" />
<title></title>
</head>
<body>  
    <div class="manage-Monitor-realtime-work">            
      		<div class="manage-Monitor-realtime-work-map" id = "manage-Monitor-realtime-work-map-id">
      			<div class="manage-Monitor-realtime-work-map-float">
      				<p style=" width:80%; height:20px;  font-size:13px; text-align:center; margin-top:40px; margin-left:2px" id="addTime"></p>
                    <p style=" width:80%; height:20px;  font-size:14px; text-align:center; margin-left:2px" id="instantFuelConsumption"></p>
                    <p style=" width:80%; height:20px;  font-size:14px; text-align:center; margin-left:2px" id="recorderVelocity"></p>      				
      			</div>      			             
	           
				<div style="height: 100%;font-size:12px" id="map"></div>
            </div>          


			<div class="manage-Monitor-realtime-work-control" id="controle">
	            	<div id="cast">
						<img id="broadcast" src="./pages/img/play.png" onClick="run();">
					</div>
					<div class="ratings_bars">
					
						<div class="scale" id="bar0">
							<div></div>
							<span id="btn0"></span>
						</div>
						
					</div>
					 
					<div id="btn" onclick="fullScreen()" ><img src="./pages/img/quan.png" ></div>
        
	        </div>

         <div class="manage-Monitor-realtime-data" id="data">
     
            	<div class="manage-Monitor-realtime-oilTotal">
            		<span style="margin-left: 5px;">时间段：</span>
            		<span id="timer"></span>
                	<div class="manage-Monitor-realtime-oilTotal-title">                		
                    	<img src="./pages/img/car-bg.png" style="width:80px; height:80px; margin-left:20px; margin-top:20px"></img>
                        <p style="margin-left:35px">行驶统计</p>
                    </div>
                    
                    <div class="manage-Monitor-realtime-oilTotal-info">
                    	 <div id="manage-Monitor-realtime-info-id">
                             <span>行驶</span>
                             <span id="totalMilege"></span>
                             <span>Km</span>
                         </div>
                         <div id="manage-Monitor-realtime-info-id">
                             <span>用时</span>
                             <span id="timeConsum"></span>
                         </div>
                         <div id="manage-Monitor-realtime-info-id">
                             <span>怠速</span>
                             <span id="nIdlelong"></span>
                             <span>秒</span>
                         </div>
                          <div id="manage-Monitor-realtime-info-id">
                             <span>平均车速</span>
                             <span id="averageSpeed"></span>
                             <span>km/h</span>
                         </div>
                        
                    </div>
                   

                </div>
                
                <div class="manage-Monitor-realtime-travelTotal">
	                <div class="manage-Monitor-realtime-travelTotal-title">
                    	<img src="./pages/img/oil-bg.png" style="width:80px; height:80px; margin-left:20px; margin-top:40px"></img>
                        <p style="margin-left:35px">油耗统计</p>
                    </div>
                    <div class="manage-Monitor-realtime-travelTotal-info">
                    	<div id="manage-Monitor-realtime-info-id">
                             <span>油耗</span>
                             <span id="fuelconsumption"></span>
                             <span>L</span>
                         </div>
                         <div id="manage-Monitor-realtime-info-id">
                             <span>百公里油耗</span>
                             <span id="hundredFuel"></span>
                             <span>L</span>
                         </div>                        
                    </div>
                </div>
               
                <div class="manage-Monitor-realtime-drivingTotal">	
                	<div class="manage-Monitor-realtime-drivingTotal-title">
                    	<img src="./pages/img/driving-bg.png" style="width:80px; height:80px; margin-left:20px; margin-top:40px"></img>
                        <p style="margin-left:35px">驾驶习惯</p>
                    </div>
                    <div class="manage-Monitor-realtime-drivingTotal-info">
                    	 <div id="manage-Monitor-realtime-info-id">
                             <span>急加速</span>
                             <span id="nHardacceleration"></span>
                             <span>次</span>
                             &nbsp;&nbsp;
                             <span>急减速</span>
                             <span id="nRapiddeceleration"></span>
                             <span>次</span>
                        
                         </div> 
                         <div id="manage-Monitor-realtime-info-id">
                              <span>最高转速</span>
                             <span id="maxspeed"></span>
                             <span>r/min</span>
                         </div>
                         <div id="manage-Monitor-realtime-info-id">
                             <span>最高车速</span>
                             <span id="maxvelocity"></span>
                             <span>Km/h</span>
                         </div>
                    </div>
            	</div>        
   		 </div>   
    </div> 


<script type="text/javascript">
var str = <%=request.getParameter("drivelogId")%>;  //参数:行驶轨迹编号
var map = new BMap.Map("map");
var points = new Array();
var speeds = new Array();
var times = new Array();
var oilconsum = new Array();
var click = 0; //点击播放次数
var ll = 0;
var car; //汽车图标
var label; //信息标签
var timer; //定时器
var index = 0; //记录播放到第几个point
var cutcount = 0;
var fast = 1000; //小车跑动速度
var flag = 0; //区分正序播放与倒序播放
var suo = 0;
var count = 0;
map.centerAndZoom(new BMap.Point(116.404, 39.915),15);
map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
map.addControl(new BMap.NavigationControl());   //缩放按钮
url = "./driver_log";
var param = {"id":str};

$.post(url,param,function(data){	
	var result = eval(data);
	$("#timer").html(result.timer);
	$("#totalMilege").html(result.totalMilege);
	$("#timeConsum").html(result.timeConsum);
	$("#nIdlelong").html(result.nIdlelong);
	$("#averageSpeed").html(result.averageSpeed);
	$("#fuelconsumption").html(result.fuelconsumption);
	$("#hundredFuel").html(result.hundredFuel);
	$("#nHardacceleration").html(result.nHardacceleration);
	$("#nRapiddeceleration").html(result.nRapiddeceleration);
	$("#maxspeed").html(result.maxspeed);
	$("#maxvelocity").html(result.maxvelocity);
	count = result.COUNT;
	if(count > 0)
		{
		for(var i = 0; i < count; i++)
		{
			var value = eval(result.values[i]);
			points[i] = new BMap.Point(value.longitude,value.latitude);
			speeds[i] = value.recorderVelocity;
			times[i] = value.addTime;
			oilconsum[i] = value.instantFuelConsumption;			
		}
	var myP1 = points[0];
	var myP2 = points[points.length - 1];

	var start = new BMap.Icon('./pages/img/start.png', new BMap.Size(
			28, 80), {
		anchor : new BMap.Size(14, 40)
	});

	var end = new BMap.Icon('./pages/img/end.png', new BMap.Size(28,
			39), {
		anchor : new BMap.Size(14, 40)
	});
	var marker1 = new BMap.Marker(myP1, {
		icon : start
	});
	var marker2 = new BMap.Marker(myP2, {
		icon : end
	});
	car = new BMap.Marker(points[0], {
		icon : new BMap.Icon("./pages/img/car.png",
				new BMap.Size(28, 80), {
					imageOffset : new BMap.Size(0, 0)
				})
	});
	$("#addTime").html(times[0]);   
	$("#instantFuelConsumption").html(oilconsum[0]+"L");   
	$("#recorderVelocity").html(speeds[0]+"KM/H");
	map.addOverlay(marker1);
	map.addOverlay(marker2);
	map.addOverlay(car);
	map.panTo(myP1);
	var polyline = new BMap.Polyline(points, {
		strokeColor : "blue",
		strokeWeight : 3,
		strokeOpacity : 0.5 
	});
	map.addOverlay(polyline);
	
	 /*拖动进度条，小车同步*/
	//进度条
	 scale = function(btn, bar) {
		this.btn = document.getElementById(btn);
		this.bar = document.getElementById(bar);
		this.step = this.bar.getElementsByTagName("DIV")[0];
		this.init1();
	};
	scale.prototype = {
		init1 : function() {
			var temp = 0;
			var f = this, g = document, b = window, m = Math;
			//点下鼠标
			f.btn.onmousedown = function(e) {
				var x = (e || b.event).clientX; //返回当事件被触发时鼠标指针向对于浏览器页面（或客户区）的水平坐标。
				var l = this.offsetLeft; //距离左侧的距离   
				var max = f.bar.offsetWidth - this.offsetWidth + 4;
				//拖动鼠标
				g.onmousemove = function(e) {					
					var thisX = (e || b.event).clientX;
					var to = m.min(max, m.max(-4, l + (thisX - x)));
					f.btn.style.left = to + 'px';
					var temp2 = m.round(m.max(0, to / max) * 100);
					if (temp != temp2) {
						temp = temp2;
						var mmm = Math.round((points.length - 1) * temp
								/ 100);
						
						/* label.setContent("速度: " + speeds[mmm]
						+ "Km/H" + "<br>时间: " + times[mmm]
						+ "<br>油耗: " + oilconsum[mmm]); */
						 $("#addTime").html(times[mmm]);   
					    $("#instantFuelConsumption").html(oilconsum[mmm]+"L");   
					    $("#recorderVelocity").html(speeds[mmm]+"KM/H");
						car.setPosition(points[mmm]);					
						cutcount = mmm;
						temp = 0;
						
					}
					f.ondrag(m.round(m.max(0, to / max) * 100), to);
					e.preventDefault(); 
					
				};
				//松起鼠标
				g.onmouseup = function(e) {								
					//把控制条清空	
					this.onmousemove = null;
					var temp1 = m.round(m.max(0, to / max) * 100);
					if (temp != temp1) {
						temp = temp1;
						var mmm = Math.round((points.length - 1)
								* temp / 100);
						
						/* label.setContent("速度: " + speeds[mmm]
								+ "Km/H" + "<br>时间: " + times[mmm]
								+ "<br>油耗: " + oilconsum[mmm]); */
						$("#addTime").html(times[mmm]);   
						$("#instantFuelConsumption").html(oilconsum[mmm]+"L");   
						$("#recorderVelocity").html(speeds[mmm]+"KM/H");
						car.setPosition(points[mmm]);
						car.setPosition(points[mmm]);
						map.panTo(points[mmm]);
						cutcount = mmm;

					}
				}
			};
		},
		ondrag : function(pos, x) {
			this.step.style.width = Math.max(0, x) + 10 + 'px';
			var temp = pos / 10 + '';
		}
	}
	new scale('btn0', 'bar0');

	/*小车跑动，时间轴同步*/

	 ss = function(btn, bar, l) {
		this.btn = document.getElementById(btn);
		this.bar = document.getElementById(bar);
		this.step = this.bar.getElementsByTagName("DIV")[0];
		var aaa = this.bar.offsetWidth - this.btn.offsetWidth + 4;
		var bbb;
		if (l == 0) {
			bbb = -4;
		} else
		{
			bbb = aaa * l;
		}
				
		this.ll(bbb);
	};
	ss.prototype = {
		ll : function(bbb) {
			this.step.style.width = bbb + 10 + 'px';
			this.btn.style.left = bbb +  'px';
		}
	}
		}
	
});
			
/* 点击按钮，播放与暂停按钮互相切换*/
	/* click代表点击次数，“0”代表点击播放按钮；“1”代表点击暂停按钮 */
	function run() {
	if(count > 0)
		{
		if (click == 0) {
			document.getElementById("broadcast").src = "./pages/img/pause.png";				
			play();
			click++;
		} else if (click == 1) {
			document.getElementById("broadcast").src = "./pages/img/play.png";
			pause();
			click = 0;
		}
		}
	}

	/*播放，小车跑动*/

	function play() {
		if (cutcount != 0) {
			index = cutcount;
			cutcount = 0;
		}

		if ((index < 0) || (index == points.length)) {
			fast = 1000;
			flag = 0;
			index = 0;
		}
		if (index == 0 && click == 1) {
			document.getElementById("broadcast").src = "./pages/img/play.png";
			click = 0;
		}
		var point = points[index];
		var speed = speeds[index];
		var time = times[index];
		var oil = oilconsum[index];

		/* label.setContent("速度: " + speed + "Km/H" + "<br>时间: " + time
				+ "<br>油耗: " + oil + ""); */
		$("#addTime").html(time);   
		$("#instantFuelConsumption").html(oil+"L");   
		$("#recorderVelocity").html(speed+"KM/H");		
		
		if (flag == 0 || flag == 1) {
			index++;
		} else {
			index--;
		}
		var i = 0;
		car.setPosition(point);
		i++;
		
		var lll = index / (points.length);
		
		window.setTimeout("new ss('btn0','bar0'," + lll + ")", fast);
		
		
		map.panTo(point);
		
		if (index == points.length) {
			click = 1;
			run();
		}

		if (index <= (points.length - 1) && index >= 0) {
			timer = window.setTimeout("play(" + index + ")", fast);
		} else {
			map.panTo(point);
		}
	}

	/*暂停，小车停止*/

	function pause() {

		fast = 1000;
		ff = 0;
		rr = 0;

		if (timer) {
			window.clearTimeout(timer);
		}
	}
	function fullScreen()
	{
		if( suo == 0)
		{
			/*
		var elem = document.getElementById("map");	
		elem.style.height = "93%";
		document.getElementById("data").style.display = "none";
		document.getElementById("btn").innerHTML = "<img src='./pages/img/suo.png'>";
		document.getElementById("controle").style.top = "630px";
		suo = 1;
		*/
			var elem = document.getElementById("manage-Monitor-realtime-work-map-id");	
			elem.style.height = "93%";
			document.getElementById("data").style.display = "none";
			document.getElementById("btn").innerHTML = "<img src='./pages/img/suo.png'>";
			//document.getElementById("controle").style.top = "630px";
			suo = 1;
		}
	else
		{
		/*
		var elem = document.getElementById("map");	
		elem.style.height = "370px";
		document.getElementById("data").style.display = "block";
		document.getElementById("btn").innerHTML = "<img src='./pages/img/quan.png'>";
		document.getElementById("controle").style.top = "460px";
		suo = 0;
		*/
		var elem = document.getElementById("manage-Monitor-realtime-work-map-id");	
		elem.style.height = "59%";
		document.getElementById("data").style.display = "block";
		document.getElementById("btn").innerHTML = "<img src='./pages/img/quan.png'>";
		document.getElementById("controle").style.top = "460px";
		suo = 0;
		}
	}
  </script>
</body>
</html>