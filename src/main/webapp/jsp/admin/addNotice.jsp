<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--_meta 作为公共模版分离出去-->
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
<link rel="Bookmark" href="/favicon.ico">
<link rel="Shortcut Icon" href="/favicon.ico" />
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
<link href="h-ui/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>添加用户 - H-ui.admin v3.1</title>
<meta name="keywords"
	content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
<style>
.contener {
	border: 3px dashed #e6e6e6;
	height: 238px;
	width: 817px;
	font-size:18px;
}
.submit{
	margin-right:200px;
	margin-top:30px;
}
.reset{
	margin-left:200px;
	margin-top:30px;
}
</style>
</head>
<body>
	<article class="page-container">
		<form:form action="adminNotice/addNotice" method="post" modelAttribute="notice">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>标题：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<form:input path="ntitle" class="input-text" value=""
						placeholder="" id="username" name="bname"/>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>内容：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<div class="uploader-list-container">
						<div >
							<form:textarea class="contener" path="ncontent"/>
						</div>
					</div>
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="submit btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;"><input
						class="reset btn btn-primary radius" type="reset"
						value="&nbsp;&nbsp;重置&nbsp;&nbsp;">
				</div>
			</div>
		</form:form>
	</article>

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
		src="h-ui/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="h-ui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="h-ui/lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.skin-minimal input').iCheck({
				checkboxClass : 'icheckbox-blue',
				radioClass : 'iradio-blue',
				increaseArea : '20%'
			});

			$("#form-member-add").validate({
				rules : {
					username : {
						required : true,
						minlength : 2,
						maxlength : 16
					},
					sex : {
						required : true,
					},
					bpwd : {
						required : true,
					},
					bpwd2 : {
						required : true,
						equalTo : "#password",
					},
					phone : {
						required : true,
						isMobile : true,
					},
					email : {
						required : true,
						email : true,
					},
					uploadfile : {
						required : true,
					},

				},
				onkeyup : false,
				focusCleanup : true,
				success : "valid",
				submitHandler : function(form) {
					//$(form).ajaxSubmit();

					$("#form-member-add").ajaxSubmit();

					var index = parent.layer.getFrameIndex(window.name);
					//parent.$('.btn-refresh').click();
					parent.layer.close(index);
				}
			});
		});

		addressInit('cmbProvince', 'cmbCity', 'cmbArea');
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>