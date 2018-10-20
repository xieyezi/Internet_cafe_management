package com.xieyezi;

import DAO.ConnectionHelper;
import domain.Member;
import domain.Record;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class Member_operation {
    ConnectionHelper helper; //自定义数据库连接对象

    public Member_operation() {
        helper = new ConnectionHelper();
        helper.checkAndInit();
    }
    //关闭连接
    public void closeConnection() {
        helper.closeConnection();
    }
    /* 获取所有会员信息
     * @return 返回结果可能为空,但不是null*/
    public Vector<Member> getAllMember() {
        Vector<Member> members = new Vector<>();
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            ps = helper.getPreparedStatement("select * from member");
            resultSet = ps.executeQuery();
            while (resultSet != null && resultSet.next()) {
                members.add(Member.Createmember(resultSet));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            helper.close(ps, resultSet);
            return members;
        }

    }
    //新增一个会员
    public boolean addMember(String memberid,String membername,int membermoney){
        PreparedStatement ps;
        try {
            ps = helper.getPreparedStatement("INSERT INTO member VALUE(?,?,?)");
            ps.setString(1, memberid);
            ps.setString(2, membername);
            ps.setInt(3, membermoney);
            ps.executeUpdate();
            helper.closePreparedStatement(ps);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("增加会员记录失败!");
            return false;
        }
    }
    //删除一个会员
    public boolean removeMember(String recordid) {
        PreparedStatement ps ;
        try {
            ps = helper.getPreparedStatement("delete from member where memberid=?;");
            ps.setString(1, recordid);
            ps.execute();
            helper.closePreparedStatement(ps);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("删除会员失败!");
            return false;
        }
    }
    //模糊查询实现根据用户名搜索功能
    public Vector<Member> MemberSearch(String name){
        Vector<Member> SerarchMember = new Vector<>();
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            ps = helper.getPreparedStatement("select * from member WHERE membername like ? ");
            ps.setString(1,name);
            resultSet = ps.executeQuery();
            while (resultSet != null && resultSet.next()) {
                SerarchMember.add(Member.Createmember(resultSet));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            helper.close(ps, resultSet);
            return  SerarchMember;
        }
    }
}
