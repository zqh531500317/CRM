<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>客户详细信息</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-theme.min.css">
    <script src="<%=request.getContextPath()%>/resource/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
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
            <div class="container">
                <form action="<%=request.getContextPath()%>/customer/update" method="post" class="form-horizontal">
                    <input hidden="hidden" name="id" value="${customer.id}">
                    <div class="row form-group">
                        <label for="cus_name" class="col-md-1 col-xs-1 text-right">客户名称</label>
                        <div class="col-md-3 col-xs-3">
                            <input type="text" id="cus_name" name="cus_name" class="form-control"
                                   value="${customer.cus_name}">
                        </div>
                        <label for="cus_rank" class="col-md-1 col-xs-1">客户级别</label>
                        <div class="col-md-3 col-xs-3">
                            <select name="cus_rank" id="cus_rank" class="form-control">
                                <c:forEach items="${cus_rank}" var="cus">
                                    <c:choose>
                                        <c:when test="${cus.value==customer.cus_rank}">
                                            <option value="${cus.value}" selected>${cus.value}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${cus.value}">${cus.value}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="row form-group">
                        <label for="cus_dest" class="col-md-1 col-xs-1 text-right">信息来源</label>
                        <div class="col-md-3 col-xs-3">
                            <select name="cus_dest" id="cus_dest" class="form-control">
                                <c:forEach items="${cus_dest}" var="cus">
                                    <c:choose>
                                        <c:when test="${cus.value==customer.cus_dest}">
                                            <option value="${cus.value}" selected>${cus.value}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${cus.value}">${cus.value}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                        <label for="linkManName" class="col-md-1 col-xs-1">联系人</label>
                        <div class="col-md-3 col-xs-3">
                            <input type="text" name="linkManName"
                                   value="<c:forEach items="${customer.linkManList}" var="linkMan">${linkMan.lm_name},</c:forEach>"
                                   id="linkManName" class="form-control">
                        </div>
                    </div>
                    <div class="row form-group">
                        <label for="cus_phone" class="col-md-1 col-xs-1 text-right">固定电话</label>
                        <div class="col-md-3 col-xs-3">
                            <input type="text" name="cus_phone" value="${customer.cus_phone}" id="cus_phone"
                                   class="form-control">
                        </div>
                        <label for="cus_mobile" class="col-md-1 col-xs-1">移动电话</label>
                        <div class="col-md-3 col-xs-3">
                            <input type="text" name="cus_mobile" id="cus_mobile" value="${customer.cus_mobile}"
                                   class="form-control">
                        </div>
                    </div>

                    <div class="row form-group">
                        <label for="cus_email" class="col-md-1 col-xs-1 text-right">客户邮箱</label>
                        <div class="col-md-3 col-xs-3">
                            <input type="text" name="cus_email" id="cus_email" class="form-control"
                                   value="${customer.cus_email}">
                        </div>
                        <label for="cus_address" class="col-md-1 col-xs-1">客户地址</label>
                        <div class="col-md-3 col-xs-3">
                            <input type="text" name="cus_address" id="cus_address" class="form-control"
                                   value="${customer.cus_address}">
                        </div>
                    </div>
                </form>
                <hr>
                <div class="col-md-2" style="position: relative;left: 300px">
                    <button class="btn btn-success btn-group-lg btn-block" onclick="sub()">提交</button>
                </div>
                <div class="col-md-1">
                    <b>${info}</b>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
