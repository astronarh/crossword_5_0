<%--
  Created by IntelliJ IDEA.
  User: ShkerdinVA
  Date: 05.03.2018
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Registration</title>
    <link href="<c:url value="/resources/static/css/registration.css" />" rel="stylesheet">
    <link rel="shortcut icon" href="/resources/static/favicon.png?" type="image/png" />

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<ul>
    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
    <li><a href="${pageContext.request.contextPath}/about">About</a></li>
    <li><a href="${pageContext.request.contextPath}/crossword">Crossword</a></li>
    <security:authorize access="hasRole('ROLE_ADMIN')">
        <li><a href="${pageContext.request.contextPath}/create">Create</a></li>
    </security:authorize>
</ul>

<div id="registration-box">
    <form action="registration" th:object="${user}" method='POST'>
        <table style="background: #d2ff9a; border-radius: 10px;">
            <tr>
                <td>
                    <div>
                        <security:authorize access="isAnonymous()">
                            <table cellpadding="3" cellspacing="3">
                                <tr>
                                    <td><a href="/login">Login</a></td>
                                    <td align="right" >Registration Form</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Username
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input id="login-field" placeholder="Enter Username" type='text' name='login' value="${user.getLogin()}">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Email
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input id="email-field" placeholder="Enter Email" type='text' name='email' value="${user.getEmail()}">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Password
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input id="password-field" placeholder="Enter Password" type='password' name='password' />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Confirm password
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input id="confirm-password-field" placeholder="Confirm Password" type='password' name='matchingPassword' />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input id="submit-button" name="submit" type="submit" value="submit" />
                                    </td>
                                </tr>
                            </table>
                        </security:authorize>
                        <security:authorize access="isAuthenticated()">
                            <form action="/logout" method="post">
                                Login as <security:authentication property="principal.username" />
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input id="logout-button" type="submit" value="Logout">
                            </form>
                        </security:authorize>
                    </div>
                </td>
            </tr>
        </table>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
</div>

<div class="msg-box">
    ${message}
</div>

<script>
    $(function () {
        $(".msg-box").delay(1000).animate({opacity:'0'}, 3000,
            function()
            {
                $(this).css({display:'none'});
            });
    });
</script>

</body>
</html>
