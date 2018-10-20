package com.xieyezi;

import DAO.ConnectionHelper;
import domain.Member;
import domain.Record;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class Record_operation {
    ConnectionHelper helper; //自定义数据库连接对象

    public Record_operation() {
        helper = new ConnectionHelper();
        helper.checkAndInit();
    }

    //关闭连接
    public void closeConnection() {
        helper.closeConnection();
    }

    /* 获取所有上机记录信息
     * @return 返回结果可能为空,但不是null*/
    public Vector<Record> getAllRecord() {
        Vector<Record> records = new Vector<>();
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            ps = helper.getPreparedStatement("select * from record");
            resultSet = ps.executeQuery();
            while (resultSet != null && resultSet.next()) {
                records.add(Record.CreateRecord(resultSet));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            helper.close(ps, resultSet);
            return records;
        }

    }

    //上机操作，增加一个上机记录
    public boolean insertRecord(String recordid, String recordname, String startTime, int recordArea, int lastmoney) {
        PreparedStatement ps;
        try {
            ps = helper.getPreparedStatement("INSERT INTO record VALUE(?,?,?,?,?)");
            ps.setString(1, recordid);
            ps.setString(2, recordname);
            ps.setString(3, startTime);
            ps.setInt(4, recordArea);
            ps.setInt(5, lastmoney);
            ps.executeUpdate();
            helper.closePreparedStatement(ps);
            //更改上机位置机器状态
            Machine_operation machine_operation =new Machine_operation();
            machine_operation.changeMachineState(recordArea,"use");
            machine_operation.closeConnection();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("增加上机记录失败!");
            return false;
        }
    }
    //下机操作
    public boolean removeRecord(String recordid,int machineid) {
        PreparedStatement ps ;
        try {
            ps = helper.getPreparedStatement("delete from record where recordid=?;");
            ps.setString(1, recordid);
            ps.execute();
            helper.closePreparedStatement(ps);
            //更改上机位置机器状态
            Machine_operation machine_operation =new Machine_operation();
            machine_operation.changeMachineState(machineid,"nouse");
            machine_operation.closeConnection();
            //changeMachineState(recordArea,"nouse");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("[下机操作] 下机删除失败!");
            return false;
        }
    }
    //用户充值服务
    public boolean addMoney(String recordid ,int lastmoney){
        PreparedStatement ps;
        try {
            ps = helper.getPreparedStatement("update record set lastmoney=lastmoney+? where recordid=?");
            ps.setInt(1, lastmoney);
            ps.setString(2, recordid);
            ps.executeUpdate();
            helper.closePreparedStatement(ps);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("充值失败!");
            return false;
        }
    }
    //查询所有的会员上机记录
    public Vector<Record> getAllVipRecord(){
        Vector<Record> recordsVIP = new Vector<>();
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            ps = helper.getPreparedStatement("select * from record WHERE recordid in (SELECT memberid from member);");
            resultSet = ps.executeQuery();
            while (resultSet != null && resultSet.next()) {
                recordsVIP.add(Record.CreateRecord(resultSet));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            helper.close(ps, resultSet);
            return recordsVIP;
        }
    }
    //查询所有临时客户上机记录
    public Vector<Record> getAllnormolRecord(){
        Vector<Record> recordsNormol = new Vector<>();
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            ps = helper.getPreparedStatement("select * from record WHERE recordid not in (SELECT memberid from member);");
            resultSet = ps.executeQuery();
            while (resultSet != null && resultSet.next()) {
                recordsNormol.add(Record.CreateRecord(resultSet));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            helper.close(ps, resultSet);
            return recordsNormol;
        }
    }
    //模糊查询实现根据用户名搜索功能
    public Vector<Record> RecordSearch(String name){
        Vector<Record> Serarch = new Vector<>();
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            ps = helper.getPreparedStatement("select * from record WHERE recordname like ? ");
            ps.setString(1,name);
            resultSet = ps.executeQuery();
            while (resultSet != null && resultSet.next()) {
                Serarch.add(Record.CreateRecord(resultSet));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            helper.close(ps, resultSet);
            return  Serarch;
        }
    }
}
