<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="header" class="png_bg">

	<div id="head_wrap" class="container_12">

		<!-- start of logo - you could replace this with an image of your logo -->
		<div id="logo" class="grid_4">
			<h1>
				<span>甲型H7N9流感预防智能决策支持系统</span>
			</h1>
		</div>
		<!-- end logo -->

		<!-- start control panel -->
		<div id="controlpanel" class="grid_8">
			<ul>
				<li><p>
						<strong>你好，管理员</strong>
					</p></li>
				<li><a href="login.html" class="last">退出登录</a></li>
			</ul>
		</div>

		<div id="navigation" class="grid_12">
			<ul>
				<li class="home0"><a href="${ctx }/index.jsp">主页</a></li>
				<li class="home1"><a href="${ctx }/cases">案例处理系统</a></li>
				<li class="home2"><a href="${ctx }/questions">问题求解系统</a></li>
				<li class="home3"><a href="${ctx }/answers">智能应答系统</a></li>
				<li class="home4"><a href="${ctx }/learning">机器学习系统</a></li>
			</ul>

		</div>
	</div>
</div>