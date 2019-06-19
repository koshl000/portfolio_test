<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Home</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<body>
<table id="myTable" class="display">
    <thead>
    <tr>
        <th>id</th>
        <th>first_name</th>
        <th>last_name</th>
        <th>email1</th>
    </tr>
    </thead>
</table>
</body>
<script>
    var table = $('#myTable').DataTable({
        "processing":true,
        "serverSide":true,
        "ajax": {
            'url': '${pageContext.request.contextPath}/',
            //'type': 'POST',
            'dataSrc': ''
        },
        "columns": [
            {"data": "id"},
            {"data": "name"},
            {"data": "info"}
        ],
    });
</script>
<script>
    <%--fetch('${pageContext.request.contextPath}/resources/MOCK_DATA.json')--%>
    <%--    .then(res => res.json())--%>
    <%--.then((out) => {--%>
    <%--    console.log('Output: ', out);--%>
    <%--}).catch(err => console.error(err));--%>
</script>
</html>
