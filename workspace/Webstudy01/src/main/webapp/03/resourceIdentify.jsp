<%@page import="java.nio.file.StandardCopyOption"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="kr.or.ddit.servlet01.DescriptionServlet"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/resourceIdentify.jsp</title>
</head>
<body>
<h4>자원의 종류와 식별방법</h4>
<pre>
	: 자원의 위치와 경로 표기 방법에 따라 분류
	1. File system resource : d:/contents/images/cat1.jpg
	<%
		String realPath = "d:/contents/images/cat1.jpg";
		File fileSystemResource = new File(realPath); // File은 로컬에 있는 것만 가능하다
	%>
	파일의 크기 : <%=fileSystemResource.length() %>
	
	2. Class path resource : /kr/or/ddit/images/cat2.png
	<%
// 		String qualifiedName = "/kr/or/ddit/images/cat2.png";
		String qualifiedName = "../images/cat2.png";
		realPath = DescriptionServlet.class.getResource(qualifiedName).getFile();
		realPath = DescriptionServlet.class.getClassLoader().getResource("kr/or/ddit/images/cat2.png").getFile();
		File classPathResource = new File(realPath);
	%>
	실제 경로 : <%=realPath %>
	파일의 크기 : <%=classPathResource.length() %>
	
	3. Web resource : https://s.pstatic.net/static/www/mobile/edit/20221206/cropImg_728x360_112269142781354680.png -> 물리주소가 아니다. 이걸 웹 리소스 자원
		http://localhost/Webstudy01/resources/js/jquery-3.6.1.min.js
	<%
// 		String resourceURL = "https://s.pstatic.net/static/www/mobile/edit/20221206/cropImg_728x360_112269142781354680.png";
		String resourceURL = "http://localhost/Webstudy01/resources/js/jquery-3.6.1.min.js";
		URL url = new URL(resourceURL);
		URLConnection conn = url.openConnection();
		String resourcePath = url.getPath();
		int lastIdx = resourcePath.lastIndexOf('/');
		String fileName = resourcePath.substring(lastIdx+1);
		String folderPath = "d:/contents/images";
		File downloadFile = new File(folderPath, fileName);
		InputStream is = conn.getInputStream();
		Files.copy(is, Paths.get(downloadFile.getPath()), StandardCopyOption.REPLACE_EXISTING); // 다른 이름으로 저장하기를 구현한 것
	%>
	resourcePath : <%=resourcePath %>

파일 시스템 리소스 : 파일 시스템 상 절대 경로를 통해서 파일에 접근함/ 물리적인 자원의 경로와 일치함
대원칙! : 변경되는 경로는 사용하지 않는다
클래스 패스 리소스 : ~~


</pre>
</body>
</html>