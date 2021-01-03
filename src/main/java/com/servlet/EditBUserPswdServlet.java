package com.servlet;

import com.dao.BUserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/EditBUserPswdServlet")
public class EditBUserPswdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取前台提交的email和密码
        String bname=request.getParameter("name");
        String newpassword=request.getParameter("newpassword");
        BUserDAO applicantDAO=new BUserDAO();
        Boolean flag= applicantDAO.editBUserPswd(bname,newpassword);
        PrintWriter pw=response.getWriter();
        if(flag){
            pw.print("<script>alert('密码修改成功!');window.location.href='jsp/admin/userList.jsp'</script>");
        }else{
            pw.print("<script>alert('失败!');window.location.href='jsp/admin/userList.jsp'</script>");
        }
    }
}
