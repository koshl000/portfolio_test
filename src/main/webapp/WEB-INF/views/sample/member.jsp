<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2019-07-08
  Time: 오후 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>member Page</h1>
<form action="/logout" method="post">
    <a href="#" onclick="this.parentNode.submit()">로그아웃</a>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>

</body>
</html>
