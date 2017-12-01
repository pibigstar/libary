<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../config/config.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>图书后台管理系统</title>
    <link rel="shortcut icon" href="${myImages}/Logo_40.png" type="image/x-icon">
    <!-- layui.css -->
    <link href="${plugin}/layui/css/layui.css" rel="stylesheet" />
    <!-- 本页样式 -->
    <link href="${myCss}/index.css" rel="stylesheet" />
    <script type="text/javascript" src="${myJs }/jquery.js"></script>
</head>
<body>
    <div class="mask"></div>
    <div class="main">
        <h1><span style="font-size: 84px;">B</span><span style="font-size:30px;">log</span></h1>
        <p id="time"></p>
        <div class="enter">
            请&nbsp;&nbsp;点击&nbsp;&nbsp;这里登录
        </div>
    </div>
    <!-- layui.js -->
    <script src="${plugin}/layui/layui.js"></script>
    <!-- layui规范化用法 -->
    <script type="text/javascript">
        layui.config({
            base: '../js/'
        }).use('login');
    </script>
</body>
</html>