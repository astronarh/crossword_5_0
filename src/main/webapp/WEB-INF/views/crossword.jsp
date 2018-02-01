<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: ShkerdinVA
  Date: 25.01.2018
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crossword</title>
    <link href="<c:url value="/resources/static/css/style.css" />" rel="stylesheet">
</head>
<body>
    <ul>
        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/about">About</a></li>
        <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
        <li><a href="${pageContext.request.contextPath}/crossword">Crossword</a></li>
        <li><a href="${pageContext.request.contextPath}/create?column=1&lines=1">Create</a></li>
    </ul>
</body>
</html>
