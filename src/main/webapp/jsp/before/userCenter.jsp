<%@ page import="com.dao.FocusDAO" %>
<%@ page import="com.bean.Focus" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.OrderDAO" %>
<%@ page import="com.bean.Order" %>
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
<title>用户中心</title>
<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/before/common.css" rel="stylesheet" type="text/css" />
<link href="css/before/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
	FocusDAO focusDAO=new FocusDAO();
	OrderDAO orderDAO=new OrderDAO();
	List<Focus> focusList=focusDAO.getfocusList();
	List<Order> orderList=orderDAO.getOrderList();
	request.setAttribute("myOrder",orderList);
	request.setAttribute("myFocus",focusList);
%>
	<div class="blank"></div>
	<div class="block clearfix">
		<div class="location ared">
			我的订单
		</div>
		<div class="blank"></div>
		<div>
			<div class="nFlowBox">
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th>订单编号</th>
						<th>订单金额</th>
						<th>订单日期</th>
						<th>订单状态</th>
						<th>详情</th>
					</tr>
					<tr>
						<td colspan="5" height="15px"
							style="border: 0 none; background: #FFF"></td>
					</tr> 
					<c:forEach var="mo" items="${myOrder}"> 
						<tr>
							<td bgcolor="#ffffff" align="center">${mo.id}</td>
							<td bgcolor="#ffffff"  align="center">${mo.count}</td>
							<td align="center" bgcolor="#ffffff">${mo.ordate}</td>
							<td bgcolor="#ffffff"  align="center">
							<c:if test="${mo.state == 0}" >
							未付款&nbsp;&nbsp;
							<a style="text-decoration: none;" class="f6" href="jsp/before/orderconfirm.jsp">去支付</a>
							</c:if>
							<c:if test="${mo.state == 1}" >已付款</c:if>
							</td>
							<td align="center" bgcolor="#ffffff">
							<a style="text-decoration: none;" class="f6" href="jsp/before/userOrderDetail.jsp?id=${mo.g_id}" target="_blank">详情</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="location ared">
			我的关注
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
						<th>去看看</th>
					</tr>
					<tr>
						<td colspan="5" height="15px"
							style="border: 0 none; background: #FFF"></td>
					</tr> 
					<c:forEach var="mf" items="${myFocus}"> 
						<tr>
							<td bgcolor="#ffffff" align="center">${mf.gid}</td>
							<td bgcolor="#ffffff"  align="center">${mf.gname}</td>
							<td align="center" bgcolor="#ffffff" height="60px"> <img
									style="width: 50px; height: 50px;"
									src="/pet/images/pet/${mf.gpicture}" border="0"
									title="${mf.gname}" /> </td>
							<td align="center" bgcolor="#ffffff">${mf.gprice}</td>
							<td align="center" bgcolor="#ffffff">
								<a style="text-decoration: none;" class="f6" href="jsp/before/goodsdetail.jsp?id=${mf.gid}">去看看</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>