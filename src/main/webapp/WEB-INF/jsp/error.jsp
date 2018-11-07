<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>页面错误</title>
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            text-align: center;
        }
    </style>
</head>
<body>
<img src="<%=request.getContextPath()%>/resource/img/error.png">
<p>${requestScope.message}</p>
</body>
</html>
