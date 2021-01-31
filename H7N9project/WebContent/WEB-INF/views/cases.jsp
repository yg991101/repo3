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

		<h2>案例列表</h2>

		<div class="clearfix">&nbsp;</div>

		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<th width="5%" scope="col"><input type="checkbox"
					name="checkbox" id="checkbox" class="checkall" /><label
					for="checkbox"></label></th>
				<th width="9%" scope="col">地区</th>
				<th width="9%" scope="col">性别</th>
				<th width="9%" scope="col">年龄</th>
				<th width="34%" scope="col">症状</th>
				<th width="8%" scope="col">是否确诊</th>
				<th width="11%" scope="col">日期</th>
				<th width="6%" scope="col">总分</th>
				<th width="8%" scope="col">危害等级</th>
			</tr>
			<c:forEach items="${pages.content }" var="p">
				<tr>
					<td scope="col"><input type="checkbox" name="checkbox2"
						id="checkbox2" /></td>
					<td scope="col">${p.area }</td>
					<td scope="col">${p.gender }</td>
					<td scope="col">${p.age }</td>
					<td scope="col">${p.symptomString }</td>
					<td scope="col">${p.confirmation == 0 ? '排除' : '确诊' }</td>
					<td scope="col">
						<fmt:formatDate value="${p.infodate }" pattern="yyyy-MM-dd" />
					</td>
					<td scope="col">${p.confirmation == 0 ? '--' : p.sum }</td>
					<td scope="col">
						<c:choose>
							<c:when test="${p.confirmation == 0 }">--</c:when>
							<c:when test="${p.sum < 50 }">B2</c:when>
							<c:when test="${p.sum >= 50 && p.sum < 60}">B1</c:when>
							<c:when test="${p.sum >= 60 && p.sum < 70}">A2</c:when>
							<c:when test="${p.sum >= 70}">A1</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>

		<div class="grid_12">

			<div class="clearfix">&nbsp;</div>

			<ul id="pagination">
				<li class="previous">
				<c:choose>
					<c:when test="${pages.hasPreviousPage() }">
						<a href="${ctx }/cases?page=${pages.number-1}">上一页</a>
					</c:when>
					<c:otherwise>
						<a href="#">上一页</a>
					</c:otherwise>
				</c:choose>
				</li>
				<c:forEach begin="1" end="${pages.totalPages }" var="current">
					<c:choose>
						<c:when test="${current==pages.number+1}">
							<li class='active'>${current }</li>
						</c:when>
						<c:otherwise>
							<li><a href="${ctx }/cases?page=${current-1 }">${current }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="next">
				<c:choose>
					<c:when test="${pages.hasNextPage() }">
						<a href="${ctx }/cases?page=${pages.number+1}">下一页</a>
					</c:when>
					<c:otherwise>
						<a href="#">下一页</a>
					</c:otherwise>
				</c:choose>
				</li>
			</ul>
		</div>

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
