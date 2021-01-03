package com.servlet;

import com.bean.BUser;
import com.bean.Cart;
import com.bean.Goods;
import com.bean.GoodsType;
import com.dao.CartDAO;
import com.dao.GoodsDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns  = "/AddCartServlet")
public class AddCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String goodsId = request.getParameter("goodsId");
        int id=Integer.parseInt(goodsId);
        GoodsDAO goodsDAO=new GoodsDAO();
        Goods goods=goodsDAO.getSingleGoods(id);
        String shoppingnum=request.getParameter("shoppingnum");
        int num=Integer.parseInt(shoppingnum);
        Cart cart=new Cart(null,goods.getGname(),1,id,num,goods.getGpicture(),goods.getGrprice());
        CartDAO cartDAO=new CartDAO();
        int number=goods.getGstore()-num;
        goodsDAO.updateGoodsNum(id,number);
        boolean flag=cartDAO.saveCart(cart);
        //request.getSession().setAttribute("bruser",bruser);
        request.getRequestDispatcher("jsp/before/cart.jsp").forward(request, response);
        //response.sendRedirect("jsp/before/show.jsp");
    }
}
