package com.xieyezi;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddMemberServlet")
public class AddMemberServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String id =request.getParameter("member-id");
        String name=request.getParameter("member-name");
        int money=Integer.parseInt(request.getParameter("member-money"));
        Member_operation member_operation =new Member_operation();
        member_operation.addMember(id,name,money);
        member_operation.closeConnection();
        response.sendRedirect("member.jsp");
    }
}
