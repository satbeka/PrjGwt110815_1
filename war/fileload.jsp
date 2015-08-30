<%@ page import="com.mySampleApplication.server.common.FileLoad" %>
<%--
  Created by IntelliJ IDEA.
  User: SAbdikalikov
  Date: 30.08.2015
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  String url = request.getParameter( "fileURL" );
  url="http://www.kase.kz/files/for_shareholders/ustav.pdf";
  System.out.println("url="+url);

  FileLoad.download(url);
%>
</body>
</html>
