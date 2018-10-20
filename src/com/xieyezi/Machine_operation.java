package com.xieyezi;

import DAO.ConnectionHelper;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Machine_operation {
    ConnectionHelper helper; //自定义数据库连接对象

    public Machine_operation() {
        helper = new ConnectionHelper();
        helper.checkAndInit();
    }

    //关闭连接
    public void closeConnection() {
        helper.closeConnection();
    }

    //更改机器状态
    public void changeMachineState(int machineid, String state) {
        PreparedStatement ps;
        try {
            ps = helper.getPreparedStatement("update machine set machinestate=? where machineid=?");
            ps.setString(1, state);
            ps.setInt(2, machineid);
            ps.executeUpdate();
            helper.closePreparedStatement(ps);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("更改机器状态失败!");
        }
    }
    //查询当前机器是否被使用
    public boolean isBusy(int machineid){
        PreparedStatement ps;
        boolean flag=false;
        try {
            ps = helper.getPreparedStatement("select machinestate from machine where machineid=?");
            ps.setInt(1, machineid);
            ResultSet resultSet =ps.executeQuery();
            String state="";
            if (resultSet.next()){
                state=resultSet.getString(1);
            }
            if (state.equals("use")){
                flag=true;
            }
            resultSet.close();
            helper.closePreparedStatement(ps);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("更改机器状态失败!");
        }finally {
            return flag;
        }
    }
    /*查询机器使用情况,sign=true查询这个区域的总机器数目,false查询剩余可用机器数目*/
    public int countMachine(String area, String state) {
        PreparedStatement ps;
        int count = 0;
        try {
            String sql = "SELECT COUNT(machineid) FROM machine where machinearea=? ";
            if (state!=null) {
                sql += "and machinestate=?";
            }
            ps = helper.getPreparedStatement(sql);
            ps.setString(1, area);
            if (state!=null) {
                ps.setString(2,state);
            }
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }
            resultSet.close();
            helper.closePreparedStatement(ps);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查询失败!");
        } finally {
            return count;
        }
    }
}
