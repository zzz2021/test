package com.servlet;

import com.bean.BUser;
import com.dao.BUserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/BUserLoginServlet")
public class BUserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取前台提交的email和密码
        String applicatName=request.getParameter("bname");
        String applicatPwd=request.getParameter("bpwd");

        String code = request.getParameter("code");
        HttpSession session = request.getSession();
        if (!code.equals(session.getAttribute("randCheckCode"))) {
            request.setAttribute("errormsg", "验证码不正确");
        }
        System.out.println(request.getAttribute("errormsg"));
        BUserDAO applicantDAO=new BUserDAO();
        BUser applicant= applicantDAO.getUserByNameAndPass(applicatName,applicatPwd);
        //判断applicant==null，返回登录页面，不为空，就进入主页面
        if(applicant!=null){
            request.getSession().setAttribute("bruser", applicant);
           request.getRequestDispatcher("jsp/before/index.jsp").forward(request, response);
        }else{
            PrintWriter writer=response.getWriter();
            writer.write("<script>");
            writer.write("alert('用户名或密码错误！');");
            writer.write("window.location.href='jsp/before/login.jsp'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }
    }
}
