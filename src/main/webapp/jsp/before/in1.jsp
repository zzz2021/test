<%@ page import="com.bean.BUser" %>
<%@ page import="com.dao.FocusDAO" %>
<%@ page import="com.bean.Focus" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.BUserDAO" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
</head>
<body>
<%
    String str="1";
    int number=Integer.parseInt(str);

%>
<%
    BUserDAO userDAO=new BUserDAO();
    List<BUser> users=userDAO.getBUserList();
    request.setAttribute("count",users.size());
    request.setAttribute("userList",users);
%>
该数的平方为：<%=number*number %> <hr>

<c:forEach var="mf" items="${userList}">
    <tr>
        <td bgcolor="#ffffff" align="center">${mf.bid}</td>
        <td bgcolor="#ffffff"  align="center">${mf.bname}</td>
    </tr>
</c:forEach>

</body>
</html>