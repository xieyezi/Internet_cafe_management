package com.xieyezi;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserAddMoneyServlet")
public class UserAddMoneyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String userid=request.getParameter("user-id");
        int money=Integer.parseInt(request.getParameter("user-money"));
        Record_operation record_operation=new Record_operation();
        record_operation.addMoney(userid,money);
        record_operation.closeConnection();
        response.sendRedirect("record.jsp");
    }
}
