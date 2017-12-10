<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../config/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>图书列表--图书馆后台管理</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${layui}/css/layui.css" media="all" />
	<link rel="stylesheet" href="${myCss}/news.css" media="all" />
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="" placeholder="请输入关键字" class="layui-input search_input">
		    </div>
		    <a class="layui-btn search_btn">查询</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加图书</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn recommend" style="background-color:#5FB878">推荐文章</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn audit_btn">审核文章</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
		</div>
	</blockquote>
	<div class="layui-form news_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="3%">
				<col width="15%">
				<col width="5%">
				<col width="5%">
				<col width="12%">
				<col width="8%">
				<col width="8%">
				<col width="8%">
				<col width="10%">
				<col width="10%">
		    </colgroup>
		    <thead>
				<tr>
					<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose"></th>
					<th>ID</th>
					<th style="text-align:left;">名称</th>
					<th>作者</th>
					<th>描述</th>
					<th>关键字</th>
					<th>浏览权限</th>
					<th>状态</th>
					<th>发布时间</th>
					<th>更新时间</th>
					<th>操作</th>
				</tr> 
		    </thead>
		    <tbody id="content"></tbody>
		</table>
	</div>
	<div id="bookPage"></div>
	<script type="text/javascript" src="${layui}/layui.js"></script>
	<script type="text/javascript" src="${myJs }/booksList.js"></script>
</body>
</html>