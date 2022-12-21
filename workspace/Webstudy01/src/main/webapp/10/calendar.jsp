<%@page import="java.util.Optional"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	DateFormatSymbols dfs = DateFormatSymbols.getInstance(Locale.KOREAN);
	String[] weekDays = dfs.getWeekdays();
	pageContext.setAttribute("weekDays", weekDays);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includee/preScript.jsp" />
</head>
<body>
<c:set var="dayCount" value="1"/>
<c:set var="offset" value="${param['firstDay']}"/>
<c:set var="date" value="${dayCount - offset}"/>
${param['year']}
${param['month']}
${param['first']}
${param['firstDay']}
${param['last']}
<h1>달력</h1>
	
	<span>오늘 : </span>
	<span id="todate"></span>
	
	<br><br>
	<input id="year" type="number" min="1" max="10000" onchange="calendar()" value="${param['year']}">년
	<input id="month" type="number" min="1" max="12" onchange="calendar()" value="${param['month']}" />월
	<button id="btn">달력 보기</button>
<table border="1px">
<thead>
	<tr>
		<c:forEach var="idx" begin="<%= Calendar.SUNDAY %>" end="<%= Calendar.SATURDAY %>">
		<td>${weekDays[idx]}</td>
		</c:forEach>
	</tr>
</thead>
<tbody>
<c:forEach begin="1" end="6">
	<tr>
	<c:forEach begin="<%= Calendar.SUNDAY %>" end="<%= Calendar.SATURDAY %>">
		<c:choose>
			<c:when test="${date lt 1}">
				<td></td>
			</c:when>
			<c:when test="${date gt param['last']}">
				<td></td>
			</c:when>
			<c:otherwise>
				<td>${date}</td>
				<c:set var="dayCount" value="${dayCount + 1}"/>
			</c:otherwise>
		</c:choose>
		<c:set var="date" value="${date + 1}"/>
	</c:forEach>
	</tr>
</c:forEach>
</tbody>
</table>
<div id="disp"></div>
<script>
var today = new Date();
document.querySelector("#todate").innerHTML = today;
document.querySelector("#year").value = today.getFullYear();
document.querySelector("#month").value = today.getMonth() + 1;

function date(when){
	let date = when.getDate();
	return date;
}

$("#btn").on("click", function(){
	var year = document.querySelector("#year").value;
	var month = document.querySelector("#month").value;

	var monthFirst = new Date(year, month - 1, 1);
	var monthLast = new Date(year, month, 0);

	var first = date(monthFirst);
	var firstDay = monthFirst.getDay();
	var last = date(monthLast);
	
	location.href = "http://localhost:9999/Webstudy01/10/calendar.jsp?year=" + year + "&month=" + month + "&first=" + first + "&firstDay=" + firstDay + "&last=" + last;
});
</script>
</body>
</html>