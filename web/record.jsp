<%@ page import="com.xieyezi.Record_operation" %>
<%@ page import="domain.Record" %>
<%@ page import="java.util.Vector" %>
<%@ page import="domain.Administrators" %><%--
  Created by IntelliJ IDEA.
  User: xieyezi
  Date: 2018/5/3
  Time: 上午12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%
    Administrators administrators = (Administrators) session.getAttribute("admin");
    Record_operation record_operation = new Record_operation();
    Vector<Record> records = null;
    String type = request.getParameter("recordType");
    if (type == null || type.equals("option1")) {
        type = "option1";
        records = record_operation.getAllRecord();
    } else if (type.equals("option2")) {
        records = record_operation.getAllVipRecord();
    } else if (type.equals("option3")) {
        records = record_operation.getAllnormolRecord();
    }
    record_operation.closeConnection();
    Vector<Record> search= (Vector<Record>) request.getAttribute("serarch");
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
                    <!--<span class="am-badge am-badge-secondary sidebar-nav-link-logo-ico am-round am-fr am-margin-right-sm">6</span>-->
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="wangbamanage.jsp">
                    <i class="am-icon-clone sidebar-nav-link-logo"></i> 网吧管理
                    <!--<span class="am-badge am-badge-secondary sidebar-nav-link-logo-ico am-round am-fr am-margin-right-sm">6</span>-->
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
                    <div class="page-header-heading"><span class="am-icon-yelp page-header-heading-icon"></span> 上机记录
                        <small>当前记录</small>
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
                            <div class="widget-title  am-cf">上机记录</div>

                        </div>
                        <div class="widget-body  am-fr">

                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                <div class="am-form-group">
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <a type="button" href="newRecord.jsp"
                                               class="am-btn am-btn-default am-btn-success"><span
                                                    class="am-icon-plus"></span> 新增</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                <div class="am-form-group tpl-table-list-select">
                                    <form action="record.jsp">
                                        <select name="recordType" size="3" onchange="submit();"
                                                data-am-selected="{btnSize: 'sm'}">
                                            <option value="option1" <%
                                                if (type.equals("option1")) {
                                                    out.print("selected='selected'");
                                                }
                                            %>>所有上机记录
                                            </option>
                                            <option value="option2" <%
                                                if (type.equals("option2")) {
                                                    out.print("selected='selected'");
                                                }
                                            %>>会员
                                            </option>
                                            <option value="option3"  <%
                                                if (type.equals("option3")) {
                                                    out.print("selected='selected'");
                                                }
                                            %>>临时客户
                                            </option>
                                        </select>
                                    </form>
                                </div>
                            </div>
                            <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                <form action="RecordSearchServlet">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field" name="serach">
                                        <span class="am-input-group-btn"><button
                                                class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search"
                                                type="submit"></button></span>
                                    </div>
                                </form>
                            </div>

                            <div class="am-u-sm-12">
                                <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
                                    <thead>
                                    <tr>

                                        <th>身份证号</th>
                                        <th>上机时间</th>
                                        <th>姓 名</th>
                                        <th>机器位置</th>
                                        <th>余额</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        if (search==null)
                                        {
                                        for (int i = 0; i < records.size(); i++) {

                                    %>
                                    <tr class="even gradeC">
                                        <td class="am-text-middle"><%=records.get(i).getRecordid()%>
                                        </td>
                                        <td class="am-text-middle"><%=records.get(i).getStartTime()%>
                                        </td>
                                        <td class="am-text-middle"><%=records.get(i).getRecordname()%>
                                        </td>
                                        <td class="am-text-middle"><%=records.get(i).getRecordArea()%>
                                        </td>
                                        <td class="am-text-middle"><%=records.get(i).getLastmoney()%>
                                        </td>
                                        <td class="am-text-middle">
                                            <div class="tpl-table-black-operation">
                                                <a href="userAddmoney.jsp?userid=<%=records.get(i).getRecordid()%>&username=<%=records.get(i).getRecordname()%>">
                                                    <i class="am-icon-pencil"></i> 充值
                                                </a>
                                                <a href="DeleteRecordServlet?userid=<%=records.get(i).getRecordid()%>&machineid=<%=records.get(i).getRecordArea()%>"
                                                   class="tpl-table-black-operation-del">
                                                    <i class="am-icon-remove"></i> 下机
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- more data -->
                                    <%}
                                    }%>
                                    <%
                                        if (search!=null){
                                        for (int i = 0; i < search.size(); i++) {

                                    %>
                                    <tr class="even gradeC">
                                        <td class="am-text-middle"><%=search.get(i).getRecordid()%>
                                        </td>
                                        <td class="am-text-middle"><%=search.get(i).getStartTime()%>
                                        </td>
                                        <td class="am-text-middle"><%=search.get(i).getRecordname()%>
                                        </td>
                                        <td class="am-text-middle"><%=search.get(i).getRecordArea()%>
                                        </td>
                                        <td class="am-text-middle"><%=search.get(i).getLastmoney()%>
                                        </td>
                                        <td class="am-text-middle">
                                            <div class="tpl-table-black-operation">
                                                <a href="userAddmoney.jsp?userid=<%=search.get(i).getRecordid()%>&username=<%=search.get(i).getRecordname()%>">
                                                    <i class="am-icon-pencil"></i> 充值
                                                </a>
                                                <a href="DeleteRecordServlet?userid=<%=search.get(i).getRecordid()%>&machineid=<%=search.get(i).getRecordArea()%>"
                                                   class="tpl-table-black-operation-del">
                                                    <i class="am-icon-remove"></i> 下机
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- more data -->
                                    <%}
                                    }%>
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