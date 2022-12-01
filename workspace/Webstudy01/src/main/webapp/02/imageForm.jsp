<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String imageFolder = application.getInitParameter("imageFolder");
File folder = new File(imageFolder);
// File[] imageFiles = folder.listFiles();
File[] imageFiles = folder.listFiles((dir, name)->{ // 람다를 못 쓰면 익명 객체로 구현해도 됨
	String mime = application.getMimeType(name);
	return mime != null && mime.startsWith("image/");
});
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