<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<html>
<head>
    <style>
        .blue-button{
            background: #25A6E1;
            filter: progid: DXImageTransform.Microsoft.gradient( startColorstr='#25A6E1',endColorstr='#188BC0',GradientType=0);
            padding:3px 5px;
            color:#fff;
            font-family:'Helvetica Neue',sans-serif;
            font-size:12px;
            border-radius:2px;
            -moz-border-radius:2px;
            -webkit-border-radius:4px;
            border:1px solid #1A87B9
        }
        table {
            font-family: "Helvetica Neue", Helvetica, sans-serif;
            width: 50%;
        }
        th {
            background: SteelBlue;
            color: white;
        }
        td,th{
            border: 1px solid gray;
            width: 25%;
            text-align: left;
            padding: 5px 10px;
        }
    </style>
</head>
<body>
<form:form method="post" modelAttribute="cell" action="/SpringMVCHibernateCRUDExample/addCell">
    <table>
        <tr>
            <th colspan="2">Add Cell</th>
        </tr>


        <tr>
            <td colspan="2"><input type="submit"
                                   class="blue-button" /></td>
        </tr>
    </table>
</form:form>
</br>
<h3>Cell List</h3>
<c:if test="${!empty listOfCell}">
    <table class="tg">
        <tr>
            <th width="80">Id</th>
            <th width="120">letter</th>
            <th width="120">arrow</th>
            <th width="60">question</th>
        </tr>
        <c:forEach items="${listOfCell}" var="cell">
            <tr>
                <td>${cell.id}</td>
                <td>${cell.letter}</td>
                <td>${cell.arrow}</td>
                <td>${cell.question}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
