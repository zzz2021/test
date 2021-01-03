package com.servlet;

import com.bean.BUser;
import com.dao.BUserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/EditUserServlet")
public class EditUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取前台提交的email和密码
        String bname=request.getParameter("username");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String sex=request.getParameter("sex");
        String cmbProvince=request.getParameter("cmbProvince");
        String cmbCity=request.getParameter("cmbCity");
        String cmbArea=request.getParameter("cmbArea");
        Integer usex=Integer.parseInt(sex);
        //地址连接起来
        String address=cmbProvince+cmbCity+cmbArea;
        //更新applicant到数据库
        BUserDAO applicantDAO=new BUserDAO();
        applicantDAO.editBUser(bname,usex,phone,email,address);
        response.sendRedirect("jsp/admin/userList.jsp");
    }
}
