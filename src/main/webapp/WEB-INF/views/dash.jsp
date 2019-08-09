<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2019-07-23
  Time: 오후 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%--    <link href="/dash/video-js.css" rel="stylesheet">--%>
<%--    <script src="/dash/video.js"></script>--%>
<%--    <script src="//cdn.dashjs.org/latest/dash.all.debug.js"></script>--%>
<%--    <script src="/dash/videojs-dash.min.js"></script>--%>
    <link href="https://unpkg.com/video.js/dist/video-js.css" rel="stylesheet">

    <!--
        -- Include video.js, dash.js, and
        -- videojs-contrib-dash in your page
        -->
    <script src="https://unpkg.com/video.js/dist/video.js"></script>
    <script src="//cdn.dashjs.org/latest/dash.all.debug.js"></script>
    <script src="https://unpkg.com/videojs-contrib-dash/dist/videojs-dash.js"></script>
</head>
<body>
<video id=example-video width=600 height=300 class="video-js vjs-default-skin" controls> </video>

<script>
    var player = videojs('example-video');
    player.src({ src: '/video_source/my_video_manifest.mpd', type: 'application/dash+xml'});
    player.play();
</script>
</body>
</html>
