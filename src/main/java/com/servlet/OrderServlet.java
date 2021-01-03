package com.servlet;

import com.bean.Focus;
import com.bean.Goods;
import com.bean.Order;
import com.dao.CartDAO;
import com.dao.FocusDAO;
import com.dao.GoodsDAO;
import com.dao.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns  = "/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String amount = request.getParameter("amount");
        String orderGoodsId=request.getParameter("cart");
        int total=Integer.parseInt(amount);
        int id=Integer.parseInt(orderGoodsId);
        OrderDAO goodsDAO=new OrderDAO();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String date = sdf.format(new Date());
        Order order=new Order(null,1,id,total,1,date);
        boolean flag=goodsDAO.saveOrder(order);
        Order or=goodsDAO.getOrder(id);
       // CartDAO cartDAO=new CartDAO();
       // cartDAO.updatecart(id);
        request.setAttribute("ordersn",or.getId());
        request.getRequestDispatcher("jsp/before/orderdone.jsp").forward(request, response);
        //response.sendRedirect("jsp/before/show.jsp");
    }
}
