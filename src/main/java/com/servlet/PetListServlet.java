package com.servlet;

import com.bean.BUser;
import com.bean.Goods;
import com.dao.GoodsDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/PetListServlet")
public class PetListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //把所有公司信息查询出来
        String current=request.getParameter("currentPage");
        GoodsDAO goodsDAO=new GoodsDAO();
        int pageSize=5;
        int currentPage=0;
        if(current==null){
            currentPage=1;
        }else{
            currentPage=Integer.parseInt(current);
        }
        List<Goods> sumGoods=goodsDAO.getGoodsList();
        int totalPage=0;
        totalPage=sumGoods.size()%pageSize==0?sumGoods.size()/pageSize:sumGoods.size()/pageSize+1;

        List<Goods> goodsList=goodsDAO.getGoodsListByPage(currentPage,pageSize);
        //6、上一页beforePage
        Integer beforePage=currentPage-1<=0?1:currentPage-1;
        //7、上一页afterPage
        Integer afterPage=currentPage+1>=totalPage?totalPage:currentPage+1;

        request.setAttribute("count",sumGoods.size());
        request.setAttribute("totalPage",totalPage);
        request.setAttribute("currentPage",currentPage);
        request.setAttribute("beforePage",beforePage);
        request.setAttribute("afterPage",afterPage);
        request.setAttribute("allGoods",goodsList);
        request.getRequestDispatcher("jsp/admin/petList.jsp").forward(request, response);
    }
}
