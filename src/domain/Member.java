package domain;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Member {
    private String memberid;//会员ID（身份证号）
    private String membername;//会员姓名
    private int membermoney;//会员余额

    public Member(String memberid, String membername, int membermoney) {
        this.memberid = memberid;
        this.membername = membername;
        this.membermoney = membermoney;
    }

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }

    public String getMembername() {
        return membername;
    }

    public void setMembername(String membername) {
        this.membername = membername;
    }

    public int getMembermoney() {
        return membermoney;
    }

    public void setMembermoney(int membermoney) {
        this.membermoney = membermoney;
    }

    /* 从一条结果记录中生成一个member对象,
     * @Exception 当出现数据库异常时,返回null */
    public static Member Createmember(ResultSet resultSet) {
        try {
            String memberid = resultSet.getString("memberid");
            String membername = resultSet.getString("membername");
            int membermoney = resultSet.getInt("membermoney");
            return new Member(memberid, membername, membermoney);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[获取会员信息] 实例化一个member对象失败!");
            return null;
        }
    }
}
