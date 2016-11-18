<!DOCTYPE html>
<HTML>
<HEAD>
	<TITLE> ZTREE DEMO - multiTree</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="./zTreeStyle/demo.css" type="text/css">
	<link href="./zTreeStyle/zTreeStyle.css" rel="stylesheet" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="./js/jquery.ztree.core-3.5.min.js"></script>
<script src="./js/jquery.ztree.excheck.min.js"></script>
<script src="./js/jquery.ztree.exedit.min.js"></script>
	<SCRIPT type="text/javascript">
		<!--
		var setting = {
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

		var zNodes =[
			{ id:1, pId:0, name:"parent node 1", open:true},
			{ id:11, pId:1, name:"leaf node 1-1"},
			{ id:12, pId:1, name:"leaf node 1-2"},
			{ id:13, pId:1, name:"leaf node 1-3"},
			{ id:2, pId:0, name:"parent node 2", open:true},
			{ id:21, pId:2, name:"leaf node 2-1"},
			{ id:22, pId:2, name:"leaf node 2-2"},
			{ id:23, pId:2, name:"leaf node 2-3"},
			{ id:3, pId:0, name:"parent node 3", open:true },
			{ id:31, pId:3, name:"leaf node 3-1"},
			{ id:32, pId:3, name:"leaf node 3-2"},
			{ id:33, pId:3, name:"leaf node 3-3"}
		];

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
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			$.fn.zTree.init($("#treeDemo2"), setting);
			
		});
		//-->
	</SCRIPT>
</HEAD>

<BODY>
<div class="content_wrap">
	<div class="zTreeDemoBackground left">
		<p>未设置</p>
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<div class="right">
	<p>设置</p>
		<ul id="treeDemo2" class="ztree"></ul>
	</div>
</div>
</BODY>
</HTML>