<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2019-07-31
  Time: 오후 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
    <script type="text/javascript">
        $(function () {
            $('button[type=submit]').click(function (e) {
                e.preventDefault();
                //Disable submit button
                $(this).prop('disabled', true);

                var form = document.forms[0];
                var formData = new FormData(form);

                // Ajax call for file uploaling
                var ajaxReq = $.ajax({
                    url: 'fileUpload',
                    type: 'POST',
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    xhr: function () {
                        var xhr = $.ajaxSettings.xhr();

                        //Set onprogress event handler
                        xhr.upload.onprogress = function (event) {
                            var perc = Math.round((event.loaded / event.total) * 100);
                            $('#progressBar').text(perc + '%');
                            $('#progressBar').css('width', perc + '%');
                        };
                        return xhr;
                    },
                    beforeSend: function (xhr) {
                        //Reset alert message and progress bar
                        $('#alertMsg').text('');
                        $('#progressBar').text('');
                        $('#progressBar').css('width', '0%');
                    }
                });

                // Called on success of file upload
                ajaxReq.done(function (msg) {
                    $('#alertMsg').text(msg);
                    $('input[type=file]').val('');
                    $('button[type=submit]').prop('disabled', false);
                });

                // Called on failure of file upload
                ajaxReq.fail(function (jqXHR) {
                    $('#alertMsg').text(jqXHR.responseText + '(' + jqXHR.status +
                        ' - ' + jqXHR.statusText + ')');
                    $('button[type=submit]').prop('disabled', false);
                });
            });
        });
    </script>
</head>
<body>
---------------------------------------------<br>
-----------------------------------------------<br>
------------------------------------------------<br>
<div class="container">
    <h2>Spring MVC - File Upload Example With Progress Bar</h2>
    <hr>
    <!-- File Upload From -->
    <form action="fileUpload" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label>Select File</label>
            <input class="form-control" type="file" name="file">
        </div>
        <div class="form-group">
            <button class="btn btn-primary" type="submit">Upload</button>
        </div>
    </form>
    <br/>

    <!-- Bootstrap Progress bar -->
    <div class="progress">
        <div id="progressBar" class="progress-bar progress-bar-success" role="progressbar"
             aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">0%
        </div>
    </div>

    <!-- Alert -->
    <div id="alertMsg" style="color: red;font-size: 18px;"></div>
</div>
<input type="text" id="message"/>

<input type="button" id="sendBtn" value="전송"/>

<div id="data"></div>
</body>
<script>
    $(document).ready(function () {

    });


    // 웹소켓을 지정한 url로 연결한다.

    let sock = new SockJS("<c:url value="/socket"/>");

    sock.onmessage = onMessage;

    sock.onclose = onClose;


    // 메시지 전송

    function sendMessage() {

        sock.send($("#message").val());

    }


    // 서버로부터 메시지를 받았을 때

    function onMessage(msg) {

        var data = msg.data;

        $("#data").append(data + "<br/>");

    }


    // 서버와 연결을 끊었을 때

    function onClose(evt) {

        $("#data").append("연결 끊김");

    }

</script>
</html>
