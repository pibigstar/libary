<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../config/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>友情链接添加--图书馆管理模板</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${layui}/css/layui.css" media="all" />
</head>
<body class="childrenBody">
	<form class="layui-form" style="width:80%;">
		<div class="layui-form-item">
			<label class="layui-form-label">网站名称</label>
			<div class="layui-input-block">
				<input type="text" name="linkName" class="layui-input linksName" lay-verify="required" placeholder="请输入网站名称">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">网站地址</label>
			<div class="layui-input-block">
				<input type="tel" name="linkUrl" class="layui-input linksUrl" lay-verify="required|url" placeholder="请输入网站地址">
			</div>
		</div>
		<div class="layui-form-item">
				<label class="layui-form-label">展示位置</label>
				<div class="layui-input-block">
					<input type="text" name="showLocation" class="layui-input showLocation" lay-verify="required" placeholder="请输入展示位置">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">发布时间</label>
			<div class="layui-input-inline">
				<input type="text" name="createTime" class="layui-input linksTime" lay-verify="date" onclick="layui.laydate({elem:this})">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">站长邮箱</label>
			<div class="layui-input-block">
				<input type="text" name="linkEmail" class="layui-input masterEmail" lay-verify="email" placeholder="请输入网站地址">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addLinks">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="${layui}/layui.js"></script>
	<script type="text/javascript" src="${prc }/linksAdd.js"></script>
</body>
</html>