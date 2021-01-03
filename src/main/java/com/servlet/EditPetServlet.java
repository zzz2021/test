package com.servlet;

import com.bean.Goods;
import com.dao.BUserDAO;
import com.dao.GoodsDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/EditPetServlet")
public class EditPetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取前台提交的email和密码
        String action=request.getParameter("action");
        String gid=request.getParameter("gid");
        String gname=request.getParameter("gname");
        String category=request.getParameter("category");
        String goprice=request.getParameter("goprice");
        String grprice=request.getParameter("grprice");
        String gstore=request.getParameter("gstore");
        String gpicture=request.getParameter("logoImage");
        Integer id=null;
        if(gid==null){
            id=0;
        }else{
            id=Integer.parseInt(gid);
        }
        Integer store=Integer.parseInt(gstore);
        Integer typeId=Integer.parseInt(category);
        Double op=Double.parseDouble(goprice);
        Double rp=Double.parseDouble(grprice);
        Goods goods=null;
        //更新数据库
        GoodsDAO goodsDAO=new GoodsDAO();
        if(action==null){
            goods=new Goods(id, gname, op, rp, store, gpicture, typeId,1);
            goodsDAO.editGoods(goods);
            response.sendRedirect("jsp/admin/goodsDetail.jsp?id="+id);
        }else{
            goods=new Goods(null, gname, op, rp, store, gpicture, typeId,1);
            Boolean flag=goodsDAO.addGoods(goods);
            PrintWriter pw=response.getWriter();
            if(flag){
                pw.print("<script>alert('添加成功!');window.location.href='/pet/PetListServlet'</script>");
            }else{
                pw.print("<script>alert('添加失败!');window.location.href='/pet/PetListServlet'</script>");
            }
        }
    }
}
