package com.servlet;

import com.bean.Focus;
import com.bean.Goods;
import com.dao.FocusDAO;
import com.dao.GoodsDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns  = "/FocusServlet")
public class FocusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String goodsId = request.getParameter("id");
        int id=Integer.parseInt(goodsId);

        GoodsDAO goodsDAO=new GoodsDAO();
        Goods goods=goodsDAO.getSingleGoods(id);

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String birthday = sdf.format(new Date());
        Focus focus=new Focus(null,1,goods.getId(),goods.getGname(),goods.getGpicture(),goods.getGrprice(),birthday);
        FocusDAO focusDAO=new FocusDAO();
        boolean flag=focusDAO.saveFocus(focus);
        request.setAttribute("msg","已关注该宠物！");

        request.getRequestDispatcher("jsp/before/goodsdetail.jsp").forward(request, response);
        //response.sendRedirect("jsp/before/show.jsp");
    }
}
