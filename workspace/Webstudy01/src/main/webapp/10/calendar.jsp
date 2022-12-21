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
<c:set var="offset" value="4"/>
<c:set var="date" value="${dayCount - offset}"/>
<h1>달력</h1>
	
	<span>오늘 : </span>
	<span id="todate"></span>
	
	<br><br>
	<input id="year" type="number" min="1" max="10000" onchange="calendar()">년
	<input id="month" type="number" min="1" max="12" onchange="calendar()">월
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
			<c:when test="${date gt 31}">
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
<script>
var today = new Date();
document.querySelector("#todate").innerHTML = today;
document.querySelector("#year").value = today.getFullYear();
document.querySelector("#month").value = today.getMonth() + 1;

function date(when){
	let date = when.getDate();
	return date;
}

function calendar() {
	var year = document.querySelector("#year").value;
	var month = document.querySelector("#month").value;

	var monthFirst = new Date(year, month - 1, 1);
	var monthLast = new Date(year, month, 0);

	var first = date(monthFirst);
	var firstDay = monthFirst.getDay();
	var last = date(monthLast);
	
	var data = {
		first : first,
		firstDay : firstDay,
		last : last
	}
	
	$.ajax({
		url : "/Webstudy01/10/calendar.jsp",
		data : data,
		dataType : "json",
		success : function(resp) {
			console.log(resp);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}


</script>
</body>
</html>