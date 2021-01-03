<%@ page import="com.dao.BUserDAO" %>
<%@ page import="com.bean.BUser" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>用户管理</title>
<script type="text/javascript">
	function delUser(id) {
		if (confirm("确定要删除吗？")) {
			window.location.href = "/pet/DeleteBUserByBidServlet?id="+id;
		}
	}
	function datadel() {
		if (confirm("您确定要删除吗")) {
			var form = document.getElementById("myform");
			form.submit();
		}
	}
</script>
</head>
<body>
<%
	int pageSize=5;
	String curp=request.getParameter("currentPage");
	int currentPage=0;
	if(curp==null){
		currentPage=1;
	}else{
		currentPage=Integer.parseInt(curp);
	}
	BUserDAO userDAO=new BUserDAO();
	List<BUser> users=userDAO.getBUserListByPage(currentPage,pageSize);
	int totalPage=0;
	List<BUser> us=userDAO.getBUserList();
	totalPage=us.size()%pageSize==0?us.size()/pageSize:us.size()/pageSize+1;
	//6、上一页beforePage
	Integer beforePage=currentPage-1<=0?1:currentPage-1;
	//7、上一页afterPage
	Integer afterPage=currentPage+1>=totalPage?totalPage:currentPage+1;
	request.setAttribute("count",us.size());
	request.setAttribute("totalPage",totalPage);
	request.setAttribute("userList",users);
	request.setAttribute("currentPage",currentPage);
	request.setAttribute("beforePage",beforePage);
	request.setAttribute("afterPage",afterPage);
%>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onclick="datadel()"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a> <a href="javascript:;"
				onclick="member_add('添加用户','jsp/admin/addUser.jsp','','510')"
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
					添加用户</a></span> <span class="r">共有数据：<strong>${count}</strong>
				条
			</span>
		</div>
		<div class="mt-20">
			<form action="/pet/DeleteAllBUserServlet" method="POST" id="myform">
				<input type="hidden" name="action" value="delUsers">
				<table
					style="border-bottom: 1px solid #d0d0d0; border-left: 1px solid #d0d0d0"
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="25"><input type="checkbox" name=""
								value=""></th>
							<th width="80">用户ID</th>
							<th width="100">用户名</th>
							<th width="40">邮箱</th>
							<th width="90">电话</th>
							<th width="90">地址</th>
							<th width="100">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList}" var="u" varStatus="vs">
							<tr class="text-c">
								<td><input type="checkbox" value="${u.bid}" name="checkedUsers" id=delUsers></td>
								<td>${u.bid}</td>
								<td>${u.bname}</td>
								<td>${u.bemail}</td>
								<td>${u.phone}</td>
								<td>${u.address}</td>
								<td class="td-manage"><a title="编辑" href="javascript:;"
									onclick="member_edit('用户编辑','jsp/admin/editUser.jsp?bname=${u.bname}','2','800','500')"
									class="ml-5" style="text-decoration: none"> <i
										class="Hui-iconfont">&#xe6df;</i>
								</a> <a style="text-decoration: none" class="ml-5"
									onClick="change_password('修改密码','jsp/admin/change-password.jsp?bname=${u.bname}','10001','600','270')"
									href="javascript:;" title="修改密码"> <i class="Hui-iconfont">&#xe63f;</i>
								</a> <a title="删除" href="javascript:;"
									onclick="delUser('${u.bid}')" class="ml-5"
									style="text-decoration: none"> <i class="Hui-iconfont">&#xe6e2;</i>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr class="text-c">
							<td colspan="6" align="center">总页数：${totalPage}
								&nbsp;&nbsp;&nbsp;&nbsp; 当前页：${currentPage}
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="jsp/admin/userList.jsp?currentPage=${beforePage}">上一页</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="jsp/admin/userList.jsp?currentPage=${afterPage}">下一页</a>
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
		src="h-ui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="h-ui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="h-ui/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		/*用户-添加*/
		function member_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		/*用户-查看*/
		function member_show(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*用户-停用*/
		function member_stop(obj, id) {
			layer
					.confirm(
							'确认要停用吗？',
							function(index) {
								$
										.ajax({
											type : 'POST',
											url : '',
											dataType : 'json',
											success : function(data) {
												$(obj)
														.parents("tr")
														.find(".td-manage")
														.prepend(
																'<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
												$(obj)
														.parents("tr")
														.find(".td-status")
														.html(
																'<span class="label label-defaunt radius">已停用</span>');
												$(obj).remove();
												layer.msg('已停用!', {
													icon : 5,
													time : 1000
												});
											},
											error : function(data) {
												console.log(data.msg);
											},
										});
							});
		}

		/*用户-启用*/
		function member_start(obj, id) {
			layer
					.confirm(
							'确认要启用吗？',
							function(index) {
								$
										.ajax({
											type : 'POST',
											url : '',
											dataType : 'json',
											success : function(data) {
												$(obj)
														.parents("tr")
														.find(".td-manage")
														.prepend(
																'<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
												$(obj)
														.parents("tr")
														.find(".td-status")
														.html(
																'<span class="label label-success radius">已启用</span>');
												$(obj).remove();
												layer.msg('已启用!', {
													icon : 6,
													time : 1000
												});
											},
											error : function(data) {
												console.log(data.msg);
											},
										});
							});
		}
		/*用户-编辑*/
		function member_edit(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*密码-修改*/
		function change_password(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*用户-删除*/
		function member_del(obj, id) {
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