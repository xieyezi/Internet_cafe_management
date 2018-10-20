package com.xieyezi;

import domain.Machine;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "AddNewRecordServlet")
public class AddNewRecordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String recordid= request.getParameter("recordid");
        String recordname=request.getParameter("recordname");
        //获取当前时间
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String startTime=dateFormat.format(new Date());
        int recordArea =Integer.parseInt(request.getParameter("recordArea"));
        int lastmoney=Integer.parseInt(request.getParameter("lastmoney"));
        //判断当前机器是否已经被占用
        Machine_operation machine_operation = new Machine_operation();
        boolean flag= machine_operation.isBusy(recordArea);
        if (flag==false){
            Record_operation record_operation =new Record_operation();
            record_operation.insertRecord(recordid,recordname,startTime,recordArea,lastmoney);
            record_operation.closeConnection();
            response.sendRedirect("record.jsp");
        }
        else {
            response.sendRedirect("newRecord.jsp?new=no");
        }
/*以下为测试专门写的函数*/
//        for (int i=0;i<10;i++){
//            text.adduser();
//        }
//        response.sendRedirect("record.jsp");
    }
}
