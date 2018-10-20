package domain;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Machine {
    private int machineid;//机器id
    private String machinearea;//机器区域
    private String machinestate;//机器使用状态（use|nouse）

    public Machine(int machineid, String machinearea, String machinestate) {
        this.machineid = machineid;
        this.machinearea = machinearea;
        this.machinestate = machinestate;
    }

    public int getMachineid() {
        return machineid;
    }

    public void setMachineid(int machineid) {
        this.machineid = machineid;
    }

    public String getMachinearea() {
        return machinearea;
    }

    public void setMachinearea(String machinearea) {
        this.machinearea = machinearea;
    }

    public String getMachinestate() {
        return machinestate;
    }

    public void setMachinestate(String machinestate) {
        this.machinestate = machinestate;
    }

    /* 从一条结果记录中生成一个machine对象,
     * @Exception 当出现数据库异常时,返回null */
    public static Machine Createmachine(ResultSet resultSet) {
        try {
            int machineid = resultSet.getInt("memberid");
            String machinearea = resultSet.getString("machinearea");
            String machinestate = resultSet.getString("machinestate");
            return new Machine(machineid, machinearea, machinestate);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[获取机器信息] 实例化一个machine对象失败!");
            return null;
        }
    }

}
