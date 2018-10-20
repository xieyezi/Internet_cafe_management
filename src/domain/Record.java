package domain;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Record {
    private String recordid;//上机用户id
    private String recordname;//上机用户姓名
    private String startTime;//上机用户开始时间
    private int recordArea;//上机用户机器位置
    private int lastmoney;//上机用户账户余额

    public Record(String recordid, String recordname, String startTime, int recordArea, int lastmoney) {
        this.recordid = recordid;
        this.recordname = recordname;
        this.startTime = startTime;
        this.recordArea = recordArea;
        this.lastmoney = lastmoney;
    }

    public String getRecordid() {
        return recordid;
    }

    public void setRecordid(String recordid) {
        this.recordid = recordid;
    }

    public String getRecordname() {
        return recordname;
    }

    public void setRecordname(String recordname) {
        this.recordname = recordname;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public int getRecordArea() {
        return recordArea;
    }

    public void setRecordArea(int recordArea) {
        this.recordArea = recordArea;
    }

    public int getLastmoney() {
        return lastmoney;
    }

    public void setLastmoney(int lastmoney) {
        this.lastmoney = lastmoney;
    }
    /* 从一条结果记录中生成一个record对象 */
    public static Record CreateRecord(ResultSet resultSet) {
        try {
            String recordid = resultSet.getString("recordid");
            String recordname = resultSet.getString("recordname");
            String startTime=resultSet.getString("startTime");
            int recordArea = resultSet.getInt("recordArea");
            int lastmoney = resultSet.getInt("lastmoney");
            return new Record(recordid,recordname,startTime,recordArea,lastmoney);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[获取上机信息] 实例化一个record对象失败!");
            return null;
        }
    }
}
