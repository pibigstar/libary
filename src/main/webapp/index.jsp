<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../config/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>图书馆后台管理系统</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="favicon.ico">
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/main.css" media="all" />
</head>
<body class="main_body">
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部 -->
		<div class="layui-header header">
			<div class="layui-main">
				<a href="#" class="logo">图书馆后台管理</a>
				<!-- 显示/隐藏菜单 -->
				<a href="javascript:;" class="iconfont hideMenu icon-menu1"></a>
				<!-- 搜索 -->
				<div class="layui-form component">
			        <select name="modules" lay-verify="required" lay-search="">
						<option value="">直接选择或搜索选择</option>
						<option value="1">layer</option>
						<option value="2">form</option>
						<option value="3">layim</option>
						<option value="4">element</option>
						<option value="5">laytpl</option>
						<option value="6">upload</option>
						<option value="7">laydate</option>
						<option value="8">laypage</option>
						<option value="9">flow</option>
						<option value="10">util</option>
			        </select>
			        <i class="layui-icon">&#xe615;</i>
			    </div>
			    <!-- 天气信息 -->
			    <div class="weather" pc>
			    	<div id="tp-weather-widget"></div>
					<script>(function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.seniverse.com/widget/chameleon.js"))</script>
					<script>tpwidget("init", {
					    "flavor": "slim",
					    "location": "WX4FBXXFKE4F",
					    "geolocation": "enabled",
					    "language": "zh-chs",
					    "unit": "c",
					    "theme": "chameleon",
					    "container": "tp-weather-widget",
					    "bubble": "disabled",
					    "alarmType": "badge",
					    "color": "#FFFFFF",
					    "uid": "U9EC08A15F",
					    "hash": "039da28f5581f4bcb5c799fb4cdfb673"
					});
					tpwidget("show");</script>
			    </div>
			    <!-- 顶部右侧菜单 -->
			    <ul class="layui-nav top_menu">
			    	<li class="layui-nav-item showNotice" id="showNotice" pc>
						<a href="javascript:;"><i class="iconfont icon-gonggao"></i><cite>系统公告</cite></a>
					</li>
			    	<li class="layui-nav-item" mobile>
			    		<a href="javascript:;" class="mobileAddTab" data-url="page/user/changePwd.html"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>设置</cite></a>
			    	</li>
			    	<li class="layui-nav-item" mobile>
			    		<a href="page/login/login.html" class="signOut"><i class="iconfont icon-loginout"></i> 退出</a>
			    	</li>
					<li class="layui-nav-item lockcms" pc>
						<a href="javascript:;"><i class="iconfont icon-lock1"></i><cite>锁屏</cite></a>
					</li>
					<li class="layui-nav-item" pc>
						<a href="javascript:;">
						<c:if test="${user!=null }">
							<img src="images/face.jpg" class="layui-circle" width="35" height="35">
							<cite>${user.username}</cite>
						</c:if>
						<c:if test="${user==null }">
							<img src="images/face.jpg" class="layui-circle" width="35" height="35">
							<cite>游客</cite>
						</c:if>
						</a>
						<dl class="layui-nav-child">
							<dd><a href="javascript:;" data-url="${prc }/user.do?toUserInfo"><i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i><cite>个人资料</cite></a></dd>
							<dd><a href="javascript:;" data-url="${prc }/user.do?toChangePwd"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>修改密码</cite></a></dd>
							<dd><a href="javascript:;" class="changeSkin"><i class="iconfont icon-huanfu"></i><cite>更换皮肤</cite></a></dd>
							<dd><a href="${prc }/user.do?toLogin" class="signOut"><i class="iconfont icon-loginout"></i><cite>注销</cite></a></dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<!-- 左侧导航 -->
		<div class="layui-side layui-bg-black">
			<div class="user-photo">
				<a class="img" title="我的头像" ><img src="images/face.jpg"></a>
				<c:if test="${user!=null }">
					<p>你好！<span class="userName">${user.username }</span>, 欢迎登录</p>
				</c:if>
				<c:if test="${user==null }">
					<p>你好！<span class="userName">游客</span>, 欢迎登录</p>
				</c:if>
				
			</div>
			<div class="navBar layui-side-scroll">
				<ul class="layui-nav layui-nav-tree">
					<li class="layui-nav-item layui-this">
						<a href="javascript:;" data-url="portal.do?toIndex">
						<i class="iconfont icon-computer" data-icon="icon-computer"></i>
						<cite>后台首页</cite>
						</a>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;" data-url="book.do?toList">
						<i class="iconfont"></i>
						<cite>图书管理</cite></a>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;" data-url="user.do?toListUser">
						<i class="iconfont"></i>
						<cite>用户管理</cite></a>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;" data-url="page/links/linksList.html">
						<i class="layui-icon" data-icon=""></i>
						<cite>友情链接</cite></a>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;" data-url="page/systemParameter/systemParameter.html">
						<i class="layui-icon" data-icon=""></i>
						<cite>系统基本参数</cite></a>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;"><i class="layui-icon" data-icon=""></i>
						<cite>其他页面</cite><span class="layui-nav-more"></span></a>
						<dl class="layui-nav-child">
							<dd><a href="javascript:;" data-url="page/404.html">
								<i class="layui-icon" data-icon=""></i>
								<cite>404页面</cite></a>
							</dd>
							<dd><a href="javascript:;" data-url="page/login/login.html" target="_blank">
								<i class="layui-icon" data-icon=""></i>
								<cite>登录</cite></a>
							</dd>
						</dl>
					</li>
					<span class="layui-nav-bar" style="top: 68px; height: 0px; opacity: 0;"></span>
				</ul>
			
			</div>
		</div>
		<!-- 右侧内容 -->
		<div class="layui-body layui-form">
			<div class="layui-tab marg0" lay-filter="bodyTab" id="top_tabs_box">
				<ul class="layui-tab-title top_tab" id="top_tabs">
					<li class="layui-this" lay-id=""><i class="iconfont icon-computer"></i> <cite>后台首页</cite></li>
				</ul>
				<ul class="layui-nav closeBox">
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="iconfont icon-caozuo"></i> 页面操作</a>
				    <dl class="layui-nav-child">
					  <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
				      <dd><a href="javascript:;" class="closePageOther"><i class="iconfont icon-prohibit"></i> 关闭其他</a></dd>
				      <dd><a href="javascript:;" class="closePageAll"><i class="iconfont icon-guanbi"></i> 关闭全部</a></dd>
				    </dl>
				  </li>
				</ul>
				<div class="layui-tab-content clildFrame">
					<div class="layui-tab-item layui-show">
						<iframe src="page/main.html"></iframe>
					</div>
				</div>
			</div>
		</div>
		<!-- 底部 -->
		<div class="layui-footer footer">
			<p>copyright @2017 派大星       <a onclick="donation()" class="layui-btn layui-btn-danger layui-btn-small">捐赠作者</a></p>
		</div>
	</div>
	
	<!-- 移动导航 -->
	<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
	<div class="site-mobile-shade"></div>

	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/leftNav.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
</body>
</html>