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
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<link rel="stylesheet" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<body>
<table id="myTable" class="display">
    <thead>
    <tr>
        <th>userid</th>
        <th>first_name</th>
        <th>last_name</th>
    </tr>
    </thead>
</table>
</body>
<script type="text/javascript">
    function connect() {
        var text="abc";
        var text2="def";
        var socket = new SockJS('${pageContext.request.contextPath}/websocketHandler');  //websocket이아닌 SockJS로 접속한다.
        stompClient = Stomp.over(socket); //stompClient에 socket을 넣어준다.
        stompClient.connect({}, function() { //접속
            stompClient.send('/app/in/tt', {}, JSON.stringify({'id':text, 'pw':text2}));

            stompClient.subscribe('/topic/in', function(msg) {
                alert(msg);
            });
        });
    }
    connect();
</script>
<%--websocket--%>
<%--<script>--%>
<%--    var sock=new SockJS('http://localhost/socket');--%>
<%--    sock.onopen=function(){--%>
<%--        console.log('open');--%>
<%--        sock.send('test');--%>
<%--    };--%>

<%--    sock.onmessage=function(e){--%>
<%--        console.log('message',e.data);--%>
<%--    }--%>
<%--</script>--%>
<script>
    <%--$(function () {--%>
    <%--    var table = $("#myTable").DataTable({--%>
    <%--        processing:true,--%>
    <%--        serverSide:true,--%>
    <%--        paging:true,--%>
    <%--        // order:[],--%>
    <%--        // draw:3,--%>
    <%--        // recordsTotal:50,--%>
    <%--        // recordsFiltered:50,--%>
    <%--        ajax: {--%>
    <%--            'url': '${pageContext.request.contextPath}/',--%>
    <%--            'type': 'POST',--%>
    <%--            'dataType':'JSON',--%>
    <%--            'dataSrc':'',/*dataSrc는 필수로 공백*/--%>
    <%--        },--%>
    <%--        columns: [--%>
    <%--            {"data": "USERID"},--%>
    <%--            {"data": "INFO"},--%>
    <%--            {"data": "NAME"}--%>
    <%--        ],--%>
    <%--    });--%>
    <%--});--%>

</script>
<script>
    <%--fetch('${pageContext.request.contextPath}/resources/MOCK_DATA.json')--%>
    <%--    .then(res => res.json())--%>
    <%--.then((out) => {--%>
    <%--    console.log('Output: ', out);--%>
    <%--}).catch(err => console.error(err));--%>
</script>
</html>
