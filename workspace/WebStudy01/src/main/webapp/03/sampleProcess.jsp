<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Enumeration"%>
<%
// 	request.setCharacterEncoding("EUC-KR"); //encoding이지만 decoding 방식 정의
	//decoding 시 읽기 전, 데이터 사용하기 전 사용하기 전에 넣어야 함!
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <pre>
 	request line : <%=request.getRequestURL() %>
 	request line -> query String : <%=request.getQueryString() %>
 	request body : <%=request.getInputStream().available() %>
 	표준 입력양식(form)을 통해 입력된 파라미터(String) 확보
 	하지만 100% 문자로만 간다?! 이건 또 아님
 	String getParameter(name)
 	String[] getParameterValues(name)
 	Enumeration&lt;String&gt; getParameterNames
 	Map&lt;String, String[]&gt;getParameterMap
 </pre>
 <table>
 	<thead>
 		<tr>
 			<th>파라미터명</th>
 			<th>파라미터 값</th>
 		</tr>
 	</thead>
 	<tbody>
 		<%
 			Enumeration<String> names = request.getParameterNames();
 			while(names.hasMoreElements()) {
 				String parameterName = names.nextElement();
 				String[] values = request.getParameterValues(parameterName);
 				%>
 				<tr>
					<td><%=parameterName %></td>
					<td><%=Arrays.toString(values) %></td>
 				</tr>
 				<%
 			}
 		%>
 	</tbody>
 </table>
 <table>
 	<thead>
 		<tr>
 			<th>파라미터명</th>
 			<th>파라미터 값</th>
 		</tr>
 	</thead>
 	<tbody>
 		<%
 			Map<String, String[]> parameterMap = request.getParameterMap();
 			for (Entry<String, String[]> entry : parameterMap.entrySet()) {
 				String parameterName = entry.getKey();
 				String[] values = entry.getValue();
 				%>
 				<tr>
					<td><%=parameterName %></td>
					<td><%=Arrays.toString(values) %></td>
 				</tr>
 				<%
 			}
 		%>
 	</tbody>
 </table>
</body>
</html>