<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../config/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>系统基本参数--layui后台管理模板</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${layui}/css/layui.css" media="all" />
	<style type="text/css">
		.layui-table td, .layui-table th{ text-align: center; }
		.layui-table td{ padding:5px; }
	</style>
</head>
<body class="childrenBody">
	<form class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="20%">
				<col width="50%">
				<col>
		    </colgroup>
		    <thead>
		    	<tr>
		    		<th>参数说明</th>
		    		<th>参数值</th>
		    		<th>变量名</th>
		    	</tr>
		    </thead>
		    <tbody>
		    	<tr>
		    		<td>模版名称</td>
		    		<td>
		    		<input name="cmsname" class="layui-input cmsName" value="${sysInfo.cmsname }" lay-verify="required" placeholder="请输入模版名称">
		    		<input type="hidden" name="id" value="${sysInfo.id }" class="layui-input id">
		    		</td>
		    		<td>cmsName</td>
		    	</tr>
		    	<tr>
		    		<td>当前版本</td>
		    		<td><input name="version" class="layui-input version" value="${sysInfo.version }" placeholder="请输入当前模版版本"></td>
		    		<td>version</td>
		    	</tr>
		    	<tr>
		    		<td>开发作者</td>
		    		<td><input name="author" class="layui-input author" value="${sysInfo.author }"  placeholder="请输入开发作者"></td>
		    		<td>author</td>
		    	</tr>
		    	<tr>
		    		<td>网站首页</td>
		    		<td><input name="homepage" class="layui-input homePage" value="${sysInfo.homepage }"  placeholder="请输入网站首页"></td>
		    		<td>homePage</td>
		    	</tr>
		    	<tr>
		    		<td>服务器环境</td>
		    		<td><input name="server" class="layui-input server" value="${sysInfo.server }" placeholder="请输入服务器环境"></td>
		    		<td>server</td>
		    	</tr>
		    	<tr>
		    		<td>数据库版本</td>
		    		<td><input name="database" class="layui-input dataBase" value="${sysInfo.database }" placeholder="请输入数据库版本"></td>
		    		<td>dataBase</td>
		    	</tr>
		    	<tr>
		    		<td>最大上传限制</td>
		    		<td><input name="maxupload" class="layui-input maxUpload" value="${sysInfo.maxupload }" placeholder="请输入最大上传限制"></td>
		    		<td>maxUpload</td>
		    	</tr>
		    	<tr>
		    		<td>用户权限</td>
		    		<td><input name="userrights" class="layui-input userRights" value="${sysInfo.userrights }" placeholder="请输入当前用户权限"></td>
		    		<td>userRights</td>
		    	</tr>
		    	<tr>
		    		<td>默认关键字</td>
		    		<td><input name="keywords" class="layui-input keywords" value="${sysInfo.keywords }" placeholder="请输入默认关键字"></td>
		    		<td>keywords</td>
		    	</tr>
		    	<tr>
		    		<td>版权信息</td>
		    		<td><input name="powerby"  class="layui-input powerby" value="${sysInfo.powerby }" placeholder="请输入网站版权信息"></td>
		    		<td>powerby</td>
		    	</tr>
		    	<tr>
		    		<td>网站描述</td>
		    		<td><textarea placeholder="请输入网站描述" name="description" class="layui-textarea description">${sysInfo.description }</textarea></td>
		    		<td>description</td>
		    	</tr>
		    	<tr>
		    		<td>网站备案号</td>
		    		<td><input name="record" value="${sysInfo.record }" class="layui-input record" placeholder="请输入网站备案号"></td>
		    		<td>record</td>
		    	</tr>
		    </tbody>
		</table>
		<div class="layui-form-item" style="text-align: right;">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="systemParameter">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="${layui}/layui.js"></script>
	<script type="text/javascript" src="${myJs }/systemParameter.js"></script>
</body>
</html>