package com.xieyezi;

import DAO.ConnectionHelper;
import domain.Administrators;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class Admain_operation {
    ConnectionHelper helper; //自定义数据库连接对象

    public Admain_operation() {
        helper = new ConnectionHelper();
        helper.checkAndInit();
    }

    //关闭连接
    public void closeConnection() {
        helper.closeConnection();
    }

    /* 获取所有系统管理员信息
     * @return 返回结果可能为空,但不是null*/
    public Vector<Administrators> getAllAdmain() {
        Vector<Administrators> administrators = new Vector<>();
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            ps = helper.getPreparedStatement("select adminid,adminname,adminpassword from admin");
            resultSet = ps.executeQuery();
            while (resultSet != null && resultSet.next()) {
                administrators.add(Administrators.CreateAdmin(resultSet));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            helper.close(ps, resultSet);
            return administrators;
        }

    }
}
