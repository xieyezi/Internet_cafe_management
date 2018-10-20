<%@ page import="domain.Member" %>
<%@ page import="java.util.Vector" %>
<%@ page import="com.xieyezi.Member_operation" %>
<%@ page import="domain.Administrators" %><%--
  Created by IntelliJ IDEA.
  User: xieyezi
  Date: 2018/5/4
  Time: 上午8:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%
    Administrators administrators = (Administrators) session.getAttribute("admin");
    Member_operation member_operation = new Member_operation();
    Vector<Member> members = member_operation.getAllMember();
    member_operation.closeConnection();
    Vector<Member> Membersearch= (Vector<Member>) request.getAttribute("Membersearch");
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>苏格网吧管理平台</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="assets/css/amazeui.datatables.min.css"/>
    <link rel="stylesheet" href="assets/css/app.css">
    <script src="assets/js/jquery.min.js"></script>

</head>

<body data-type="widgets">
<script src="assets/js/theme.js"></script>
<div class="am-g tpl-g">
    <!-- 头部 -->
    <header>
        <!-- logo -->
        <div class="am-fl tpl-header-logo">
            <a href="javascript:;"><img src="assets/img/logo.png" alt=""></a>
        </div>
        <!-- 右侧内容 -->
        <div class="tpl-header-fluid">
            <!-- 侧边切换 -->
            <div class="am-fl tpl-header-switch-button am-icon-list">
						<span>

                </span>
            </div>
            <!-- 搜索 -->
            <div class="am-fl tpl-header-search">
                <form class="tpl-header-search-form" action="javascript:;">
                    <button class="tpl-header-search-btn am-icon-search"></button>
                    <input class="tpl-header-search-box" type="text" placeholder="搜索内容...">
                </form>
            </div>
            <!-- 其它功能-->
            <div class="am-fr tpl-header-navbar">
                <ul>
                    <!-- 欢迎语 -->
                    <li class="am-text-sm tpl-header-navbar-welcome">
                        <a href="javascript:;">欢迎你！<span><%=administrators.getAdName()%></span> </a>
                    </li>
                    <!-- 退出 -->
                    <li class="am-text-sm">
                        <a href="javascript:;">
                            <span class="am-icon-sign-out"></span> 退出
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </header>


    <!-- 风格切换 -->
    <div class="tpl-skiner">
        <div class="tpl-skiner-toggle am-icon-cog">
        </div>
        <div class="tpl-skiner-content">
            <div class="tpl-skiner-content-title">
                选择主题
            </div>
            <div class="tpl-skiner-content-bar">
                <span class="skiner-color skiner-white" data-color="theme-white"></span>
                <span class="skiner-color skiner-black" data-color="theme-black"></span>
            </div>
        </div>
    </div>
    <!-- 侧边导航栏 -->
    <div class="left-sidebar">
        <!-- 用户信息 -->
        <div class="tpl-sidebar-user-panel">
            <div class="tpl-user-panel-slide-toggleable">
                <div class="tpl-user-panel-profile-picture">
                    <img src="assets/img/admin01.png" alt="">
                </div>
                <span class="user-panel-logged-in-text">
              <i class="am-icon-circle-o am-text-success tpl-user-panel-status-icon"></i>
              <%=administrators.getAdName()%>
          </span>
            </div>
        </div>

        <!-- 菜单 -->
        <ul class="sidebar-nav">
            <!-- <li class="sidebar-nav-heading">Components <span class="sidebar-nav-heading-info"> 附加组件</span></li>-->
            <li class="sidebar-nav-link">
                <a href="record.jsp">
                    <i class="am-icon-home sidebar-nav-link-logo"></i> 上机记录
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="machine.jsp">
                    <i class="am-icon-tv sidebar-nav-link-logo"></i> 机器运行情况
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="member.jsp">
                    <i class="am-icon-child sidebar-nav-link-logo"></i> 会员管理

                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="wangbamanage.jsp">
                    <i class="am-icon-clone sidebar-nav-link-logo"></i> 网吧管理

                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="#">
                    <i class="am-icon-calendar sidebar-nav-link-logo"></i> 当前时间
                    <p id="time1"></p>
                </a>
            </li>
        </ul>
    </div>

    <!-- 内容区域 -->
    <div class="tpl-content-wrapper">
        <div class="container-fluid am-cf">
            <div class="row">
                <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                    <div class="page-header-heading"><span class="am-icon-child page-header-heading-icon"></span> 会员管理
                    </div>

                </div>
                <div class="am-u-lg-3 tpl-index-settings-button">
                    <%--<button type="button" class="page-header-button"><span class="am-icon-paint-brush"></span> 设置</button>--%>
                </div>
            </div>

        </div>
        <div class="row-content am-cf">
            <div class="row">
                <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title  am-cf">会员管理</div>

                        </div>
                        <div class="widget-body  am-fr">

                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-8">
                                <div class="am-form-group">
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <a type="button" href="addMember.jsp"
                                               class="am-btn am-btn-default am-btn-success"><span
                                                    class="am-icon-plus"></span> 新增会员</a>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="am-u-sm-12 am-u-md-12 am-u-lg-4">
                                <form action="MemberSearchServlet">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field " name="memberName">
                                        <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search"
                    type="submit"></button>
          </span>
                                    </div>
                                </form>
                            </div>

                            <div class="am-u-sm-12">
                                <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
                                    <thead>
                                    <tr>

                                        <th>身份证号</th>
                                        <th>姓 名</th>
                                        <th>账户余额</th>
                                        <th>操 作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        if (Membersearch==null){

                                        for (int i = 0; i < members.size(); i++) {
                                    %>
                                    <tr class="even gradeC">
                                        <td class="am-text-middle"><%=members.get(i).getMemberid()%>
                                        </td>
                                        <td class="am-text-middle"><%=members.get(i).getMembername()%>
                                        </td>

                                        <td class="am-text-middle"><%=members.get(i).getMembermoney()%>
                                        </td>
                                        <td class="am-text-middle">
                                            <div class="tpl-table-black-operation">
                                                <a href="removeMemberServlet?id=<%=members.get(i).getMemberid()%>"
                                                   class="tpl-table-black-operation-del">
                                                    <i class="am-icon-remove"></i> 删除会员
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                        }
                                    %>
                                    <%
                                        if (Membersearch!=null){

                                            for (int i = 0; i < Membersearch.size(); i++) {
                                    %>
                                    <tr class="even gradeC">
                                        <td class="am-text-middle"><%=Membersearch.get(i).getMemberid()%>
                                        </td>
                                        <td class="am-text-middle"><%=Membersearch.get(i).getMembername()%>
                                        </td>

                                        <td class="am-text-middle"><%=Membersearch.get(i).getMembermoney()%>
                                        </td>
                                        <td class="am-text-middle">
                                            <div class="tpl-table-black-operation">
                                                <a href="removeMemberServlet?id=<%=members.get(i).getMemberid()%>"
                                                   class="tpl-table-black-operation-del">
                                                    <i class="am-icon-remove"></i> 删除会员
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    %>
                                    <!-- more data -->
                                    </tbody>
                                </table>
                            </div>
                            <div class="am-u-lg-12 am-cf">

                                <div class="am-fr">
                                    <ul class="am-pagination tpl-pagination">
                                        <li class="am-disabled">
                                            <a href="#">«</a>
                                        </li>
                                        <li class="am-active">
                                            <a href="#">1</a>
                                        </li>
                                        <li>
                                            <a href="#">2</a>
                                        </li>
                                        <li>
                                            <a href="#">3</a>
                                        </li>
                                        <li>
                                            <a href="#">4</a>
                                        </li>
                                        <li>
                                            <a href="#">5</a>
                                        </li>
                                        <li>
                                            <a href="#">»</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
<script>
    function mytime() {
        var a = new Date();
        var b = a.toLocaleTimeString();
        var c = a.toLocaleDateString();
        document.getElementById("time1").innerHTML = c + "&nbsp" + b;
    }

    setInterval(function () {
        mytime()
    }, 1000);
</script>
</body>

</html>

