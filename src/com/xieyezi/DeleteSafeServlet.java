package com.xieyezi;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteSafeServlet")
public class DeleteSafeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("pageid"));
        SafeRecord_operation safeRecord_operation =new SafeRecord_operation();
        safeRecord_operation.deleteSafe(id);
        safeRecord_operation.closeConnection();
        response.sendRedirect("wangbamanage.jsp");
    }
}
