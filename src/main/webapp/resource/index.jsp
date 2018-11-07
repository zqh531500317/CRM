<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-theme.min.css">
    <script src="<%=request.getContextPath()%>/resource/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
    <script>
        function sub() {
            $("form").submit();
        }
    </script>
    <style>

    </style>
</head>
<body>
<nav class="navbar navbar-inverse">
    ...
</nav>
<div class="container" style="padding-top: 100px">
    <div class="form-horizontal">
        <form action="<%=request.getContextPath()%>/manage/login" method="post">
            <div class="form-group">
                <label for="name" class="col-md-2 text-right col-md-offset-3"><span
                        class="glyphicon glyphicon-user"></span></label>
                <div class="col-md-2">
                    <input type="text" name="name" id="name" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="col-md-2 text-right col-md-offset-3"><span
                        class="glyphicon glyphicon-lock"></span></label>
                <div class="col-md-2">
                    <input type="password" name="psw" id="psw" class="form-control">
                </div>
            </div>
            <div class="col-md-1 col-md-offset-5" style="position: relative;left: 50px">
                <button class="btn btn-info" onclick="sub()">登录</button>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <b class="text-warning">
                        <c:forEach items="${errors}" var="e">
                            ${e.defaultMessage}<br>
                        </c:forEach>
                        ${requestScope.error}
                    </b>
                </div>
            </div>
        </form>


    </div>

</div>
</body>
</html>
