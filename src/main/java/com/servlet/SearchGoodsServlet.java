package com.servlet;

import com.bean.BUser;
import com.bean.Goods;
import com.dao.GoodsDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/SearchGoodsServlet")
public class SearchGoodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String goodsName=request.getParameter("mykey");
        GoodsDAO goodsDAO=new GoodsDAO();
        List<Goods> goods=goodsDAO.getGoods(goodsName);
        request.setAttribute("searchlist",goods);
        request.getRequestDispatcher("jsp/before/searchResult.jsp").forward(request, response);
    }
}
