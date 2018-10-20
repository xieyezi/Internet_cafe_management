package com.xieyezi;

import domain.Record;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Vector;

@WebServlet("/RecordSearchServlet")
public class RecordSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String name=request.getParameter("serach");
        Record_operation record_operation=new Record_operation();
        Vector<Record> search= record_operation.RecordSearch(name);
        record_operation.closeConnection();
        request.setAttribute("serarch",search);
        request.getRequestDispatcher("record.jsp").forward(request,response);
    }
}
