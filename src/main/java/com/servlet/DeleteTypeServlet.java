package com.servlet;

import com.dao.BUserDAO;
import com.dao.GoodsTypeDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/DeleteTypeServlet")
public class DeleteTypeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //获取前台提交的email和密码
        String id=request.getParameter("id");
        int tid=Integer.parseInt(id);
        GoodsTypeDAO typeDAO=new GoodsTypeDAO();
        Boolean flag= typeDAO.deleteType(tid);
        PrintWriter pw=response.getWriter();
        request.getRequestDispatcher("jsp/admin/addType.jsp").forward(request, response);
    }
}
