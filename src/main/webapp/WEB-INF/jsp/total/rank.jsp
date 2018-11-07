<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>客户级别统计</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="<%=request.getContextPath()%>/resource/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-theme.min.css">
    <script src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/echarts.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <ul id="main-nav" class="nav nav-tabs nav-stacked navbar-inverse">
                <li>
                    <a href="<%=request.getContextPath()%>/manage/">
                        <i class="glyphicon glyphicon-th-large"></i>
                        HOME<br>
                    </a>
                </li>
                <li>
                    <a class="text-left">当前用户:${sessionScope.manage.manageName}</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/manage/logout">退出登录</a>
                </li>
                <li>
                    <a href="#customer" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        客户管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="customer" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="<%=request.getContextPath()%>/customer/addView"><i
                                class="glyphicon glyphicon-user"></i>新增客户</a></li>
                        <li><a href="<%=request.getContextPath()%>/customer/manageView"><i
                                class="glyphicon glyphicon-th-list"></i>客户列表</a></li>
                        <li><a href="<%=request.getContextPath()%>/customer/cusList"><i
                                class="glyphicon glyphicon-th-list"></i>分页客户列表</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#linkman" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        联系人管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="linkman" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="<%=request.getContextPath()%>/linkMan/addView"><i
                                class="glyphicon glyphicon-user"></i>新增联系人</a></li>
                        <li><a href="<%=request.getContextPath()%>/linkMan/pageView"><i
                                class="glyphicon glyphicon-th-list"></i>联系人列表</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#customer_visit" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        客户拜访管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="customer_visit" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="<%=request.getContextPath()%>/visit/addView"><i
                                class="glyphicon glyphicon-user"></i>新增客户拜访</a></li>
                        <li><a href="<%=request.getContextPath()%>/visit/pageView"><i
                                class="glyphicon glyphicon-th-list"></i>客户拜访列表</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#total" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        统计分析
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="total" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="<%=request.getContextPath()%>/total/cus/rank"><i
                                class="glyphicon glyphicon-calendar"></i>客户级别统计</a></li>
                        <li><a href="<%=request.getContextPath()%>/total/cus/dest"><i
                                class="glyphicon glyphicon-calendar"></i>客户来源统计</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#system" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        系统管理
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                        <span class="label label-info pull-right">维护中</span>
                    </a>
                    <ul id="system" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="#"><i class="glyphicon glyphicon-fire"></i></a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-fire"></i></a></li>
                    </ul>
                </li>
            </ul>

        </div>
        <div class="col-md-10">
            <div class="container">
                <div class="row">
                    <div class="col-md-6" style="width: 600px;height: 400px" id="chart1">
                    </div>
                    <div class="col-md-6" style="width: 600px;height: 400px" id="chart2">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    //柱形图
    var myChart = echarts.init(document.getElementById('chart1'),'light');
    myChart.showLoading();
    $.get('<%=request.getContextPath()%>/total/rank/bar/json').done(function (data) {
        myChart.hideLoading();
        var option = {
            title: {
                text: '客户级别统计柱形图'
            },
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data: ['销量']
            },
            xAxis: {
                data: data.name

            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: data.data
            }]
        };
        myChart.setOption(option);
    });
    //饼图
    var myChart1 = echarts.init(document.getElementById('chart2'), 'light');
    myChart1.showLoading();
    $.get('<%=request.getContextPath()%>/total/rank/pie/json').done(function (data) {
        myChart1.hideLoading();
        var option1 = {
            title: {
                text: '客户级别统计饼图'
            },
            series: [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius: '55%',
                    //切换南丁格尔图
                    //roseType: 'angle',
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 200,
                            shadowOffsetX: 0,
                            shadowOffsetY: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    },
                    data: data
                }
            ]
        };
        myChart1.setOption(option1);
    });
</script>

</body>
</html>
