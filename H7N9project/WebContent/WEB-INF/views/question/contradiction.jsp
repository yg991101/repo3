<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
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
		$(".home2").find("a").addClass("active");
	});
//-->
</script>
</head>

<body>

	<%@include file="../include/header.jsp"%>

	<div id="main_content_wrap" class="container_12">
		<div id="icondock" class="grid_12">
			<ul>
				<li><a href="${ctx }/questions/redundance" title="消除数据冗余"><img
						src="${ctx }/images/repeat.png" /><br />检查冗余</a></li>
				<li><a href="${ctx }/questions/contradiction" title="矛盾性检查"><img
						src="${ctx }/images/check.png" alt="" /><br />检查矛盾</a></li>
			</ul>
		</div>
	</div>

	<div class="clearfix">&nbsp;</div>
	
	<div class="container_12">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<th width="34%" scope="col">症状</th>
				<th width="8%" scope="col">确诊数量</th>
				<th width="8%" scope="col">排除数量</th>
			</tr>
			<c:forEach items="${count }" var="p">
				<tr>
					<td scope="col">${p[0] }</td>
					<td scope="col">${p[1] }</td>
					<td scope="col">${p[2] }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="container_12">

		<div class="clearfix">&nbsp;</div>

	</div>

	<div class="clearfix">&nbsp;</div>
	<div class="container_12">
		<div id="footer" class="grid_12">
			<p>&copy; Copyright 2010 上海中医药大学</p>
		</div>
	</div>
</body>
</html>
