<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>甲型H7N9流感预防的智能决策支持系统</title>

<script type="text/javascript" src="${ctx }/js/jquery.min.js"></script>

<!-- MASTER STYLESHEET-->
<link href="${ctx }/css/styles.css" rel="stylesheet" type="text/css" />

<!-- LOAD TIPSY TOOLTIPS-->
<script type="text/javascript" src="${ctx }/js/jquery.tipsy.js"></script>

<!-- LOAD CUSTOM JQUERY SCRIPTS-->
<script type="text/javascript" src="${ctx }/js/scripts.js"></script>

<!-- LOAD FACEBOX -->
<script type="text/javascript" src="${ctx }/js/facebox.js"></script>
<link href="${ctx }/css/facebox.css" rel="stylesheet" type="text/css" />


<!--[if IE]>
     <script language="javascript" type="text/javascript" src="${ctx }/js/excanvas.pack.js"></script>
    <![endif]-->


<!--[if IE 6]>
    <script src="${ctx }/js/pngfix.js"></script>
    <script>
        DD_belatedPNG.fix('.png_bg');
    </script>        
    <![endif]-->


<script type="text/javascript">
<!--
	$(function() {
		$(".home3").find("a").addClass("active");
	});
	
	function getAnswer() {
		var q = $("#q").val();
		if(q) {
			$("#q").val("");
			$.post("${ctx}/answers", {
				q: q
			}, function(data) {
				$("#win").html("<br />问：" + q + "<br />答：" + data + "<br />" + $("#win").html());
			});
		}
	}
	
	function a(str) {
		$("#q").val(str);
		getAnswer();
	}
	
	function a1() {
		$("#q").val("症状");
		getAnswer();
	}
	
	function a2() {
		$("#q").val("地区");
		getAnswer();
	}
//-->
</script>
</head>

<body>

	<%@include file="include/header.jsp"%>

	<div id="main_content_wrap" class="container_12">
		
	</div>

	<div class="clearfix">&nbsp;</div>

	<div class="container_12">

		<h3>请在下方输入：</h3>
		<br />
		<p>如：<a href="#" onclick="a1()">症状</a>，<a href="#" onclick="a2()">地区</a></p>
		<div class="clearfix" id="navigation" style="margin-top:3px">
			<ul><li>
			<input type="text" id="q" name="question" style="width: 380px;height:30px;line-height: 30px;float: left" />
			<a href="#" class="last" onclick="getAnswer()" style="margin:5px;">提交</a>
			</li></ul>
		</div>
		<div readonly="readonly" style="width: 100%;height:250px;font-weight: bold;overflow: scroll;border: 1px solid gray" id="win"></div>
	</div>

	<div class="clearfix">&nbsp;</div>
	<div class="container_12">
		<div id="footer" class="grid_12">
			<p>&copy; Copyright 2010 上海中医药大学</p>
		</div>
	</div>
</body>
</html>
