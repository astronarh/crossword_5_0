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
    <link href="<c:url value="/resources/static/css/tableStyle.css" />" rel="stylesheet">
</head>
<body background="/resources/static/images.background/crosswordbackground.jpg" style="background-repeat: repeat-x; background-color: #d2ff9a">
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

        <c:url value="crossword" var="prev">
            <c:param name="page" value="${page-1}"/>
        </c:url>
        <c:if test="${page > 1}">
            <center><a href="<c:out value="${prev}" /> ">Prev</a></center>>
        </c:if>

        <table align="center" class="bordered" cellspacing='0' width="600">
            <thead>
                <tr>
                    <td>id</td>
                    <td>rows</td>
                    <td>columns</td>
                    <td>idbegin</td>
                    <td>idend</td>
                    <td height="27" width="27"></td>
                    <td height="27" width="27"></td>
                </tr>
            </thead>
            <c:forEach var="crosswordList" items="${crosswordList}">
                <tr>
                    <td>${crosswordList.id}</td>
                    <td>${crosswordList.rows}</td>
                    <td>${crosswordList.columns}</td>
                    <td>${crosswordList.idBegin}</td>
                    <td>${crosswordList.idEnd}</td>
                    <td><a href="crossword/${crosswordList.id}" title="select"><img width="27" height="27" src="/resources/static/images.rest/select.png"/></a> </td>
                    <td><a href="crosswordDelete/${crosswordList.id}" title="delete"><img width="27" height="27" src="/resources/static/images.rest/delete.png"/></a> </td>
                </tr>
            </c:forEach>
        </table>

        <br/>
        <c:url value="crossword" var="next">
            <c:param name="page" value="${page + 1}"/>
        </c:url>
        <c:if test="${page + 1 <= maxPages}">
            <center><a href='<c:out value="${next}" />'>Next</a></center>>
        </c:if>

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
