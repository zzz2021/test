<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>欢迎界面</title>
	<style type="text/css">
	body {
    background: url(/pet/images/zhu.jpg);
}

.font {
    color: black;
    text-align: center;
    font-size: 80px;
	style:华文行楷;
}
	</style>
</head>
<body>
<div class="header">
</div>
<div class="font">
	<br>
	<br>
	<br>
	欢迎登陆
	<br>
	宠物乐园管理系统
</div>
</body>
</html>