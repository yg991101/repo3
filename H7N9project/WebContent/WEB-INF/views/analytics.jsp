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

<script src="${ctx }/js/r.js"></script>
<script src="${ctx }/js/echarts-map.js"></script>
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

		<h2>案例地域统计</h2>

		<div id="main" style="height:450px"></div>
			<script type="text/javascript">
			var data = [];
			<c:forEach items="${areaStats}" var="d1">
            data.push({
            	name: '${d1[0]}',
            	value: ${d1[1]}
            });
            </c:forEach>
		        // 路径配置
		        require.config({
		            paths:{ 
		                'echarts' : '${ctx }/js/echarts',
		                'echarts/chart/map' : '${ctx }/js/echarts'
		            }
		        });
		        
		     	// 使用
		        require(
		            [
		                'echarts',
		                'echarts/chart/map' // 使用柱状图就加载bar模块，按需加载
		            ],
		            function(ec) {
		                // 基于准备好的dom，初始化echarts图表
		                var myChart = ec.init(document.getElementById('main')); 
		                
		                var option = {
	                		title : {
	                   	        text: '按地域统计',
	                   	        subtext: '统计报表',
	                   	     	x:'center'
	                   	    },
		                    tooltip: {
		                        show: true,
		                        trigger: 'item'
		                    },
		                    legend: {
		                    	orient: 'vertical',
		                        x:'left',
		                        data:['案例数']
		                    },
		                    dataRange: {
		                        min: 0,
		                        max: 10,
		                        text:['高','低'],           // 文本，默认为数值文本
		                        calculable : true
		                    },
		                    toolbox: {
		                        show : true,
		                        orient : 'vertical',
		                        x: 'right',
		                        y: 'center',
		                        feature : {
		                            dataView : {show: true, readOnly: false},
		                            restore : {show: true},
		                            saveAsImage : {show: true}
		                        }
		                    },
		                    series : [
		                        {
		                        	name: '确诊病例',
		                            type: 'map',
		                            mapType: 'china',
		                            itemStyle:{
		                                normal:{label:{show:true}},
		                                emphasis:{label:{show:true}}
		                            },
		                            "data": data
		                        }
		                    ]
		                };
		        
		                // 为echarts对象加载数据 
		                myChart.setOption(option); 
		            }
		        );
		    </script>
	</div>

	<div class="clearfix">&nbsp;</div>
	<div class="container_12">
		<div id="footer" class="grid_12">
			<p>&copy; Copyright 2010 上海中医药大学</p>
		</div>
	</div>
</body>
</html>
