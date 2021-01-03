package com.servlet;

import com.bean.Goods;
import com.dao.GoodsDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/DeletePetServlet")
public class DeletePetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取前台提交的email和密码
        String id=request.getParameter("id");
        int gid=Integer.parseInt(id);
        GoodsDAO goodsDAO=new GoodsDAO();
        Boolean flag=goodsDAO.deletePet(gid);
            PrintWriter pw=response.getWriter();
            if(flag){
                pw.print("<script>alert('添加成功!');window.location.href='/pet/PetListServlet'</script>");
            }else{
                pw.print("<script>alert('添加失败!');window.location.href='/pet/PetListServlet'</script>");
            }
        }
}
