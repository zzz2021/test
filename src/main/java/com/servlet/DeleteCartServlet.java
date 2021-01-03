package com.servlet;

import com.bean.Cart;
import com.bean.Goods;
import com.dao.CartDAO;
import com.dao.GoodsDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/DeleteCartServlet")
public class DeleteCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String cartId= request.getParameter("id");
        int id=Integer.parseInt(cartId);
        CartDAO cartDAO=new CartDAO();
        cartDAO.deleteCartGoods(id);
        request.getRequestDispatcher("jsp/before/cart.jsp").forward(request, response);
    }
}
