<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
<body background="/resources/static/images.background/tree%20top.jpg" style="background-position: right bottom; background-repeat: no-repeat;">
    <ul>
        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/about">About</a></li>
        <li><a href="${pageContext.request.contextPath}/crossword">Crossword</a></li>
        <security:authorize access="hasRole('ROLE_ADMIN')">
            <li><a href="${pageContext.request.contextPath}/create">Create</a></li>
        </security:authorize>
    </ul>
    <security:authorize access="isAnonymous()">
        <div id="login-div">
            <a href="${pageContext.request.contextPath}/login">login</a>
        </div>
    </security:authorize>
    <security:authorize access="isAuthenticated()">
        <div id="logout-div">
            <form action="/logout" method="post">
                <a href="${pageContext.request.contextPath}/aboutUser"><security:authentication property="principal.username" /></a>
                <input id="logout-button" type="submit" value="Logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </div>
    </security:authorize>
    <div class="test">
        <section class="color-11">
            <br/>
            <nav class="cl-effect-16">
                <a href="http://vk.com/astronarh" target="_blank" data-hover="VK">VK</a>
                <a href=""> | </a>
                <a href="https://github.com/astronarh" target="_blank" data-hover="github">github</a>
                <a href=""> | </a>
                <a href=mailto:astronarh@gmail.com" data-hover="gmail">gmail</a>
            </nav>
            <br/>
        </section>
    </div>
</body>
</html>
