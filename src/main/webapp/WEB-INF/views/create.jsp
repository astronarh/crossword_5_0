<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ShkerdinVA
  Date: 25.01.2018
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
    <link href="<c:url value="/resources/static/css/style.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/static/js/script.js" />"></script>
</head>
<body>
    <div id="TB_overlay"></div>

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

    <div class="create" align="center">
        <form method="get" action="${pageContext.request.contextPath}/create">
            <jsp:text>Size:</jsp:text>
            <select name="column">
                <c:forEach var="horizontal" items="${horizontal}">
                    <option value="${horizontal}">${horizontal}</option>
                </c:forEach>
            </select>
            <select name="lines">
                <c:forEach var="vertical" items="${vertical}">
                    <option value="${vertical}">${vertical}</option>
                </c:forEach>
            </select>
            <input type="submit" name="button1" value="redraw"/>
        </form>
    </div>
    <c:if test="${lines != null}">
        <form:form method="post" action="/save" commandName="cells">
            <input type="hidden" name="size" value="${column.size()} ${lines.size()}"/>
            <%int count = 0;%>
            <table>
                <tbody>
                <c:forEach var="lines" items="${lines}">
                    <tr>
                        <c:forEach var="column" items="${column}">
                            <td id="td ${lines} ${column}">
                                <div id="div ${lines} ${column}" style="width: 50px; height: 50px; background-image: url(resources/static/images/arrows/00.png);" ondblclick="select('${lines} ${column}')">
                                    <input type="text" id="letter ${lines} ${column}" maxlength="1" style="display: none;" onkeyup="changeletter('${lines} ${column}')">
                                    <textarea id="qestion ${lines} ${column}" cols="30" rows="10" style="display: none;" onkeyup="changequestion('${lines} ${column}')"></textarea>
                                    <input type="hidden" id="hiddenletter ${lines} ${column}" name="cells[<%=count%>].letter" value=""/>
                                    <input type="hidden" id="hiddenarrow ${lines} ${column}" name="cells[<%=count%>].arrow" value="0"/>
                                    <input type="hidden" id="hiddenquestion ${lines} ${column}" name="cells[<%=count%>].question" value=""/>
                                    <div id="selectDiv ${lines} ${column}" style="display: none; position: absolute; top: 50%; bottom: 50%; z-index: 101;">
                                        Select type:
                                        <br/>
                                        <select id="select ${lines} ${column}" onChange="changeSelect('${lines} ${column}')">
                                            <option value="0"></option>
                                            <option value="1">Буква</option>
                                            <option value="2">Буква + стрелка</option>
                                            <option value="3">Вопрос</option>
                                        </select>
                                    </div>
                                </div>
                            </td>
                            <%count++;%>
                        </c:forEach>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <input type="submit" value="Create"/>
        </form:form>
    </c:if>


    <form:form>
        <c:forEach var="lines" items="${lines}">
            <c:forEach var="column" items="${column}">
                <table id="table ${lines} ${column}" width="200" height="200" border="1" cellpadding="0" cellspacing="0" style="display: none; position: absolute; top: 50px; left: 50px; z-index: 101; border-width: 0px;">
                    <tbody>
                    <tr>
                        <td><img src="resources/static/images/arrows/00.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '00.png')"/></td>
                        <td><img src="resources/static/images/arrows/01.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '01.png')"/></td>
                        <td><img src="resources/static/images/arrows/02.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '02.png')"/></td>
                        <td><img src="resources/static/images/arrows/03.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '03.png')"/></td>
                    </tr>
                    <tr>
                        <td><img src="resources/static/images/arrows/04.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '04.png')"/></td>
                        <td><img src="resources/static/images/arrows/05.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '05.png')"/></td>
                        <td><img src="resources/static/images/arrows/06.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '06.png')"/></td>
                        <td><img src="resources/static/images/arrows/07.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '07.png')"/></td>
                    </tr>
                    <tr>
                        <td><img src="resources/static/images/arrows/08.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '08.png')"/></td>
                        <td><img src="resources/static/images/arrows/09.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '09.png')"/></td>
                        <td><img src="resources/static/images/arrows/10.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '10.png')"/></td>
                        <td><img src="resources/static/images/arrows/11.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '11.png')"/></td>
                    </tr>
                    <tr>
                        <td><img src="resources/static/images/arrows/12.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '12.png')"/></td>
                        <td><img src="resources/static/images/arrows/13.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '13.png')"/></td>
                        <td><img src="resources/static/images/arrows/14.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '14.png')"/></td>
                        <td><img src="resources/static/images/arrows/00.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '00.png')"/></td>
                    </tr>
                    </tbody>
                </table>
            </c:forEach>
        </c:forEach>
    </form:form>
</body>
</html>
