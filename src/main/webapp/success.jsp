<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
欢迎你!${userSession.getHost()}
<br>
用户名：
<shiro:principal/>

<shiro:hasRole name="admin">
	欢迎有admin角色的用户
</shiro:hasRole>
<br>
<shiro:hasRole name="student">
	欢迎有admin角色的用户！
</shiro:hasRole>

<shiro:hasPermission name="用户修改">
	欢迎有用户修改权限的用户！
</shiro:hasPermission>
</body>
</html>