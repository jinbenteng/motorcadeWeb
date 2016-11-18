<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="./js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="./baidumapv2/baidumap_offline_v2_load.js"></script>
<link rel="stylesheet" type="text/css" href="./baidumapv2/css/baidu_map_v2.css"/>

<style type="text/css">
	 body, html, #allmap {width: 100%;height: 100%; overflow: hidden; margin:0; font-family:"微软雅黑";}
</style>
</head>
<body>
<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
var url = window.location.search;
var str = "";	//参数:2?sectorId
var map,marker,lable;
var s = new Array();
var adds = new Array();
map = new BMap.Map("allmap");
map.centerAndZoom(new BMap.Point(116.404, 39.915), 15);
map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
map.addControl(new BMap.NavigationControl());   //缩放按钮

 var webSocket =  new WebSocket('ws://localhost:8080/motorcadeWeb/websocket');
 if(url.indexOf("?") != -1)
	str = url.substr(1);
else
	alert("参数不全"); 
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

	    s = eval(event.data);
		for( var i = 0; i < s.length; i++)
		{
			adds[i] = new BMap.Point(s[i].longitude,s[i].latitude);
			lable = s[i].plateNumber+"<p hidden>"+s[i].sn+"</p>";			
			addMarker(adds[i],lable,s[i].state);
		}
		map.panTo(adds[0]);
	}
	function addMarker(point,lable,online)
	{
		switch(online)
		{
		case 0 : 
			 car = new BMap.Marker(point,{icon : new BMap.Icon("<%=basePath%>pages/img/car.png",
						new BMap.Size(28, 40), {
					imageOffset : new BMap.Size(0, 0)
				})
				});
			 break;
		case 1 :
			car = new BMap.Marker(point,{icon : new BMap.Icon("<%=basePath%>pages/img/caroff.png",
				new BMap.Size(28, 40), {
			imageOffset : new BMap.Size(0, 0)
			})
			});
				break;
		}
		car.setTop(true);
		 map.addOverlay(car); 
		var label = new BMap.Label(lable, {
			offset : new BMap.Size(-5, -20)
		});
		car.setLabel(label);
		
		car.addEventListener("click",function()
				{
					
					var p = this.getLabel();       //获取marker的位置   
					var m = p.getContent();
					var n = m.split("<p hidden>");
					var sn = n[1].substr(0,n[1].length-4);
					
					var url = encodeURI("http://localhost:8080/motorcadeWeb/pages/manage-Replay-histroy-MapShow.jsp?2"+sn);			
					window.location.href = url; 
				});
		car.addEventListener("mouseover",function()
				{
					car.setTop(true,27000000);
				});
		car.addEventListener("mouseout",function()
				{
					car.setTop(false); 
				});
	}
	
	
		

	function onOpen(event) {
		webSocket.send(str);
	}

	function onError(event) {
		alert(event.data);
	}
</script>