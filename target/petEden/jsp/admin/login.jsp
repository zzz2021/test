<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="screen" href="css/admin/style.css">
<link rel="stylesheet" type="text/css" href="css/admin/reset.css">
<title>后台登录</title>
<style type="text/css">
table {
	text-align: center;
}

.textSize {
	width: 120px;
	height: 25px;
}

* {
	margin: 0px;
	padding: 0px;
}

body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	margin: 10px 10px auto;
	background-image: url(images/admin/bb.jpg);
}
</style>
<script type="text/javascript">
	//确定按钮
	function gogo(){
		document.forms[0].submit();
	}
	//取消按钮
	function cancel(){
		document.forms[0].action = "";
	}
	</script>
</head>
<body>
<div class="login" style="display: block;">
	<center>
		<form action="pet/BUserLoginServlet" method="post" name = "loginform">
			<table>
				<tr>
					<td colspan="2"><img src="images/admin/login.gif"></td>
				</tr>
				<tr>
					<td>用户名：</td>
					<td><input type="text" name="bname"  class="textSize"/></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" name="bpwd" class="textSize"/></td>
				</tr>
				<tr>
					<td>验证码：</td>
					<td><input type="text" name="code" class="textSize"/></td>
				</tr>
				<tr>
					<td>
						<img id="code" src="validateCode"/>
					</td>
					<td class="ared">
						<a href="javascript:refreshCode();"><font color="blue">看不清，换一个！</font></a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="image" src="images/admin/ok.gif" onclick="gogo()">
						<input type="image" src="images/admin/cancel.gif" onclick="cancel()">
					</td>
				</tr>
			</table>
		</form>
		${msg }
	</center>
</body>
</html>
