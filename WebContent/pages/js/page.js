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
			window.location.href = "<%=basePath%>outLogin";
	});	
});