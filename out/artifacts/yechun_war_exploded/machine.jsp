<%@ page import="com.xieyezi.Machine_operation" %>
<%@ page import="domain.Administrators" %>
<%@ page import="com.xieyezi.SafeRecord_operation" %>
<%@ page import="domain.SafeRecord" %>
<%@ page import="java.util.Vector" %><%--
  Created by IntelliJ IDEA.
  User: xieyezi
  Date: 2018/5/3
  Time: 下午10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%
    Administrators administrators= (Administrators) session.getAttribute("admin");
    Machine_operation machine_operation=new Machine_operation();
    int countAnouse= machine_operation.countMachine("A","nouse");
    int countBnouse= machine_operation.countMachine("B","nouse");
    int countCnouse= machine_operation.countMachine("C","nouse");
    machine_operation.closeConnection();
    SafeRecord_operation safeRecord_operation=new SafeRecord_operation();
    Vector<SafeRecord> safeRecords =safeRecord_operation.getAllSafeRecord();
    safeRecord_operation.closeConnection();
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>苏格网吧管理平台</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script src="assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="assets/css/app.css">
    <script src="assets/js/jquery.min.js"></script>

</head>

<body data-type="index">
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
                    <div class="page-header-heading"><span class="am-icon-tv page-header-heading-icon"></span> 机器管理 <small>整体运行情况</small></div>

                </div>
                <div class="am-u-lg-3 tpl-index-settings-button">
                    <%--<button type="button" class="page-header-button"><span class="am-icon-paint-brush"></span> 设置</button>--%>
                </div>
            </div>

        </div>

        <div class="row-content am-cf">
            <div class="row  am-cf">
                <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                    <div class="widget widget-primary am-cf">
                        <div class="widget-statistic-header">
                            A区已上机
                        </div>
                        <div class="widget-statistic-body">
                            <div class="widget-statistic-value">
                                <%=50-countAnouse%>台
                            </div>
                            <div class="widget-statistic-description">
                                还剩下 <strong><%=countAnouse%></strong> 台机器
                            </div>
                            <span class="widget-statistic-icon am-icon-credit-card-alt"></span>
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                    <div class="widget widget-primary am-cf">
                        <div class="widget-statistic-header">
                            B区已上机
                        </div>
                        <div class="widget-statistic-body">
                            <div class="widget-statistic-value">
                                <%=50-countBnouse%>台
                            </div>
                            <div class="widget-statistic-description">
                                还剩下 <strong><%=countBnouse%></strong> 台机器
                            </div>
                            <span class="widget-statistic-icon am-icon-credit-card-alt"></span>
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                    <div class="widget widget-purple am-cf">
                        <div class="widget-statistic-header">
                            C区已上机
                        </div>
                        <div class="widget-statistic-body">
                            <div class="widget-statistic-value">
                                <%=50-countCnouse%>台
                            </div>
                            <div class="widget-statistic-description">
                                还剩下 <strong><%=countCnouse%></strong> 台机器
                            </div>
                            <span class="widget-statistic-icon am-icon-support"></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row am-cf">
                <div class="am-u-sm-12 am-u-md-6">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title am-fl">当前各分区机器使用情况</div>
                            <div class="widget-function am-fr">
                                <a href="javascript:;" class="am-icon-cog"></a>
                            </div>
                        </div>
                        <div class="widget-body widget-body-md am-fr">

                            <div class="am-progress-title">A区 <span class="am-fr am-progress-title-more"><%=50-countAnouse%> / 50</span></div>
                            <div class="am-progress">
                                <div class="am-progress-bar" style="width: <%=(50-countAnouse)*100/50%>%"></div>
                            </div>
                            <div class="am-progress-title">B区 <span class="am-fr am-progress-title-more"><%=50-countBnouse%> / 50</span></div>
                            <div class="am-progress">
                                <div class="am-progress-bar  am-progress-bar-warning" style="width: <%=(50-countBnouse)*100/50%>%"></div>
                            </div>
                            <div class="am-progress-title">C区 <span class="am-fr am-progress-title-more"><%=50-countCnouse%> / 50</span></div>
                            <div class="am-progress">
                                <div class="am-progress-bar am-progress-bar-danger" style="width: <%=(50-countCnouse)*100/50%>%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-6">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title am-fl">近一周机器使用情况</div>
                            <div class="widget-function am-fr">
                                <a href="javascript:;" class="am-icon-cog"></a>
                            </div>
                        </div>
                        <div class="widget-body-md widget-body tpl-amendment-echarts am-fr" id="tpl-echart-E">

                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
</div>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/amazeui.datatables.min.js"></script>
<script src="assets/js/dataTables.responsive.min.js"></script>
<script src="assets/js/app.js"></script>
<script>
    function mytime() {
        var a = new Date();
        var b = a.toLocaleTimeString();
        var c = a.toLocaleDateString();
        document.getElementById("time1").innerHTML = c + "&nbsp" + b;
    }
    setInterval(function() {
        mytime()
    }, 1000);
    var echartsE = echarts.init(document.getElementById('tpl-echart-E'));
    option = {
        tooltip: {
            trigger: 'axis'
        },
        grid: {
            top: '3%',
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [{
            type: 'category',
            boundaryGap: false,
            data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
        }],
        yAxis: [{
            type: 'value'
        }],
        textStyle: {
            color: '#838FA1'
        },
        series: [{
            name: '使用总数',
            type: 'line',
            stack: '总量',
            areaStyle: { normal: {} },
            data: [<%=150-safeRecords.get(0).getAnouse()-safeRecords.get(0).getBnouse()-safeRecords.get(0).getCnouse()%>,
                <%=150-safeRecords.get(1).getAnouse()-safeRecords.get(1).getBnouse()-safeRecords.get(1).getCnouse()%>,
                <%=150-safeRecords.get(2).getAnouse()-safeRecords.get(2).getBnouse()-safeRecords.get(2).getCnouse()%>,
                <%=150-safeRecords.get(3).getAnouse()-safeRecords.get(3).getBnouse()-safeRecords.get(3).getCnouse()%>,
                <%=150-safeRecords.get(4).getAnouse()-safeRecords.get(4).getBnouse()-safeRecords.get(4).getCnouse()%>,
                <%=150-safeRecords.get(5).getAnouse()-safeRecords.get(5).getBnouse()-safeRecords.get(5).getCnouse()%>,
                <%=150-safeRecords.get(6).getAnouse()-safeRecords.get(6).getBnouse()-safeRecords.get(6).getCnouse()%>],
            itemStyle: {
                normal: {
                    color: '#1cabdb',
                    borderColor: '#1cabdb',
                    borderWidth: '2',
                    borderType: 'solid',
                    opacity: '1'
                },
                emphasis: {

                }
            }
        }]
    };

    echartsE.setOption(option);
</script>
</body>

</html>
