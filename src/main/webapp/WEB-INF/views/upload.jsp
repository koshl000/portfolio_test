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
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/uploadFile.js"></script>
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
    <input type="submit" name="uploadBtn" value="전송"/>
</form:form>
</body>
<script>
    $(document).ready(function () {
        $("#uploadBtn").on("click", function (e) {
            e.preventDefault();
            var form = $('#data');
            var formData = new FormData(form);
            $.ajax({
                url: "/save",
                type: "POST",
                enctype: 'multipart/form-data',
                data: formData,
                processData: false,
                contentType: false,
                cache: false,
                // dataType:'text',
                timeout: 600000,
                success: function (data) {
                    alert('파일 업로드가 완료되었습니다.');
                }
            });
        });
    });
</script>
</html>
