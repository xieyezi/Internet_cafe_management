package domain;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Administrators {
    private String adName;//系统管理员名字
    private String adPassword;//密码

    public Administrators(String adName,String adPassword){
        this.adName=adName;
        this.adPassword=adPassword;
    }
    public String getAdName() {
        return adName;
    }

    public void setAdName(String adName) {
        this.adName = adName;
    }

    public String getAdPassword() {
        return adPassword;
    }

    public void setAdPassword(String adPassword) {
        this.adPassword = adPassword;
    }
    /* 从一条结果记录中生成一个Admin对象,
     * @Exception 当出现数据库异常时,返回null */
    public static Administrators CreateAdmin(ResultSet resultSet) {
        try {
            String adminName = resultSet.getString("adminName");
            String adminPassword = resultSet.getString("adminPassword");
            return new Administrators(adminName,adminPassword);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[获取系统管理员信息] 实例化一个Admin对象失败!");
            return null;
        }
    }
}
