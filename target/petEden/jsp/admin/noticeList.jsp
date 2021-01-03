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
<title>公告列表</title>
<script type="text/javascript">
function checkDel(id){
		if(window.confirm("是否删除该公告？")){
			window.location.href = "/petManagement/adminNotice/deleteNotice?id="+id;
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
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		公告管理 <span class="c-gray en">&gt;</span> 公告列表 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onclick="datadel()"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a> <a class="btn btn-primary radius"
				onclick="picture_add('添加公告','adminNotice/toAddNotice')"
				href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加公告</a> </span> <span
				class="r">共有数据：<strong>${requestScope.count}</strong> 条
			</span>
		</div>
		<div class="mt-20">
			<form action="/petManagement/adminNotice/deleteNotices?id=${n.id}" method="POST"
				id="myform">
				<input type="hidden" name="action" value="delPets">
				<table
					style="border-bottom: 1px solid #d0d0d0; border-left: 1px solid #d0d0d0;"
					class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th width="40"><input name="checked" type="checkbox" value=""></th>
							<th width="200">公告ID</th>
							<th width="250">标题</th>
							<th>时间</th>
							<th width="60">发布状态</th>
							<th width="200">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${allNotices}" var="n" varStatus="vs">
							<tr class="text-c">
								<td><input type="checkbox" value="${n.id}"
									name="checked" id=delUsers></td>
								<td>${n.id}</td>
								<td>${n.ntitle}</td>
								<td>${n.ntime}</td>
								<td class="td-status"><span
									class="label label-success radius">已发布</span></td>
								<td class="td-manage"><a style="text-decoration: none"
									onClick="picture_stop(this,'10001')" href="javascript:;"
									title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> <a
									style="text-decoration: none" class="ml-5"
									onClick="detail('公告详情','adminNotice/selectANotice?id=${n.id }','2','800','500')"
									href="javascript:;" title="详情">详情</a> <a
									style="text-decoration: none" class="ml-5"
									onClick="checkDel('${n.id }')" href="javascript:;" title="删除"><i
										class="Hui-iconfont">&#xe6e2;</i></a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr class="text-c">
							<td colspan="6" align="center">总页数：${totalPage }
								&nbsp;&nbsp;&nbsp;&nbsp; 当前页：${currentPage }
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="adminNotice/deleteNoticeSelect?currentPage=${currentPage-1 }">上一页</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="adminNotice/deleteNoticeSelect?currentPage=${currentPage+1 }">下一页</a>
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
		/*图片-添加*/
		function picture_add(title, url) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}

		/*图片-查看*/
		function picture_show(title, url, id) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}

		/*图片-审核*/
		function picture_shenhe(obj, id) {
			layer
					.confirm(
							'审核文章？',
							{
								btn : [ '通过', '不通过' ],
								shade : false
							},
							function() {
								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a class="c-primary" onClick="picture_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-success radius">已发布</span>');
								$(obj).remove();
								layer.msg('已发布', {
									icon : 6,
									time : 1000
								});
							},
							function() {
								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a class="c-primary" onClick="picture_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-danger radius">未通过</span>');
								$(obj).remove();
								layer.msg('未通过', {
									icon : 5,
									time : 1000
								});
							});
		}

		/*图片-下架*/
		function picture_stop(obj, id) {
			layer
					.confirm(
							'确认要下架吗？',
							function(index) {
								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a style="text-decoration:none" onClick="picture_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-defaunt radius">已下架</span>');
								$(obj).remove();
								layer.msg('已下架!', {
									icon : 5,
									time : 1000
								});
							});
		}

		/*图片-发布*/
		function picture_start(obj, id) {
			layer
					.confirm(
							'确认要发布吗？',
							function(index) {
								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a style="text-decoration:none" onClick="picture_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-success radius">已发布</span>');
								$(obj).remove();
								layer.msg('已发布!', {
									icon : 6,
									time : 1000
								});
							});
		}

		/*图片-申请上线*/
		function picture_shenqing(obj, id) {
			$(obj).parents("tr").find(".td-status").html(
					'<span class="label label-default radius">待审核</span>');
			$(obj).parents("tr").find(".td-manage").html("");
			layer.msg('已提交申请，耐心等待审核!', {
				icon : 1,
				time : 2000
			});
		}

		/*图片-编辑*/
		function detail(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}

		/*图片-删除*/
		function picture_del(obj, id) {
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