<%@ page import="com.dao.GoodsTypeDAO" %>
<%@ page import="com.bean.GoodsType" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="h-ui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="h-ui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="h-ui/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="h-ui/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="h-ui/static/h-ui.admin/css/style.css" />
	<style type="text/css">
		table{
			text-align: center;
			border-collapse: collapse;
		}
		.bgcolor{
		  	background-color: #F08080;
		}
		.input{
			width:200px;	
		}
	</style>
</head>
<body>
<%
	GoodsTypeDAO goodsTypeDAO=new GoodsTypeDAO();
	List<GoodsType> goodsType=goodsTypeDAO.getGoodsTypeList();
	request.setAttribute("allTypes",goodsType);
%>
	<c:if test="${allTypes.size() == 0 }">
		您还没有类型。
	</c:if>
	<c:if test="${allTypes.size() != 0 }">
		<table style="border-bottom: 1px solid #d0d0d0; border-left: 1px solid #d0d0d0;"
				class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
			<tr class="text-c">
				<th width="200px">类型ID</th>
				<th width="400px">类型名称</th>
				<th width="350px">操作<th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${allTypes }" var="goodsType">
				<tr class="text-c">
					<td>${goodsType.id }</td>
					<td>${goodsType.typename }</td>
					<td class="td-manage"><a class="ml-5" style="text-decoration: none" href="/pet/DeleteTypeServlet?id=${goodsType.id }"><i class="Hui-iconfont">&#xe6e2;</i></a>
				</tr>
			</c:forEach>
			</tbody>
			<tfoot>
			<td colspan="3">${msg }</td>
			</tfoot>
		</table>
	</c:if>
	<form action="/pet/AddTypeServlet" method="post">
		类型名称：
		<input type="text" name="typename" class="input"/>
		&nbsp;&nbsp;
		<input type="submit" value="添加" class="btn btn-primary radius"/>
	</form>
</body>
</html>