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
		$(".home1").find("a").addClass("active");
		
	});
//-->
</script>
</head>

<body>

	<%@include file="include/header.jsp"%>

	<div id="main_content_wrap" class="container_12">
		<div id="icondock" class="grid_12">
			<ul>
				<li><a href="${ctx }/cases/add" title="添加已知案例"><img
						src="${ctx }/images/Plus-32.png" /><br />添加案例</a></li>
				<li><a href="${ctx }/cases/evaluate" title="专家评价"><img
						src="${ctx }/images/icondock/Notes.png" alt="" /><br />专家评价</a></li>
				<li><a href="${ctx }/cases/analytics" rel="tipsy" title="查看最近的销售数据"><img
						src="${ctx }/images/icondock/analytics.png" /><br />案例统计</a></li>
			</ul>
		</div>
	</div>

	<div class="clearfix">&nbsp;</div>

	<div class="container_12">

		<h2>案例防御评价结果</h2>

		<div class="clearfix">&nbsp;</div>

		<form action="${ctx }/cases/evaluate" method="post">
			<p>
				<label>流感症状的环境:</label><br />
				<label style="color: red;">与案例库中${m1 }号案例完全匹配，得分：5</label>
			</p>
			<p>
				<label>防御此流感基础设施先进性:</label><br />
				<label style="color: red;">与案例库中${m2 }号案例完全匹配，得分：${param.base}</label>
			</p>
			<p>
				<label>防御流感管理体系:</label><br />
				<label style="color: red;">与案例库中${m3 }号案例完全匹配，得分：${param.management}</label>
			</p>
			<p>
				<label>防御控制实施渠道:</label><br />
				<label style="color: red;">与案例库中${m4 }号案例完全匹配，得分：${param.channel}</label>
			</p>
			<p>
				<label>主要防控人员的素质和经验:</label><br />
				<label style="color: red;">与案例库中${m5 }号案例完全匹配，得分：${param.experience}</label>
			</p>
			<p>
				<label>防控结构合理性:</label><br />
				<label style="color: red;">与案例库中${m6 }号案例完全匹配，得分：${param.rationality}</label>
			</p>
			<p>
				<label>国家和地方政府的资金投入:</label><br />
				<label style="color: red;">与案例库中${m7 }号案例完全匹配，得分：${param.fund}</label>
			</p>
			<p>
				<label>防御机制的稳定性和前景分析:</label><br />
				<label style="color: red;">与案例库中${m8 }号案例完全匹配，得分：${param.analysis}</label>
			</p>
			<p>
				<label>重大疫情防御情况:</label><br />
				<label style="color: red;">与案例库中${m9 }号案例完全匹配，得分：${param.defence}</label>
			</p>
			<p>
				<label>危害等级（总分）:</label><br />
				<c:set value="${param.base+param.management+param.channel+param.experience+param.rationality+param.fund+param.analysis+param.defence+35}" var="sum"></c:set>
				<label style="color: red;"><c:choose>
					<c:when test="${sum < 50 }">B2</c:when>
					<c:when test="${sum >= 50 && sum < 60}">B1</c:when>
					<c:when test="${sum >= 60 && sum < 70}">A2</c:when>
					<c:when test="${sum >= 70}">A1</c:when>
				</c:choose>（${sum }）</label>
			</p>
		</form>

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
