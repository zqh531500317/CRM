<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>新增客户拜访</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="<%=request.getContextPath()%>/resource/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-select.css">
    <script src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/bootstrap-select.min.js"></script>
    <script type="text/javascript">
        function sub() {

            $("form").submit();
        }
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
            <br><br><br><br><br><br><br><br>
            <div class="container">
                <form action="<%=request.getContextPath()%>/visit/add" method="post" class="form-horizontal">
                    <div class="row form-group">
                        <label for="cus_id" class="col-md-1 col-xs-1 text-right">客户</label>
                        <div class="col-md-3 col-xs-3">
                            <select class="selectpicker" id="cus_id" name="cus_id"
                                    data-live-search="true"
                                    data-live-search-placeholder="搜索" data-actions-box="true">
                                <c:forEach items="${customerList}" var="customer">
                                    <option value="${customer.id}">${customer.cus_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <label for="lm_id" class="col-md-1 col-xs-1 text-right">联系人</label>
                        <div class="col-md-3 col-xs-3">
                            <select class="selectpicker" id="lm_id" name="lm_id"
                                    data-live-search="true"
                                    data-live-search-placeholder="搜索" data-actions-box="true">
                                <c:forEach items="${linkManList}" var="linkMan">
                                    <option value="${linkMan.id}">${linkMan.lm_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="row form-group">
                        <label for="address" class="col-md-1 col-xs-1 text-right">地址</label>
                        <div class="col-md-3 col-xs-3">
                            <input type="text" name="address" id="address" class="form-control">
                        </div>
                        <label for="date" class="col-md-1 col-xs-1" style="position: relative;left: 30px">时间</label>
                        <div class="col-md-3 col-xs-3">
                            <input type="date" name="date" id="date" class="form-control">
                        </div>
                    </div>

                </form>
                <hr>
                <div class="col-md-2" style="position: relative;left: 300px">
                    <button class="btn btn-info btn-group-lg btn-block" onclick="sub()">提交</button>
                </div>
                <div class="col-md-1 text-info">${info}</div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
