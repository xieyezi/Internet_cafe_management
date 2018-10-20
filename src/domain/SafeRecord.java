package domain;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SafeRecord {
    private int pageid;
    private String pageTitle;//安全记录的标题
    private String pageAdmin;//安全记录的管理员
    private String pageTime;//安全记录的时间
    private int Anouse;//记录当天A区有多少台机器没有投入使用
    private int Bnouse;//记录当天B区有多少台机器没有投入使用
    private int Cnouse;//记录当天C区有多少台机器没有投入使用
    public SafeRecord(int pageid,String pageTitle, String pageAdmin, String pageTime,int Anouse,int Bnouse,int Cnouse) {
        this.pageid=pageid;
        this.pageTitle=pageTitle;
        this.pageAdmin=pageAdmin;
        this.pageTime=pageTime;
        this.Anouse=Anouse;
        this.Bnouse=Bnouse;
        this.Cnouse=Cnouse;
    }
    public String getPageTitle() {
        return pageTitle;
    }

    public void setPageTitle(String pageTitle) {
        this.pageTitle = pageTitle;
    }

    public String getPageAdmin() {
        return pageAdmin;
    }

    public void setPageAdmin(String pageAdmin) {
        this.pageAdmin = pageAdmin;
    }

    public String getPageTime() {
        return pageTime;
    }

    public void setPageTime(String pageTime) {
        this.pageTime = pageTime;
    }

    /* 从一条结果记录中生成一个SafeRecord对象,
     * @Exception 当出现数据库异常时,返回null */
    public static SafeRecord CreateSafeRecord(ResultSet resultSet) {
        try {
            int pageid=resultSet.getInt("pageId");
            String pageTitle = resultSet.getString("pageTitle");
            String pageAdmin = resultSet.getString("pageAdmin");
            String pageTime = resultSet.getString("pageTime");
            int Anouse =resultSet.getInt("Anouse");
            int Bnouse =resultSet.getInt("Bnouse");
            int Cnouse =resultSet.getInt("Cnouse");
            return new SafeRecord(pageid,pageTitle, pageAdmin, pageTime,Anouse,Bnouse,Cnouse);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[获取安全记录信息] 实例化一个SafeRecord对象失败!");
            return null;
        }
    }

    public int getAnouse() {
        return Anouse;
    }

    public void setAnouse(int anouse) {
        Anouse = anouse;
    }

    public int getBnouse() {
        return Bnouse;
    }

    public void setBnouse(int bnouse) {
        Bnouse = bnouse;
    }

    public int getCnouse() {
        return Cnouse;
    }

    public void setCnouse(int cnouse) {
        Cnouse = cnouse;
    }

    public int getPageid() {
        return pageid;
    }

    public void setPageid(int pageid) {
        this.pageid = pageid;
    }
}
