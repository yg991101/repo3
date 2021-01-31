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
		$("#addOther").click(function(){
			$("#other").show();
		});
		$("#conf").click(function(){
			$.post("${ctx}/symptom/add", {
				name: $("#s-name").val(),
				code: $("#s-code").val()
			}, function(data){
				$("#other").hide();
				$("#addOther").before('<input type="checkbox" class="checkbox" name="symptom" value="'+data.code+'" /><label>'+data.name+'（'+data.code+'）</label>')
			});
		});
	});
	
	function show() {
		$("#ext").show();
	}
	
	function hide() {
		$("#ext").hide();
	}
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

		<h2>输入新案件</h2>

		<div class="clearfix">&nbsp;</div>

		<form action="${ctx }/cases/add" method="post">
			<!-- RADIO GROUPS -->
			<p>
				<label>姓名:</label><br /> <input type="text" name="name"
					class="text small" />
			</p>
			<p>
				<label>性别:</label><br /> <input type="radio" name="gender"
					id="RADIO1" value="男" /> <label for="RADIO1">男</label> <input
					type="radio" name="gender" id="RADIO2" value="女" /> <label
					for="RADIO2">女</label>
			</p>
			<p>
				<label>年龄:</label><br /> <input type="text" name="age"
					class="text small" />
			</p>
			<p>
				<label>地区:</label><br /> <input type="text" name="area"
					class="text small" />
			</p>
			<p>
				<label>症状:</label><br />
				<c:forEach items="${symptoms }" var="s">
					<input type="checkbox" class="checkbox" name="symptom"
						value="${s.code }" />
					<label>${s.name }（${s.code }）</label>
				</c:forEach>
				<input type="button" class="submit" value="添加其他症状" id="addOther" />
			</p>
			<p id="other" style="display:none;">
				<label>症状名:</label><input name="s-name" type="text" id="s-name" />
				<label>症状名英文:</label><input name="s-code" type="text" id="s-code" />
				<input type="button" class="submit" value="确定" id="conf" />
			</p>
			<p>
				<label>是否确诊:</label><br /> <input type="radio" name="confirmation"
					value="1" onclick="show()" /> <label for="RADIO1">确诊</label> <input type="radio"
					name="confirmation" value="0" onclick="hide()" /> <label for="RADIO2">排除</label>
			</p>
			
			<hr />
			<div id="ext" style="display: none;">
			<h2>防御信息</h2>
			<p>
				<label>防御此流感基础设施先进性（1~5分）:</label><br /> <input type="text" name="base"
					class="text small" />
			</p>
			<p>
				<label>防御流感管理体系（1~5分）:</label><br /> <input type="text" name="management"
					class="text small" />
			</p>
			<p>
				<label>防御控制实施渠道（1~5分）:</label><br /> <input type="text" name="channel"
					class="text small" />
			</p>
			<p>
				<label>主要防控人员的素质和经验（1~5分）:</label><br /> <input type="text" name="experience"
					class="text small" />
			</p>
			<p>
				<label>防控结构合理性（1~5分）:</label><br /> <input type="text" name="rationality"
					class="text small" />
			</p>
			<p>
				<label>国家和地方政府的资金投入（1~5分）:</label><br /> <input type="text" name="fund"
					class="text small" />
			</p>
			<p>
				<label>防御机制的稳定性和前景分析（1~5分）:</label><br /> <input type="text" name="analysis"
					class="text small" />
			</p>
			<p>
				<label>重大疫情防御情况（1~5分）:</label><br /> <input type="text" name="defence"
					class="text small" />
			</p>
			</div>
			<p>
				<input type="submit" class="submit" value="保存" /> <input
					name="Reset2" type="submit" class="submit special" value="取消"
					onclick="history.go(-1)" />
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
