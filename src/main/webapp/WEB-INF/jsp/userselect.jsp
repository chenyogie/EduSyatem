<%@ page import="org.springframework.context.annotation.Import" %><%--
  Created by IntelliJ IDEA.
  User: HS
  Date: 2017/9/20
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table align="center" border="1">
    <tr>
        <td>userName</td>
        <td>password</td>
    </tr>
    <tr>
        <td>${userlogin.username}</td>
        <td>${userlogin.password}</td>
    </tr>
</table>
</body>
</html>
