<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>客户信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="<%=request.getContextPath()%>/resource/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-select.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-table.min.css">
    <script src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/bootstrap-select.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/bootstrap-table.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/bootstrap-table-locale-all.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript">
        $(function () {
            cus_dir("#cus_rank_s", 1);
            cus_dir("#cus_dest_s", 2);
            getData();
            //绑定分页栏点击事件
            $("#page button").click(function () {
                var cus_name = $("#cus_name_s").val();
                var cus_dest = $("#cus_dest_s").val();
                var cus_rank = $("#cus_rank_s").val();
                var page = $(this).text();
                getData(cus_name, cus_dest, cus_rank, page);
            })
            //绑定分页搜索框
            $("#cus_search").click(function () {
                var cus_name = $("#cus_name").val();
                var cus_dest = $("#cus_dest").val();
                var cus_rank = $("#cus_rank").val();
                var page = document.getElementById("s").value;
                getData(cus_name, cus_dest, cus_rank, page);
            })
            //绑定分页搜索样式
            $("#s_sign").mouseover(function () {
                $(this).css("background-color", "#87CEFA");
            })
            $("#s_sign").mouseout(function () {
                $(this).css("background-color", "white");
            })
            $("#s_sign").click(function () {
                var cus_name = $("#cus_name_s").val();
                var cus_dest = $("#cus_dest_s").val();
                var cus_rank = $("#cus_rank_s").val();
                var page = document.getElementById("s").value;
                getData(cus_name, cus_dest, cus_rank, page);
                //清空页面搜索栏
                document.getElementById("s").value = '';
            })
            //绑定客户信息搜索框
            $("#cus_search").click(function () {
                var cus_name = $("#cus_name_s").val();
                var cus_dest = $("#cus_dest_s").val();
                var cus_rank = $("#cus_rank_s").val();
                var page = 1;
                getData(cus_name, cus_dest, cus_rank, page);
            })
        })

        //分页栏
        function pageJs(page, total, size) {
            var MaxPage = Math.ceil(total / size);
            $("#last").html(MaxPage);
            $("#now").html(page);
            $("#before").html(page - 1);
            $("#after").html(page + 1);
            $("#first").html(1);
            $("#first").show();
            $("#before").show();
            $("#after").show();
            $("#last").show();
            if (MaxPage == 1 || MaxPage == 0) {
                $("#last").hide();
                $("#before").hide();
                $("#after").hide();
                $("#first").hide();
                return;
            }
            if (page == 1) {
                $("#first").hide();
                $("#before").hide();
            }
            if (page == MaxPage) {
                $("#after").hide();
                $("#last").hide();
            }
            if (page == 2) {
                $("#before").hide();
            }
            if (page == MaxPage - 1) {
                $("#after").hide();
            }
        }

        //字符串拼接函数
        function StringBuffer() {
            this.__strings__ = new Array();
        }

        StringBuffer.prototype.append = function (str) {
            this.__strings__.push(str);
            return this;    //方便链式操作
        }
        StringBuffer.prototype.toString = function () {
            return this.__strings__.join("");
        }

        //获得数据
        function getData(cus_name, cus_dest, cus_rank, page1) {
            var page;
            var size;
            var total;
            var json = new StringBuffer();
            $.get("<%=request.getContextPath()%>/customer/cusListPage", {
                "cus_name": cus_name, "cus_dest": cus_dest,
                "cus_rank": cus_rank, "page": page1,
                "date": new Date().getTime()
            }, function (data) {
                page = data.page;
                size = data.size;
                total = data.total;
                //分页
                pageJs(page, total, size);
                //如果ajax没有接收到数据
                if (data.rows == undefined || data.rows == '') {
                    var obj = {};
                    //清空数据
                    $("#table").bootstrapTable('destroy');

                    createBootstrapTable('#table', '<%=request.getContextPath()%>/customer/getCusList',
                        ['cus_name', 'cus_rank', 'cus_dest', 'linkManList', 'cus_phone', 'cus_mobile', 'cus_email', 'cus_address', 'operate'],
                        ['客户名称', '客户级别', '信息来源', '联系人', '固定电话', '移动电话', '客户邮箱', '客户地址', '操作'], true, '#toolbar', obj);
                    return;
                }
                json.append("[")
                $(data.rows).each(function (i, n) {
                    json.append("{");
                    json.append("cus_name:'").append(n.cus_name).append("',");
                    json.append("cus_dest:'").append(n.cus_dest).append("',");
                    json.append("cus_address:'").append(n.cus_address).append("',");
                    json.append("cus_mobile:'").append(n.cus_mobile).append("',");
                    json.append("cus_phone:'").append(n.cus_phone).append("',");
                    json.append("cus_rank:'").append(n.cus_rank).append("',");
                    json.append("linkManList:'")
                    $(n.linkManList).each(function (x, y) {
                        if (y.lm_name === '' || y.lm_name === undefined)
                            json.append("")
                        json.append(y.lm_name).append(" ")
                    })
                    json.append("'")
                        .append(",operate:'")
                        .append("<a href=\"<%=request.getContextPath()%>/customer/detail?cus_id="+n.id+"\">修改</a>&nbsp;&nbsp;")
                        .append("<a href=\"<%=request.getContextPath()%>/customer/delete/"+n.id+"\">删除</a>")
                        .append("'")
                        .append("},")
                })
                json = json.toString();
                json = json.substring(0, json.length - 1);
                json += "]";
                var obj = eval('(' + json + ')');
                //创建表格
                //清空数据
                $("#table").bootstrapTable('destroy');

                createBootstrapTable('#table', '<%=request.getContextPath()%>/customer/getCusList',
                    ['cus_name', 'cus_rank', 'cus_dest', 'linkManList', 'cus_phone', 'cus_mobile', 'cus_email', 'cus_address', 'operate'],
                    ['客户名称', '客户级别', '信息来源', '联系人', '固定电话', '移动电话', '客户邮箱', '客户地址', '操作'], true, '#toolbar', obj);
            }, 'json');
        }

        //更新数据词典
        function cus_dir(tagId, id) {
            $.post("<%=request.getContextPath()%>/customer/cus_dir", {
                "id": id,
                "date": new Date().getTime()
            }, function (data) {
                $(tagId).empty();
                $(tagId).append("<option value=''>全部</option>");
                $(data).each(function (i, n) {
                    $(tagId).append("<option value='" + n.value + "'>" + n.value + "</option>");
                })
                //刷新后才可见
                $(tagId).selectpicker('val', '');
                $(tagId).selectpicker('refresh');
            }, 'json');
        }

        //更新列表数据
        function init(table, url, params, titles, hasCheckbox, toolbar, json) {
            $(table).bootstrapTable({
                //url: url,                           //请求后台的URL（*）
                //method: 'post',                     //请求方式（*）
                toolbar: '#toolbar',                   //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                // pagination: true,                   //是否显示分页（*）
                sortable: false,                    //是否启用排序
                sortOrder: "asc",                   //排序方式
                // queryParams: queryParams(),           //传递参数（*），这里应该返回一个object，即形如{param1:val1,param2:val2}
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 20,                       //每页的记录行数（*）
                pageList: [20, 50, 100],            //可供选择的每页的行数（*）
                //search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                // strictSearch: true,
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                //   minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                //  uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                  //是否显示父子表
                columns: createCols(params, titles, hasCheckbox),
                data: json
            });
        }

        function createCols(params, titles, hasCheckbox) {
            if (params.length != titles.length)
                return null;
            var arr = [];
            if (hasCheckbox) {
                var objc = {};
                objc.checkbox = true;
                arr.push(objc);
            }
            for (var i = 0; i < params.length; i++) {
                var obj = {};
                obj.field = params[i];
                obj.title = titles[i];
                arr.push(obj);
            }
            return arr;
        }

        function queryParams(params) {
            return {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit,   //页面大小
                offset: params.offset  //页码
                //name: $("#txt_name").val()//关键字查询
            };
        }

        // 传'#table'
        createBootstrapTable = function (table, url, params, titles, hasCheckbox, toolbar, json) {
            init(table, url, params, titles, hasCheckbox, toolbar, json);
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
            <br><br>
            <div id="search">
                <label for="cus_name_s" class="col-md-2 col-xs-2 text-right">客户姓名</label>
                <div class="col-md-2">
                    <input type="text" id="cus_name_s" name="cus_name_s" class="form-control">
                </div>

                <select class="selectpicker" id="cus_dest_s" name="cus_dest_s"
                        data-live-search="true"
                        data-live-search-placeholder="搜索" data-actions-box="true">
                </select>
                <select class="selectpicker" id="cus_rank_s" name="cus_rank_s"
                        data-live-search="true"
                        data-live-search-placeholder="搜索" data-actions-box="true">
                </select>
                <button class="btn btn-default" id="cus_search">搜索</button>
            </div>
            <br><br>
            <div class="cus_table">
                <table id="table">
                </table>
            </div>
            <br><br>
            <div id="page">
                <div class="col-md-2 col-md-offset-8">
                    <div class="input-group" style="text-align: right ;position: relative;top: 5px;">
                        <span class="input-group-addon" id="s_sign"><span
                                class="glyphicon glyphicon-search"></span></span>
                        <input type="text" name="s" id="s">
                    </div>
                </div>
                <div class="col-md-2" style="text-align: right">
                    <div class="btn-group">
                        <button class="btn btn-default" id="first">1</button>
                        <button class="btn btn-default" id="before"></button>
                        <button class="btn btn-default active" id="now" disabled></button>
                        <button class="btn btn-default" id="after"></button>
                        <button class="btn btn-default" id="last"></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
