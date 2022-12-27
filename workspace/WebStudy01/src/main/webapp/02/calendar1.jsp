<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		border: 1px solid black;
		width: 300px;
		hegith: 300px;
	}
</style>
</head>
<body>
	<h1>달력</h1>
	<h6>*2차원 배열로 하면 훨씬 쉬울 것 같으니 나중에 해보기</h6>
	
	<span>오늘 : </span>
	<span id="todate"></span>
	
	<br><br>
	
	<input id="year" type="number" min="2000" max="2040" onchange="calendar()">년
	<input id="month" type="number" min="1" max="12" onchange="calendar()">월
	
	<table>
		<tr id="day">
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<tr id="firstWeek">
		</tr>
		<tr id="secondWeek">
		</tr>
		<tr id="thirdWeek">
		</tr>
		<tr id="forthWeek">
		</tr>
		<tr id="fifthWeek">
		</tr>
		<tr id="sixthWeek">
		</tr>
	</table>
	
</body>

<script src="<%= request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>
<script>
var today = new Date();
$("#todate").html(today);
$("#year").val(today.getFullYear());
$("#month").val(today.getMonth() + 1);
var year = $("#year").val();
var month = $("#month").val();

var monthFirst;
var monthLast;

var first;
var firstDay;
var last;

var firstWeek = [];
var secondWeek = [];
var thirdWeek = [];
var forthWeek = [];
var fifthWeek = [];
var sixthWeek = [];

function date(when){
	let date = when.getDate();
	return date;
}

var week = ["일", "월", "화", "수", "목", "금", "토"];
function day(when) {
	let day = week[when.getDay()];
	return day;
}

function calendar(year, month) {
	for (var i = 0; i < 7; i++) {
		$("#firstWeek").html("");
		$("#secondWeek").html("");
		$("#thirdWeek").html("");
		$("#forthWeek").html("");
		$("#fifthWeek").html("");
		$("#sixthWeek").html("");
	}
	
	year = $("#year").val();
	month = $("#month").val();
	
	monthFirst = new Date(year, month - 1, 1);
	monthLast = new Date(year, month, 0);
	
	
	first = date(monthFirst);
	firstDay = monthFirst.getDay();
	last = date(monthLast);
	
	// 2차원 배열로 하면 훨씬 간단할 
	// 1~5주 1~7일
	for (var i = 0; i < 7; i++){
		firstWeek[i] = "";
		secondWeek[i] = "";
		thirdWeek[i] = "";
		forthWeek[i] = "";
		fifthWeek[i] = "";
		sixthWeek[i] = "";
	}
	
	for (var m = 0; m < 7; m++) {
		if (firstDay == m) {
			var l = 1;
			for (var i = firstDay; i < 7; i++) {
				firstWeek[i] = l;
				l++;
			}
			for (var j = 0; j < 7; j++) {
				secondWeek[j] = l + j;
				thirdWeek[j] = l + j + 7;
				forthWeek[j] = l + j + 14;
				fifthWeek[j] = l + j + 21;
			}
			if (fifthWeek[6] == 29) {
				if (last == 31) {
					sixthWeek[0] = 30;
					sixthWeek[1] = 31;
				} else {
					sixthWeek[0] = 30;
				}
			}
			for (var k = 0; k < 7; k++) {
				if (fifthWeek[k] > last) {
					fifthWeek[k] = "";
				}
			}
		}
	}
	
	for (var i = 0; i < 7; i++) {
		$("#firstWeek").html($("#firstWeek").html() + "<td>" + firstWeek[i] + "</td>");
		$("#secondWeek").html($("#secondWeek").html() + "<td>" + secondWeek[i] + "</td>");
		$("#thirdWeek").html($("#thirdWeek").html() + "<td>" + thirdWeek[i] + "</td>");
		$("#forthWeek").html($("#forthWeek").html() + "<td>" + forthWeek[i] + "</td>");
		$("#fifthWeek").html($("#fifthWeek").html() + "<td>" + fifthWeek[i] + "</td>");
		$("#sixthWeek").html($("#sixthWeek").html() + "<td>" + sixthWeek[i] + "</td>");
	}
}

calendar(year, month);

</script>

</html>