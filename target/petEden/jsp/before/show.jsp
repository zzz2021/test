<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.bean.GoodsType" %>
<%@ page import="com.dao.GoodsTypeDAO" %>
<%@ page import="com.bean.Goods" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
＜p＞${100 % 100}＜/p＞
34253
<%--<%
    GoodsTypeDAO goodsTypeDAO=new GoodsTypeDAO();
    List<GoodsType> goodsType=goodsTypeDAO.getGoodsTypeList();
   // GoodsType goodsType=new GoodsType(1,"sddsvs");
    request.setAttribute("goodsType",goodsType);
%>--%>
<%--<c:if test="${goodsType!=null}">欢迎 ${goodsType.typename }</c:if>--%>
<c:forEach items="${goodsType}" var="g">
    <li><a>
            ${g.typename }</a>
    </li>
</c:forEach>

</body>
</html>
