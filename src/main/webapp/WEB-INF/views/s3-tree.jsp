<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2019-07-22
  Time: 오전 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/tree/dist/themes/default/style.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/tree/dist/jstree.min.js"></script>

    <script>
        $(function () {
            $('#jstree_demo_div').jstree();
        });
    </script>
</head>

<body>
<div id="jstree_demo_div">
    <ul>
        <li>Root node 1
            <ul>
                <li>Child node 1</li>
                <li><a href="#">Child node 2</a></li>
            </ul>
        </li>
    </ul>
</div>
</body>

</html>
