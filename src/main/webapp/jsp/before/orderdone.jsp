<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>订单完成</title>
<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/before/common.css" rel="stylesheet" type="text/css" />
<link href="css/before/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	//确定按钮
	function gogo() {
		window.location.href="jsp/before/paydone.jsp";
	}
</script>
</head>
<body>
	<div class="blank"></div>
	<div class="block clearfix">
		<!--当前位置-->
		<div class="location ared">
			当前位置：<a href="">首页</a> > 购物流程 > 生成订单
		</div>
		<div class="blank"></div>
		<div class="nFlowBox">
			<h2 style="text-align: center; height: 30px; line-height: 30px;">
				感谢您在本站购物！您的订单已提交成功， 请记住您的订单号: <font style="color: red" size='5'>${ordersn}</font>
			</h2>
			<br />
			<center>

				<form action="jsp/before/paydone.jsp" method="post" name="payForm">
					<input type="hidden" name="ordersn" value="${ordersn}" /> 
					<input
						type="hidden" name="amount" value="${amount}" /> 
						<input
						type="hidden" name="gname" value="${gname}" /> 
						<input
						type="image" src="images/before/zhifu.jpg"
						onclick="gogo()" />
				</form>
			</center>
		</div>
	</div>
</body>
</html>
