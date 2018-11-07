<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>客户列表</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-theme.min.css">
    <script src="<%=request.getContextPath()%>/resource/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
    <script type="text/javascript">

    </script>
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
                        <li><a href="<%=request.getContextPath()%>/visit/addView"><i class="glyphicon glyphicon-user"></i>新增客户拜访</a></li>
                        <li><a href="<%=request.getContextPath()%>/visit/pageView"><i class="glyphicon glyphicon-th-list"></i>客户拜访列表</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#total" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        统计分析
                        <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul id="total" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li><a href="<%=request.getContextPath()%>/total/cus/rank"><i class="glyphicon glyphicon-calendar"></i>客户级别统计</a></li>
                        <li><a href="<%=request.getContextPath()%>/total/cus/dest"><i class="glyphicon glyphicon-calendar"></i>客户来源统计</a></li>
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
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <tr>
                            <td>客户名称</td>
                            <td>客户级别</td>
                            <td>信息来源</td>
                            <td>联系人</td>
                            <td>固定电话</td>
                            <td>移动电话</td>
                            <td>客户邮箱</td>
                            <td>客户地址</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${customers}" var="cus">
                            <tr>
                                <td>${cus.cus_name}</td>
                                <td>${cus.cus_rank}</td>
                                <td>${cus.cus_dest}</td>
                                <td>
                                    <c:forEach items="${cus.linkManList}" var="linkMan">
                                        ${linkMan.lm_name}&nbsp;&nbsp;
                                    </c:forEach>
                                </td>
                                <td>${cus.cus_phone}</td>
                                <td>${cus.cus_mobile}</td>
                                <td>${cus.cus_email}</td>
                                <td>${cus.cus_address}</td>
                                <td>
                                    <a href="<%=request.getContextPath()%>/customer/detail?cus_id=${cus.id}">修改</a>
                                    &nbsp;&nbsp;
                                    <a href="<%=request.getContextPath()%>/customer/delete/${cus.id}" onclick="return confirm('确认要删除吗');">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <b>${info}</b>
        </div>
    </div>
</div>
</body>
</html>
