<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2019-06-26
  Time: 오후 7:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form commandName="formVO" id="data" enctype="multipart/form-data">
    <table>
        <tr>
            <td><form:label path="name">이름</form:label></td>
            <td><form:input path="name"/></td>
        </tr>
        <tr>
            <td>아이디</td>
            <td><form:input path="id"/></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><form:input path="pwd"/></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><form:input path="email"/></td>
        </tr>
        <tr>
            <td>파일</td>
            <td><input type="file" name="files" multiple></td>
        </tr>
    </table>
</form:form>
</body>
</html>
