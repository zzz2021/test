<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.bean.GoodsType" %>
<%@ page import="com.dao.GoodsTypeDAO" %>
<%@ page import="com.bean.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bean.BUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <title>首页</title>
    <link href="css/before/daohang.css" rel="stylesheet" type="text/css"/>
    <link href="css/before/common.css" rel="stylesheet" type="text/css"/>
    <link href="css/before/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        function clearValue() {
            document.myForm.mykey.value = "";
        }
    </script>
</head>
<body>
<div class="all_zong">
    <!--最上面 灰色条部分-->
    <div class="all_zong_top">
        <div class="all_zong_top_right a8c">
            <table border="0" cellspacing="0" cellpadding="0" class="main_login">
                <tr>
                    <td>
                        <p id="content">
                           <c:if test="${bruser!=null}">欢迎 ${bruser.bname }</c:if>
                                <c:if test="${bruser==null}"><a href="jsp/before/login.jsp">登录</a></c:if>
                        </p>
                    </td>
                    <td>
                        <p>
                            <a href="jsp/before/register.jsp">注册</a>
                        </p>
                    </td>
                    <td><span class="xx">|</span><a href="jsp/before/userCenter.jsp">用户中心</a><span
                            class="xx">|</span></td>
                    <!-- 没有登录 -->
                    <c:if test="${bruser!= null}">
                        <td><a href="/pet/FirstServlet">退出</a><span
                                class="xx">|</span></td>
                    </c:if>
                </tr>
            </table>
        </div>
    </div>
    <!--end-->
    <!--logo 搜索-->
    <div class="all_zong_logo">
        <div class="all_zong_logo2">
            <img src="images/before/mylogo2.png"/>
        </div>
        <div class="back_search">
            <div class="back_search_red">
                <form action="/pet/SearchGoodsServlet" name="myForm" method="post">
                    <div class="div2">
                        <input type="text" name="mykey" class="txt" value="请输入您要查询的内容" onfocus="clearValue()"/>
                    </div>
                    <div class="div1">
                        <input type="submit" class="an" value="搜索"/>
                    </div>
                </form>
            </div>
        </div>
        <!--end-->
    </div>
    <!--红色 导航-->
    <div class="skin_a">
        <div class="front_daohangbj">
            <div class="all_zong">
                <div class="front_daohang">
                    <ul>
                        <li class="backbj"><a href="jsp/before/index.jsp">首页</a></li>
                        <%
                            GoodsTypeDAO goodsTypeDAO=new GoodsTypeDAO();
                            List<GoodsType> goodsType=goodsTypeDAO.getGoodsTypeList();
                           request.setAttribute("goodsType",goodsType);
                        %>
                        <c:forEach items="${goodsType}" var="g">
                            <li><a href="jsp/before/goodsType.jsp?id=${g.id }">
                                    ${g.typename }</a>
                            </li>
                        </c:forEach>
                        <li class="buy">
                            <p class="car">
                                <a href="jsp/before/cart.jsp">购物车</a>
                            </p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--红色 导航 end-->
</div>
</body>
</html>
