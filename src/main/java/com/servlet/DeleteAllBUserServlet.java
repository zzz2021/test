package com.servlet;

import com.dao.BUserDAO;
import com.dao.CartDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/DeleteAllBUserServlet")
public class DeleteAllBUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        BUserDAO dao = new BUserDAO();
        dao.deleteAllBUser();
        request.getRequestDispatcher("jsp/admin/userList.jsp").forward(request, response);
    }
}
