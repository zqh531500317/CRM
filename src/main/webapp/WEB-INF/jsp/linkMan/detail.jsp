<%@ page import="com.zqh.crm.pojo.LinkMan" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>联系人详细信息</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-theme.min.css">
    <script src="<%=request.getContextPath()%>/resource/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
        })

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
            <br><br><br><br><br><br><br><br>
            <div class="container">
                <form action="<%=request.getContextPath()%>/linkMan/update" method="post" class="form-horizontal"
                      enctype="multipart/form-data">
                    <input name="id" value="${linkMan.id}" hidden>
                    <div class="row form-group">
                        <label for="lm_name" class="col-md-1 col-xs-1 text-right">联系人名称</label>
                        <div class="col-md-3 col-xs-3">
                            <input type="text" id="lm_name" name="lm_name" class="form-control"
                                   value="${linkMan.lm_name}">
                        </div>
                        <label for="lm_sex" class="col-md-1 col-xs-1">性别</label>
                        <div class="col-md-3 col-xs-3">
                            <select name="lm_sex" id="lm_sex" class="form-control">
                                <c:choose>
                                    <c:when test="${linkMan.lm_sex}">
                                        <option value="1" selected>男</option>
                                        <option value="0">女</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="1">男</option>
                                        <option value="0" selected>女</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label for="lm_phone" class="col-md-1 col-xs-1 text-right">固定电话</label>
                        <div class="col-md-3 col-xs-3">
                            <input type="text" name="lm_phone" id="lm_phone" class="form-control"
                                   value="${linkMan.lm_phone}">
                        </div>
                        <label for="lm_mobile" class="col-md-1 col-xs-1">移动电话</label>
                        <div class="col-md-3 col-xs-3">
                            <input type="text" name="lm_mobile" id="lm_mobile" class="form-control"
                                   value="${linkMan.lm_mobile}">
                        </div>
                    </div>
                    <div class="row form-group">
                        <label for="filename" class="col-md-1 col-xs-1 text-right">附件名</label>
                        <div class="col-md-3 col-xs-3">
                            <input type="text" id="filename" class="form-control" value="${linkMan.lm_file}" disabled>
                        </div>
                        <label for="file" class="col-md-1 col-xs-1"
                               style="position: relative;left: 10px">上传附件/修改附件</label>
                        <div class="col-md-3 col-xs-3">
                            <input type="file" name="file" id="file" class="form-control">
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
