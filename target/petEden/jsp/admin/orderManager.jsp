<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
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
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>订单列表</title>
<script type="text/javascript">
	function datadel() {
		if (confirm("您确定要删除吗")) {
			var form = document.getElementById("myform");
			form.submit();
		}
	}
	function checkDel(id){
			if(window.confirm("是否删除该订单？")){
				window.location.href="/petManagement/adminOrder/deleteorderManager?id="+id;
			}
		}
</script>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		订单查询<span class="c-gray en">&gt;</span> 订单列表 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<form action="adminOrder/schByDate" method="POST">
				<input type="hidden" name="action" value="schByDate"> 日期范围：
				<input type="text"
					onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })"
					id="datemin" class="input-text Wdate" style="width: 120px;"
					name="dateFrom"> - <input type="text"
					onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })"
					id="datemax" class="input-text Wdate" style="width: 120px;"
					name="dateTo">
				<button type="submit" class="btn btn-success" id="" name="">
					<i class="Hui-iconfont">&#xe665;</i> 搜记录
				</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onclick="datadel()"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a></span> <span class="r">共有数据：<strong>${requestScope.count}</strong>
				条
			</span>
		</div>
		<div class="mt-20">
			<form action="/petManagement/adminOrder/deleteOrders?id=${o.id}" method="POST" id="myform">
			<input type="hidden" name="action" value="delOrders">
				<table
					class="table table-border table-bordered table-hover table-bg table-sort"
					style="border-bottom: 1px solid #d0d0d0; border-left: 1px solid #d0d0d0">
					<thead>
						<tr class="text-c">
							<th width="25"><input type="checkbox" name="" value=""></th>
							<th width="80">订单ID</th>
							<th width="100">购买用户</th>
							<th width="90">下单日期</th>
							<th width="130">订单状态</th>
							<th width="100">总价</th>
							<th width="60">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList}" var="o" varStatus="os">
							<tr class="text-c">
								<td><input type="checkbox" value="${o.id}"
									name="checkedOrders"></td>
								<td>${o.id}</td>
								<td>${o.busertable_id}</td>
								<td>${o.orderdate}</td>
								<td><c:if test="${o.status == 0}" >未付款</c:if><c:if test="${o.status == 1}" >已付款</c:if></td>
								<td>${o.amount}</td>
								<td class="f-14"><a href="javaScript:checkDel('${o.id}')" style="text-decoration: none">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr class="text-c">
							<td colspan="6" align="center">总页数：${totalPage }
								&nbsp;&nbsp;&nbsp;&nbsp; 当前页：${currentPage }
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="<%=request.getContextPath()%>/adminOrder/orderInfo?currentPage=${currentPage-1 }">上一页</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="<%=request.getContextPath()%>/adminOrder/orderInfo?currentPage=${currentPage+1 }">下一页</a>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript"
		src="h-ui/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="h-ui/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="h-ui/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="h-ui/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="<%=basePath%>/h-ui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="h-ui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="h-ui/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript" src="h-ui/lib/My97DatePicker/4.8/lang/zh-cn.js"></script>
	<script type="text/javascript">
		function member_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}

		/*用户-删除*/
		function user_del(obj, id) {
			layer.confirm('确认要删除吗？', function(index) {
				$.ajax({
					type : 'POST',
					url : '',
					dataType : 'json',
					success : function(data) {
						$(obj).parents("tr").remove();
						layer.msg('已删除!', {
							icon : 1,
							time : 1000
						});
					},
					error : function(data) {
						console.log(data.msg);
					},
				});
			});
		}
	</script>
</body>
</html>