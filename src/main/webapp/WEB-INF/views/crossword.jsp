<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="v" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <li><a href="${pageContext.request.contextPath}/create">Create</a></li>
    </ul>
    <br/>
    <br/>
    <br/>
    <br/>
    <c:if test="${crosswordList != null}">
        <table align="center">
            <tr>
                <td>ID</td>
                <td>ROWS</td>
                <td>COLUMNS</td>
                <td>IDBEGIN</td>
                <td>IDEND</td>
                <td></td>
                <td></td>
            </tr>
            <c:forEach var="crosswordList" items="${crosswordList}">
                <tr>
                    <td>${crosswordList.id}</td>
                    <td>${crosswordList.rows}</td>
                    <td>${crosswordList.columns}</td>
                    <td>${crosswordList.idBegin}</td>
                    <td>${crosswordList.idEnd}</td>
                    <td><a href="crossword/${crosswordList.id}">SELECT</a> </td>
                    <td><a style="color: red" href="crosswordDelete/${crosswordList.id}">DELETE</a> </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${crosswordList == null}">
        <table align="center">
            <c:forEach var="row" items="${cells}">
                <tr>
                    <v:forEach var="column" items="${row}">
                        <c:if test="${column.getLetter() != ''}">
                            <c:if test="${column.getArrow() > 0}">
                                <c:if test="${column.getArrow() > 9}">
                                    <td>
                                        <div style="width: 50px; height: 50px; background-image: url(/resources/static/images/arrows/${column.arrow}.png);">
                                            <input type = "text" maxlength=1>
                                        </div>
                                    </td>
                                </c:if>
                                <c:if test="${column.getArrow() < 10 && column.getArrow() > 0}">
                                    <td>
                                        <div style="width: 50px; height: 50px; background-image: url(/resources/static/images/arrows/0${column.arrow}.png);">
                                            <input type = "text" maxlength=1>
                                        </div>
                                    </td>
                                </c:if>
                            </c:if>
                            <c:if test="${column.getArrow() == 0}">
                                <td>
                                    <div style="width: 50px; height: 50px; background-image: url(/resources/static/images/arrows/${column.arrow}.png);">
                                        <input type = "text" maxlength=1>
                                    </div>
                                </td>
                            </c:if>
                        </c:if>
                        <c:if test="${column.question != ''}">
                            <td>
                                <div class="question" style="width: 50px; height: 50px; background-image: url(/resources/static/images/arrows/${column.arrow}.png);">
                                    <c:out value="${column.getQuestion()}" />
                                </div>
                            </td>
                        </c:if>
                    </v:forEach>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</body>
</html>
