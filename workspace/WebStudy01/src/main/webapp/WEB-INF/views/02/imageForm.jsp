<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// application -> < % % >에 넣으면 지역변수로 선언되는데 JSP_Servlet 클래스의 지역변수이다. application은 그런데 JSP_servlet의 내장객체이기 때문에 따로 선언할 필요가 없다.  
File[] imageFiles = (File[]) request.getAttribute("imageFiles");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/ImageStreaming.do">
		<select name="image">
		<%for (File tmp : imageFiles) {
			%>
			<option><%=tmp.getName() %></option>
			<%
		} %>
		</select>
	</form>
	<img src=''>
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>
<script>
	$('[name=image]').on("change", function(event){
		event.target===this
		$('img').attr("src", "<%=request.getContextPath()%>/ImageStreaming.do?image=" + $(this).val());
	});
</script>
</body>
</html>