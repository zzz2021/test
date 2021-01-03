<%@ page import="com.dao.CartDAO" %>
<%@ page import="com.bean.Cart" %>
<%@ page import="java.util.List" %>
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
<title>订单确认</title>
<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/before/common.css" rel="stylesheet" type="text/css" />
<link href="css/before/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function submitorder(sum,cart){
		if(window.confirm("是否真的提交订单，提交后不可再修改订单信息！")){
			window.location.href="/pet/OrderServlet?amount=" + sum+"&cart="+cart;
			return true;
		}
		return false;
	}
</script> 
</head>
  <body>
  <%
      CartDAO cartDAO=new CartDAO();
      List<Cart> carts=cartDAO.getCartList();
      double sum=0;
      for(Cart c:carts){
          sum=sum+c.getTotal();
      }
      request.setAttribute("cart",carts.get(0));
      request.setAttribute("cartlist",carts);
      request.setAttribute("sum",sum);
  %>
	<div class="blank"></div>
	<div class="block clearfix"><!--当前位置-->
	<div class="location ared">当前位置：<a href="">首页</a> > 购物流程 > 确认订单信息</div>
	<div class="blank"></div>
			<div class="nFlowBox">
   <form action="" method="post">
    <h6>商品列表</h6>
             <table width="100%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
            <tr>
              <th bgcolor="#ffffff">宠物名称</th>
              <th bgcolor="#ffffff">市场价格</th>
              <th bgcolor="#ffffff">购买数量</th>
              <th bgcolor="#ffffff">小计</th>
            </tr> 
           <c:forEach var="ce" items="${cartlist}"> 
            <tr>
              <td bgcolor="#ffffff" align="center">
                  	${ce.goods_name}
              </td>
              <td align="center" bgcolor="#ffffff">${ce.price}</td>
              <td align="center" bgcolor="#ffffff">
                ${ce.goodsNum}
              </td>
              <td align="center" bgcolor="#ffffff">￥&nbsp;${ce.total}&nbsp;元 </td>
            </tr>
       	  </c:forEach>
       	  	<tr>
       	  		<td bgcolor="#ffffff" colspan="4" align="right">
       	 			应付款 
       	 			<font class="pricetype" size="5" color="red">￥&nbsp;${sum}&nbsp;元</font>
              </td>
          </tr>   	
        </table>   
        <div align="center" style="margin:8px auto;">
       		 <img style="cursor:pointer;"  onclick="submitorder(${sum},${cart.goods_id})" src="images/before/bnt_subOrder.gif" />
    	</div> 
    	<input type="hidden" name="goodsamount" value="20"/>
    </form>
</div>
</div>
</body>
</html>