<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../config/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>会员添加--layui后台管理模板</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${layui}/css/layui.css" media="all" />
	<style type="text/css">
		.layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
		@media(max-width:1240px){
			.layui-form-item .layui-inline{ width:100%; float:none; }
		}
	</style>
</head>
<body class="childrenBody">
	<form class="layui-form" style="width:80%;">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input name="username" class="layui-input" lay-verify="required" placeholder="请输入登录名">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-block">
				<input name="password" type="password" class="layui-input password" lay-verify="required" placeholder="请输入密码">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">邮箱</label>
			<div class="layui-input-block">
				<input name="email" type="text" class="layui-input" lay-verify="email" placeholder="请输入邮箱">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">手机号</label>
			<div class="layui-input-block">
				<input name="phone" class="layui-input" lay-verify="phone" placeholder="请输入手机号">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
			    <label class="layui-form-label">性别</label>
			    <div class="layui-input-block">
			      	<input type="radio" name="sex" value="男" title="男" checked>
			      	<input type="radio" name="sex" value="女" title="女">
			    </div>
		    </div>
		    <div class="layui-inline">
			    <label class="layui-form-label">年龄</label>
				<div class="layui-input-block">
					<input type="number" class="layui-input">
				</div>
		    </div>
		    <div class="layui-inline">
			    <label class="layui-form-label">会员状态</label>
				<div class="layui-input-block">
					<select name="state">
						<option value="0">未激活</option>
						<option value="1">已激活</option>
				    </select>
				</div>
		    </div>
		    
		    <div class="layui-inline">
			    <label class="layui-form-label">用户角色</label>
				<div class="layui-input-block">
					<select name="role" class="userStatus">
						<option value="1">管理员</option>
						<option value="2">学生</option>
						<option value="4">老师</option>
						<option value="3">游客</option>
				    </select>
				</div>
		    </div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">个性签名</label>
			<div class="layui-input-block">
				<textarea name="signature" class="layui-textarea"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addUser">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="${layui}/layui.js"></script>
	<script type="text/javascript" src="${myJs }/addUser.js"></script>
</body>
</html>