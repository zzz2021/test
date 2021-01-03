<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>--%>
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
<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/before/common.css" rel="stylesheet" type="text/css" />
<link href="css/before/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="h-ui/static/h-ui.admin/js/provide.js"></script>
<script type="text/javascript">
	//刷新验证码
	function refreshCode() {
		document.getElementById("code").src = "validateCode?" + Math.random();
	}
	//表单验证
	function checkForm() {
		var bpwd = document.registerForm.bpwd.value;
		var rebpwd = document.registerForm.rebpwd.value;
		if (bpwd != rebpwd) {
			alert("两次密码不一致！");
			return false;
		}
		document.registerForm.submit();
		return true;
	}
</script>
</head>
<body>
	<div class="clearfix">
		<div class="blank20"></div>
		<div class="box4">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="100%" valign="bottom">
						<h2>普通会员注册</h2>
					</td>
				</tr>
			</table>
		</div>
		<div class="blank10"></div>
		<div class="box4">
			<div class="case_ll clearfix">
				<div class="regist">
					<form action="/pet/BUserRegisterServlet" method="post">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="ttbb2">
							<tr>
								<td width="16%" align="right"><span class="cl_f30">*</span>
									用户名：</td>
								<td width="59%"><input type="text" name="bname"
									id="textfield" class="my_txt_350" value="" /></td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
							</tr>
							<tr>
								<td width="16%" align="right">E-mail：</td>
								<td width="59%"><input type="text" name="bemail" id="email"
									class="my_txt_350" /></td>
								<%--<td width="25%">${msg }</td>--%>
								<td width="25%"></td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td colspan="2" style="font-size: 12px; padding-bottom: 25px;">
									（请输入有效的Email地址。）</td>
							</tr>
							<tr>
								<td align="right"><span class="cl_f30">*</span> 密码：</td>
								<td><input type="password" name="bpwd" id="textfield2"
									class="my_txt_350" /></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td colspan="2" style="font-size: 12px; padding-bottom: 25px;">
									（为了您帐户的安全，建议使用字符+数字等多种不同类型的组合，且长度大于5位。）</td>
							</tr>
							<tr>
								<td align="right"><span class="cl_f30">*</span> 重复密码：</td>
								<td><input type="password" name="rebpwd" id="textfield3"
									class="my_txt_350" /></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td colspan="2" style="font-size: 12px; padding-bottom: 25px;">
									（确保您记住密码。）</td>
							</tr>
							<tr>
								<td width="16%" align="right"><span class="cl_f30">*</span>
									电话：</td>
								<td width="59%"><input type="text" name="phone" id="phone"
									class="my_txt_350" value="" /></td>
								<td><label class="errorClass" id="phoneError"></label></td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
							</tr>
							<tr>
								<td width="16%" align="right">地址：</td>
								<td>
									<div>
										<select id="cmbProvince" name="cmbProvince"></select>
										<select id="cmbCity" name="cmbCity"></select>
										<select id="cmbArea" name="cmbArea"></select>
									</div>
								</td>
								<td><label class="errorClass" id=""></label></td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
							</tr>
							<tr>
								<td width="16%" align="right">性别：</td>
								<td><input name="sex" type="radio" id="sex-1" value="1"
									checked> <label for="sex-1">男</label> <input
									type="radio" id="sex-2" name="sex" value="0" > <label
									for="sex-2">女</label></td>
								<td><label class="errorClass" id="addrError"></label></td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
							</tr>
							<tr>
								<td align="right"><span class="cl_f30">*</span> 验证码：</td>
								<td class="ared"><input type="text" name="code"
									id="textfield5" class="my_txt_120" /> <img id="code"
									src="validateCode" /> <a href="javascript:refreshCode();"><font
										color="blue">看不清，换一个！</font></a></td>
								<td>${codeError}</td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td colspan="2" class="cl_f30"
									style="font-size: 12px; padding-bottom: 25px;"></td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td height="50"><input type="button" name="button"
									id="button" onclick="checkForm()" value="注册账号" class="my_ann1" /></td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</form>
					<div class="blank20"></div>
				</div>
			</div>
		</div>
		<div class="blank10"></div>
	</div>
	<%--<script type="text/javascript"
		src="<%=basePath%>/h-ui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript">
		addressInit('cmbProvince', 'cmbCity', 'cmbArea');
	</script>--%>
</body>
</html>
