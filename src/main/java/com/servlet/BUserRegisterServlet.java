package com.servlet;
import com.bean.BUser;
import com.dao.BUserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(urlPatterns = "/BUserRegisterServlet")
public class BUserRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        //获取前台提交的email和密码
        String action=request.getParameter("action");
        String bname=request.getParameter("bname");
        String email=request.getParameter("email");
        String bpwd=request.getParameter("bpwd");
        String phone=request.getParameter("phone");
        String sex=request.getParameter("sex");
        String cmbProvince=request.getParameter("cmbProvince");
        String cmbCity=request.getParameter("cmbCity");
        String cmbArea=request.getParameter("cmbArea");

        int usex=Integer.parseInt(sex);
        //地址连接起来
        String address=cmbProvince+cmbCity+cmbArea;
       // address.concat(cmbProvince).concat(cmbCity).concat(cmbArea);
        //插入到数据库中，对数据进行封装
        BUser applicant=new BUser(null,email,bname,bpwd,usex,phone,address);
        //保存applicant到数据库
        BUserDAO applicantDAO=new BUserDAO();
        //判断是否有相同的email
        Integer count=applicantDAO.selectApplicantEmailCount(email);
        if(count>0){
            //数据库中已经有相同的email用户
            //通过response对象给客户端一个错误提示
            PrintWriter writer=response.getWriter();
            writer.write("<script>");
            writer.write("alert('申请注册的email已经被占用！');");
            if(action==null){
                String code = request.getParameter("code");
                HttpSession session = request.getSession();
                if (!code.equals(session.getAttribute("randCheckCode"))) {
                    request.setAttribute("errormsg", "验证码不正确");
                }
                System.out.println(request.getAttribute("errormsg"));
                writer.write("window.location.href='jsp/before/register.jsp'");
            }
            else{
                writer.write("window.location.href='jsp/admin/addUser.jsp'");
            }
            writer.write("</script>");
            writer.flush();
            writer.close();
        }else{
            //是否注册成功
            boolean flag=applicantDAO.saveApplicant(applicant);
            if(flag){
                //注册成功就跳转到登录页面  重定向
                if(action==null){
                    response.sendRedirect("jsp/before/login.jsp");
                }
                else{
                    response.sendRedirect("jsp/admin/addUser.jsp");
                }
            }else {
                if(action==null){
                    //注册失败就返回注册页面   请求转发
                    RequestDispatcher dispatcher= request.getRequestDispatcher("jsp/before/register.jsp");
                    dispatcher.forward(request,response);
                }
                else{
                    //注册失败就返回注册页面   请求转发
                    RequestDispatcher dispatcher= request.getRequestDispatcher("jsp/admin/addUser.jsp");
                    dispatcher.forward(request,response);
                }
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
