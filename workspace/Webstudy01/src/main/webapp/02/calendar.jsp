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
		border: 3px dotted green;
		width: 700px;
		hegith: 600px;
		text-align: center;
	}
	td {
		border: 2px solid blue;
	}
</style>
</head>
<body>
	<h1>달력</h1>
	
	<span>오늘 : </span>
	<span id="todate"></span>
	
	<br><br>
	
	<input id="year" type="number" min="1" max="10000" onchange="calendar()">년
	<input id="month" type="number" min="1" max="12" onchange="calendar()">월
	
	<table id="calendar">
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

var week = [[], [], [], [], [], []];

function date(when){
	let date = when.getDate();
	return date;
}

function calendar(year, month) {
	$("#calendar").html("<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>");
	
	year = $("#year").val();
	month = $("#month").val();
	
	monthFirst = new Date(year, month - 1, 1);
	monthLast = new Date(year, month, 0);
	
	
	first = date(monthFirst);
	firstDay = monthFirst.getDay();
	last = date(monthLast);
	
	for (var i = 0; i < 6; i++) {
		for (var j = 0; j < 7; j++) {
			week[i][j] = "";
		}
	}
	
	for (var m = 0; m < 7; m++) {
		if (firstDay == m) {
			var l = 1;
			for (var i = firstDay; i < 7; i++) {
				week[0][i] = l;
				l++;
			}
			for (var j = 0; j < 7; j++) {
				week[1][j] = l + j;
				week[2][j] = l + j + 7;
				week[3][j] = l + j + 14;
				week[4][j] = l + j + 21;
			}
			if (week[4][6] == 29) {
				if (last == 31) {
					week[5][0] = 30;
					week[5][1] = 31;
				} else {
					week[5][0] = 30;
				}
			}
			for (var k = 0; k < 7; k++) {
				if (week[4][k] > last) {
					week[4][k] = "";
				}
			}
		}
	}
	for (var i = 0; i < 6; i++) {
		$("#calendar").html($("#calendar").html() + "<tr id=" + i + "></tr>")
		for (var j = 0; j < 7; j++) {
			$("#" + i).html($("#" + i).html()  + "<td>" + week[i][j] + "</td>");
		}
	}
	if (week[5][0] == "") {
		$("#5").html("");		
	}
}

calendar(year, month);

</script>

</html>