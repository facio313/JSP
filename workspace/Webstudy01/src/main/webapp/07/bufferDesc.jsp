<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="1kb" autoFlush="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>out : JspWriter</h4>
<pre>
	출력 버퍼 관리자.
	현재 버퍼의 크기 : <%= out.getBufferSize() %>
	잔여 버퍼의 크기 : <%= out.getRemaining() %>
	auto flush 지원 여부 : <%= out.isAutoFlush() %>
	<%
		for (int i = 1; i <= 100; i++) {
			out.println(i + "번째 반복");
			if (out.getRemaining() < 50) 
				out.flush();	
			if (i==100){
// 				throw new RuntimeException("강제 발생 예외");
// 				request.getRequestDispatcher("/02/standard.jsp").include(request, response); // 이미 위에서 응답이 나가버려서 안 됨
				pageContext.include("02/standard.msp,");
			}
		}
	%>
	out 사용 시 장점
	1. 퍼포먼스 향상
	2. 버퍼를 flush하기 전까지는 버퍼를 바꿀 수 있다.
</pre>
</body>
</html>