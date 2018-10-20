package com.xieyezi;

import DAO.ConnectionHelper;
import domain.Administrators;
import domain.SafeRecord;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class SafeRecord_operation {
    ConnectionHelper helper; //自定义数据库连接对象

    public SafeRecord_operation() {
        helper = new ConnectionHelper();
        helper.checkAndInit();
    }
    //关闭连接
    public void closeConnection() {
        helper.closeConnection();
    }
    /* 获取所有安全记录信息
     * @return 返回结果可能为空,但不是null*/
    public Vector<SafeRecord> getAllSafeRecord() {
        Vector<SafeRecord> safeRecords= new Vector<>();
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            ps = helper.getPreparedStatement("select * from safeRecord");
            resultSet = ps.executeQuery();
            while (resultSet != null && resultSet.next()) {
                safeRecords.add(SafeRecord.CreateSafeRecord(resultSet));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            helper.close(ps, resultSet);
            return safeRecords;
        }

    }
    //删除一条安全记录
    public boolean deleteSafe(int pageid){
        PreparedStatement ps ;
        try {
            ps = helper.getPreparedStatement("delete from safeRecord where pageId=?");
            ps.setInt(1, pageid);
            ps.execute();
            helper.closePreparedStatement(ps);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("删除安全记录失败!");
            return false;
        }
    }
}
