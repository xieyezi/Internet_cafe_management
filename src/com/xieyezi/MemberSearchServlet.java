package com.xieyezi;

import domain.Member;
import domain.Record;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Vector;

@WebServlet("/MemberSearchServlet")
public class MemberSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String name=request.getParameter("memberName");
        Member_operation member_operation=new Member_operation();
        Vector<Member> Membersearch=member_operation.MemberSearch(name);
        member_operation.closeConnection();
        request.setAttribute("Membersearch",Membersearch);
        request.getRequestDispatcher("member.jsp").forward(request,response);
    }
}
