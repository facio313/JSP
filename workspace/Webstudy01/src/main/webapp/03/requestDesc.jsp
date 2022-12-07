<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>request (HttpServletRequest)</h4>
=> 블로그 request 참고하기
<pre>
	Http의 요청 패키징 방식
		: 자원에 대한 식별 + 자원에 대한 행위 정보를 기본으로 함
	
	1. Request Line
		- URI 
		- http(request) Method : 행위, 의도(목적)
			- POST(C)
			- GET(R)
			- PUT/PATCH(U)
				- PUT : 10개 중 하나만 바꿔도 나머지 10개를 다 보내서 수정(쉬움)
				- PATCH : 10개 중 하나만 보내서 수정 - doPut에 포함됨
			- DELETE(D)
			- HEAD : 응답데이터의 패키징 구조(LINE + HEADER)
			- OPTIONS : 현재 서버가 특정 메서드를 지원하는지 여부를 확인하기 위한 사전 요청(preFlight request)에 사용
			- TRACE : 서버 디버깅 용도 같이 제한적으로만 사용
			
			ex) /member/memberInsert.do
			
			RESTful URI (자원식별과 행위를 분리하자) - JSON/XML로 자원 표현
			/member GET
			/member/a001 GET
			/member/a001 PUT
			/member/a001 DELETE
			/member/POST
			<%
				String requestURI = request.getRequestURI();
				StringBuffer requestURL = request.getRequestURL();
				String method = request.getMethod(); // 기본적으로 get임. get이외에는 form이 필요한데 구성한 적이 없음
			%>
			requestURI : <%=requestURI%>
			requestURL : <%=requestURL%>
			request method : <%=method%>
			
	2. Request Header : 클라이언트에 대한 부가정보(meta data)
		- 이름:값 의 쌍으로 구성된 "문자" 데이터(원래 형태가 문자임)
		<%
			String userAgent = request.getHeader("User-Agent"); // getParameter와 비슷! -> request에는 다 map으로 되어있음(key:value)
			out.println(userAgent);
			
		%>
		
	3. Request Body(optional) : POST, PUT
		- 클라이언트가 서버로 보내는 콘텐츠 영역(Content-Body, Message-Body)
		<%=request.getInputStream().available()%>
</pre>
<table border="1px">
	<thead>
		<tr>
			<th>헤더명</th>
			<th>헤더값</th>
		</tr>
	</thead>
	<tbody>
			<%
			Enumeration<String> e = request.getHeaderNames();
			
			while(e.hasMoreElements()) {
			    String header = e.nextElement().toString();
			    String value = request.getHeader(header);
			    out.print("<tr>");
			    out.print("<td>" + header + "</td>");
			    out.print("<td>" + value + "</td>");
			    out.print("</tr>");
			}
			%>
	</tbody>
</table>

</body>
</html>