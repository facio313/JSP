<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//_JSPService(request, response)
	String numParam = request.getParameter("number");
	if (numParam == null && !numParam.matches("\\d{1, 2}")){
		response.sendError(HttpServletResponse.SC_BAD_REQUEST); // 400
		return; // _JSPService를 종료시킨 것
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>팩토리얼 연산 처리</h4>
<form> <!-- action을 안 넣으면 현재 브라우저! -->
	<input type="number" name="number" value="<%= Objects.toString(numParam, "") %>"onchange="this.form.submit()"/>
</form>
내가 한 것
<%
// int result = 1;
// int input = 0;
// if (numParam != null) {
// 	input = Integer.parseInt(numParam);
// 	for (int i = 1; i <= input; i++) {
// 		result *= i;
// 	}	
// }
%>
<%-- <%= result %> --%>

<br>
선민이 누나가 한 것
<% 
if (numParam != null) {
	int input = Integer.parseInt(numParam);
	String pattern = "%d! = %d";
	int result = fact(input);
	String expr = String.format(pattern, input, result);
%>
<%= expr %>
<%
}
%>
<%!
public int fact(int n) {
	if (n < 0) {
		throw new IllegalArgumentException("음수는 연산 불가");
	} else if ( n <= 1) {
		return n;
	} else {
		return fact(n-1) * n; //재귀호출	
	}
		
}
%>
</body>
</html>