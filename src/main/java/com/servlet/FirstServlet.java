package com.servlet;

import com.bean.BUser;
import com.bean.Goods;
import com.bean.GoodsType;
import com.dao.GoodsTypeDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/FirstServlet")
public class FirstServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //把所有公司信息查询出来
      /*  GoodsTypeDAO goodsTypeDAO=new GoodsTypeDAO();
        List<GoodsType> goodsType=goodsTypeDAO.getGoodsTypeList();
        //GoodsType goodsType=new GoodsType(1,"sddsvs");*/
       // BUser bruser=new BUser(1,"344253453");
        BUser bruser=null;
      /*  request.setAttribute("goodsType",goodsType);*/
      request.getSession().setAttribute("bruser",bruser);
      request.getRequestDispatcher("jsp/before/index.jsp").forward(request, response);
       //response.sendRedirect("jsp/before/show.jsp");
    }
}
