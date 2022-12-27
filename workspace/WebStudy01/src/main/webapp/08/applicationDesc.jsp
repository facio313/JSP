<%@page import="java.io.InputStream"%>
<%@page import="java.nio.file.StandardCopyOption"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>08/applicationDesc.jsp</title>
</head>
<body>
<h4>application(ServletContext)</h4>
<pre>
	: 하나의 컨텍스트와 해당 컨텍스트를 운영중인 서버의 정보를 가진 객체(singleton)
	(Servlet Container[WAS, JSP container]와 커뮤니케이션하기 위한 객체)
	
	* DescriptionServlet에서 거의 했던 내용임
	
	1. MIME 확보(서버가 가진 정보 획득)
		<%= application.getMimeType("test.jpg") %>
		<%= application.getMajorVersion() %>.<%= application.getMinorVersion() %>
		<%= application.getServerInfo() %>
		<%= application.getContextPath() %>
		<%= request.getServletContext().getContextPath() %>
	2. 컨텍스트 파라미터 획득
		<%= application.getInitParameter("imageFolder") %>
	3. logging <% application.log("정상 로그 메시지"); %>
	4(*****). 현재 컨텍스트의 웹리소스 획득
	자원의 위치와, 표기방식에 따라 3가지로!
	<%
		String imageURI = "/resources/images/cat1.jpg"; // 논리 주소 // resources가 정확히 어디 있는지 모름!!!
		// 생략 가능(이름 안 쓴다면)
		String realPath = application.getRealPath(imageURI); // realPath는 물리주소 // 여기path는 실제론 논리주소임(URkL)
		
		String saveFolderURI = "/09"; // 논리 주소(물리 주소가 아니기 때문에 path가 아니라 URL)
		String saveFolderPath = application.getRealPath(saveFolderURI);
		
		// 생략 가능(이름 안 쓴다면)
		File imageFile = new File(realPath); // File에서는 물리주소가 쓰임
		File destFile = new File(saveFolderPath, imageFile.getName());
		
		try(
// 			FileInputStream fis = new FileInputStream(imageFile); // 이미지에 직접 접촉
// 			BufferedInputStream bis = new BufferedInputStream(fis); // 2차 스트림인 걸 알 수 있는 clue => 생성자
			// Web Resource는 application을 통해 받아오면 된다~
			InputStream is = application.getResourceAsStream(imageURI);
			
			// Files.copy를 통해 생략 가능
// 			FileOutputStream fos = new FileOutputStream(destFile);
// 			BufferedOutputStream bos = new BufferedOutputStream(fos);
			// Exception이 발생하지 않는 이유는 실제 파일에서 try catch로 잡아주고 있기 때문
		){
			// while문 돌려서 읽어야 하는데 간단한 방법도 있음
			Files.copy(is, destFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		// 복사본은 Project Explorer에서 확인하면 안 나옴. -> 가짜니까
		// 실제 경로인 D:\A_TeachingMaterial\06_JSP_Spring\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Webstudy01\09로 가야 확인 가능함
	%>
	<%= imageFile.length() %>
	<%= realPath %>
</pre>
<img src="<%=request.getContextPath() %><%= saveFolderURI %>/<%= destFile.getName() %>" /> <!-- 클라이언트 사이드이기 때문에 request.getContextPath()가 필요함 -->
</body>
</html>