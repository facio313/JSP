<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>09/generateException.jsp</title>
</head>
<body>
<h4> 예외 처리 테스트 </h4>
<%
	if (1==1)
		throw new IOException("강제 발생 예외"); // 실제 파일에서는 이미 Throwable t로 catch되기 때문에 에러가 안 남
%>
</body>
</html>