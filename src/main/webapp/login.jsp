
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<html>
<head>
   <base href="<%=basePath%>">
    <title>登录页面</title>
    <link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
    <link href="css/before/common.css" rel="stylesheet" type="text/css" />
    <link href="css/before/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        table{
            text-align: center;
        }
        .textSize{
            width: 200px;
            height: 20px;
        }
    </style>
    <script type="text/javascript">
        //确定按钮
        function gogo(){
            document.loginform.submit();
        }
        //取消按钮
        function cancel(){
            document.loginform.action="";
        }
        function refreshCode(){
            document.getElementById("code").src = "validateCode?" + Math.random();
        }
        function myReload() {
            document.getElementById("CreateCheckCode").src = document
                    .getElementById("CreateCheckCode").src
                + "?nocache=" +  Math.random();
            window.location.href = "jsp/before/login.jsp";
        }
    </script>
</head>
<body>
<center>
    <form action="/pet/BUserLoginServlet" method="get">
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
                    <img id="CreateCheckCode" src="/pet/PictureCheckCode"/>
                </td>
                <td class="ared">
                    <a href="javascript:myReload();"><font color="blue">看不清，换一个！</font></a>
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
</center>
</body>
</html>
