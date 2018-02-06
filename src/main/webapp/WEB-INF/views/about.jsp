<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: ShkerdinVA
  Date: 24.01.2018
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About</title>
    <link href="<c:url value="/resources/static/css/style.css" />" rel="stylesheet">
</head>
<body>
    <ul>
        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/about">About</a></li>
        <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
        <li><a href="${pageContext.request.contextPath}/crossword">Crossword</a></li>
        <li><a href="${pageContext.request.contextPath}/create">Create</a></li>
    </ul>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <section class="color-11">
        <nav class="cl-effect-16">
            <a href="http://vk.com/astronarh" data-hover="VK">VK</a>
            <a href="#" data-hover="Ссылка 2">Ссылка 2</a>
            <a href="#" data-hover="Ссылка 3">Ссылка 3</a>
            <a href="#" data-hover="Ссылка 4">Ссылка 4</a>
            <a href="#" data-hover="Ссылка 5">Ссылка 5</a>
        </nav>
    </section>
</body>
</html>
