package com.xieyezi;

import domain.Administrators;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Vector;

@WebServlet(name = "LoginCheckServlet")
public class LoginCheckServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String inputName=request.getParameter("admain-name");
        String intputPassword =request.getParameter("admain-password");
        Admain_operation admain_operation =new Admain_operation();
        Vector<Administrators> all = admain_operation.getAllAdmain();
        int flag =0;
        for (int i =0;i<all.size();i++){
            if (inputName.equals(all.get(i).getAdName()) && intputPassword.equals(all.get(i).getAdPassword())){
                //验证登录成功
                flag=1;
                Administrators administrators = new Administrators(inputName,intputPassword);
                HttpSession session = request.getSession();
                session.setAttribute("admin",administrators);
                break;
            }
        }
        if (flag==1){
            admain_operation.closeConnection();
            response.sendRedirect("record.jsp");
        }
        else{
            admain_operation.closeConnection();
            response.sendRedirect("index.jsp?login=no");
        }

    }
}
