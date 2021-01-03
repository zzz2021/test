<%@ page import="com.dao.CartDAO" %>
<%@ page import="com.bean.Cart" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>订单详情</title>
<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/before/common.css" rel="stylesheet" type="text/css" />
<link href="css/before/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
	CartDAO cartDAO=new CartDAO();
	List<Cart> carts=cartDAO.getCartList();
	double sum=0;
	for(Cart c:carts){
		sum=sum+c.getTotal();
	}
	request.setAttribute("myOrderDetail",carts);
%>
	<div class="blank"></div>
	<div class="block clearfix">
		<div class="location ared">
			当前位置：<a href="jsp/before/index.jsp">首页</a> > 订单详情
		</div>
		<div class="blank"></div>
		<div>
			<div class="nFlowBox">
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th>商品编号</th>
						<th>商品名称</th>
						<th>商品图片</th>
						<th>商品价格</th>
						<th>购买数量</th>
					</tr>
					<tr>
						<td colspan="5" height="15px"
							style="border: 0 none; background: #FFF"></td>
					</tr> 
					<c:forEach var="mf" items="${myOrderDetail}"> 
						<tr>
							<td bgcolor="#ffffff" align="center">${mf.goods_id}</td>
							<td bgcolor="#ffffff"  align="center">${mf.goods_name}</td>
							<td align="center" bgcolor="#ffffff" height="60px"> <img
									style="width: 50px; height: 50px;"
									src="/pet/images/pet/${mf.picture}" border="0"
									title="${mf.goods_name}" /> </td>
							<td align="center" bgcolor="#ffffff">${mf.price}</td>
							<td align="center" bgcolor="#ffffff">${mf.goodsNum}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>