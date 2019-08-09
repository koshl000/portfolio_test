<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2019-07-25
  Time: 오후 7:44
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
</head>
<body>
<script>
    var xhr = new XMLHttpRequest();
    // var fd = new FormData();
    // var file = new File(["foo"], "foo.txt", {
    //     type: "text/plain",
    // });
    // fd.append("multipartFile", file);
    // xhr.upload.addEventListener("progress", onUploadProgress, false);
    // xhr.addEventListener("load", onUploadComplete, false);
    // xhr.addEventListener("error", onUploadFailed, false);
    xhr.open("post","ajaxtest11",true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == XMLHttpRequest.DONE) {
            alert(xhr.responseText);
        }
    }
    xhr.send('abc');
    // $(document).ready(function () {
    //     $.ajax({
    //         type:'post',
    //         url:'ajaxtest11',
    //         success:alert('success')
    //     });
    // })
</script>
</body>
</html>
