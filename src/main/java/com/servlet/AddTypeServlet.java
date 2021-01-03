package com.servlet;

import com.dao.GoodsTypeDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/AddTypeServlet")
public class AddTypeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取前台提交的email和密码
        String typename=request.getParameter("typename");
        GoodsTypeDAO typeDAO=new GoodsTypeDAO();
        Boolean flag= typeDAO.addType(typename);
        PrintWriter pw=response.getWriter();
        request.getRequestDispatcher("jsp/admin/addType.jsp").forward(request, response);
    }
}
