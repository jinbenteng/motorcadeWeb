<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="telephone=no" name="format-detection"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<script src="./js/jquery-1.8.1.min.js" ></script>
<script type="text/javascript" src="./js/ip.js"></script>

<link rel="stylesheet" type="text/css" href="./css/manage-Monitor-Realtime.css" />
<!-- 在线地图API -->
<script type="text/javascript"
	src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=5eaf319004051778e962d47c4e46bb78"></script>
<!-- 离线地图API -->
<!-- <script type="text/javascript" src="./baidumapv2/baidumap_offline_v2_load.js"></script>
<link rel="stylesheet" type="text/css" href="./baidumapv2/css/baidu_map_v2.css"/> -->
<title>单车监控</title>


<link href="./css/bootstrap.css" rel="stylesheet"> 
</head>
<body >
    <div class="manage-Monitor-realtime-work">
      		<div class="manage-Monitor-realtime-work-map">
               <div class="manage-Monitor-realtime-work-map-float" id="manage-Monitor-realtime-work-map-float-id">
               		<p style=" width:80%; height:20px;  font-size:12px; text-align:center; margin-top:40px; margin-left:2px" id="addTime"></p>
                    <p style=" width:80%; height:20px;  font-size:14px; text-align:center; margin-left:2px" id="instantFuelConsumption"></p>
                    <p style=" width:80%; height:20px;  font-size:14px; text-align:center; margin-left:2px" id="recorderVelocity"></p>
                </div>
				<div style=" height:100%; " id="map">                	
                </div>
            </div>		
         <div class="manage-Monitor-realtime-data">
            	<div class="manage-Monitor-realtime-oilTotal">
                	<div class="manage-Monitor-realtime-oilTotal-title">
                    	<img src="./img/car-bg.png" style="width:80px; height:80px; margin-left:20px; margin-top:40px"></img>
                        <p style="margin-left:35px">行驶统计</p>
                    </div>
                    <div class="manage-Monitor-realtime-oilTotal-info">
                    	 <div id="manage-Monitor-realtime-info-id">
                             <span>行驶</span>
                             <span id="mileage"></span>
                             <span>Km</span>
                         </div>
                         <div id="manage-Monitor-realtime-info-id">
                             <span>转速</span>
                             <span id="speed"></span>
                             <span>r/min</span>
                         </div>
                         <div id="manage-Monitor-realtime-info-id">
                             <span>怠速</span>
                             <span>100</span>
                             <span>秒</span>
                         </div>
                          <div id="manage-Monitor-realtime-info-id">
                             <span>电压</span>
                             <span id="voltage"></span>
                             <span>v</span>
                         </div>
                         <div id="manage-Monitor-realtime-info-id">
                             <span>冷却液温度</span>
                             <span id="coolantTemperature"></span>
                             <span>℃ </span>
                         </div>                        
                    </div>
                </div>
                <div class="manage-Monitor-realtime-travelTotal">
	                <div class="manage-Monitor-realtime-travelTotal-title">
                    	<img src="./img/oil-bg.png" style="width:80px; height:80px; margin-left:20px; margin-top:40px"></img>
                        <p style="margin-left:35px">油耗统计</p>
                    </div>
                    <div class="manage-Monitor-realtime-travelTotal-info">
                    	<div id="manage-Monitor-realtime-info-id">
                             <span>油耗</span>
                             <span id="oilMass"></span>
                             <span>L</span>
                         </div>
                         <div id="manage-Monitor-realtime-info-id">
                             <span>油费</span>
                             <span></span>
                             <span>元</span>
                         </div>
                         <div id="manage-Monitor-realtime-info-id">
                             <span>百公里油耗</span>
                             <span id="fuelConsumption"></span>
                             <span>L</span>
                         </div>                        
                    </div>
                </div>
            <div class="manage-Monitor-realtime-drivingTotal">
                	<div class="manage-Monitor-realtime-drivingTotal-title">
                    	<img src="./img/driving-bg.png" style="width:80px; height:80px; margin-left:20px; margin-top:40px"></img>
                        <p style="margin-left:35px">驾驶习惯</p>
                    </div>
                    <div class="manage-Monitor-realtime-drivingTotal-info">
                    	 <div id="manage-Monitor-realtime-info-id">
                             <span>急加速</span>
                             <span>1</span>
                             <span>次</span>
                             &nbsp;&nbsp;
                             <span>急减速</span>
                             <span>1</span>
                             <span>次</span>
                        
                         </div> 
                         <div id="manage-Monitor-realtime-info-id">
                              <span>最高车速</span>
                             <span>123</span>
                             <span>Km/h</span>
                         </div>
                         <div id="manage-Monitor-realtime-info-id">
                             <span>最高转速</span>
                             <span>2399</span>
                             <span>r/min</span>
                         </div>
                         <div id="manage-Monitor-realtime-info-id">
                              <span>百公里急加速</span>
                             <span>2</span>
                             <span>次</span>
                         </div>
                         <div id="manage-Monitor-realtime-info-id">
                             <span>百公里急减速</span>
                             <span>5</span>
                             <span>次</span>
                         </div>
                    </div>
                 </div>
   		 </div>   
    </div>
</body>
</html>
<script type="text/javascript">

var str;
var url = window.location.search;
if (url.indexOf("?") != -1) {
	str = url.substr(1);
}
var car,label;
var map = new BMap.Map("map");
map.centerAndZoom(new BMap.Point(116.404, 39.915), 15);
map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
map.addControl(new BMap.NavigationControl());   //缩放按钮
//var webSocket =  new WebSocket('ws://localhost:8080/motorcadeWeb/onecarsocket');
//var webSocket =  new WebSocket('ws://'+IP+':8090/motorcadeWeb/onecarsocket');
var webSocket =  new WebSocket('ws://115.29.109.21:8090/motorcadeWeb/onecarsocket');
webSocket.onerror = function(event) {
	onError(event);
};

webSocket.onopen = function(event) {
	onOpen(event);
};

webSocket.onmessage = function(event) {
	onMessage(event);
};
function onMessage(event) {	
	map.clearOverlays();
    var result = eval("("+event.data+")");
    $("#addTime").html(result.addTime);   
    $("#instantFuelConsumption").html(result.instantFuelConsumption+"L");   
    $("#recorderVelocity").html(result.recorderVelocity+"KM/H");
    $("#mileage").html(result.mileage);
    $("#speed").html(result.speed);
    $("#voltage").html(result.voltage);
    $("#coolantTemperature").html(result.coolantTemperature);
    $("#oilMass").html(result.oilMass);
    $("#fuelConsumption").html(result.fuelConsumption);
    var point = new BMap.Point(result.longitude,result.latitude);
    map.panTo(point);
  	if(result.state == 0 || result.state == 3)
  		{
  		$(".manage-Monitor-realtime-work-map-float").css("display","none");
  		 car = new BMap.Marker(point,{icon : new BMap.Icon("./img/caroff.png",
					new BMap.Size(28, 40), {
				imageOffset : new BMap.Size(0, 0)
				})
			});
  		}
  	else if(result.state == 1 || result.state == 2)
  		{
  		$(".manage-Monitor-realtime-work-map-float").css("display","block");
  		car = new BMap.Marker(point,{icon : new BMap.Icon("./img/car.png",
				new BMap.Size(28, 40), {
			imageOffset : new BMap.Size(0, 0)
			})
			});
  		}
  	map.addOverlay(car);  	
}
function onOpen(event) {
	webSocket.send(str);
}

function onError(event) {
	alert(event.data);
}

  </script>