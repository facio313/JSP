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

	* 자원이 폐쇠된 classpath에 감춰진 거냐, Web에 공개된(url을 통해 접근 가능) 거냐에 따라 다른 것
	classpath resource
	web resource : webapp 아래 폴더들
		- qulified name : /Webstudy01/src/main/webapp/resources/images
			- 이건 가짜
		- system 물리 경로 : D:/A_TeachingMaterial/06_JSP_Spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Webstudy01/resources/images
			-D:/A_TeachingMaterial/06_JSP_Spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps는 바뀌기 때문에 쓰지 않는다.
		- 접근 가능 경로 : localhost/Webstudy01/resources/images
	
	* 어떤 자원을 쓰더라도 절대 바뀌지 않는 원칙 : 바뀌는 경로는 쓰지 않는다.

	*** 웹자원에 대한 식별성 : URI
	URI(Uniform Resource Identifier) - 범용 자원 식별자
	URL(Uniform Resource Locator) - 범용 자원 위치자
	URN(Uniform Resource Name) - 범용 자원 명명성 => 같은 이름 있을 때,,,이름에 대한 정보성,,,
	URC(Uniform Resource Content) - 범용 자원 내용(조건)
	- 같은 식별성을 찾기 위한 방법의 차이
	
	URL 구조
	protocol(shceme) : //IP(DN):port/context/deptn1...depthn/resourceName
	
	DomainNAme
	3 level www.naver.com GlobalTopLevelDomain : GTLD
	4 level www.naver.co.kr NationalTopLevelDomain : NTLD
	
	URL 표기 방식
	절대경로(**) : 최상위 루트부터 전체 경로 표현 - 생략가능한 요소가 존재 / 맨 앞이 /면 절대
		client side : /Webstudy01/resources/images/cat1.jpg
			- context path부터 시작됨
		server side : /resources/images/cat1.jpg
			- context path 이후의 경로 표기
	상대경로 : 기준점(브라우저의 현재 주소)을 중심으로 한 경로 표현 / 맨 앞이 .이나 다른 거면 상대
	- 기준점 차이! 기준점 : 현재 위치
	- 현재 위치는 서버 사이드가 아니라 클라이언트의 현재 위치
	- 즉 브라우저의 현재 위치가 기준점이 된다.


파일 시스템 리소스 : 파일 시스템 상 절대 경로를 통해서 파일에 접근함/ 물리적인 자원의 경로와 일치함
대원칙! : 변경되는 경로는 사용하지 않는다
클래스 패스 리소스 : ~~


</pre>
<%
// 	InputStream is2 = application.getResourceAsStream("/resources/images/cat1.jpg");
	String realPath1 = application.getRealPath("/resources/images/cat1.jpg");
	String realPath2 = application.getRealPath(request.getContextPath() + "/resources/images/cat1.jpg");
	
	request.getRequestDispatcher("/WEB-INF/views/depth1/test.jsp").forward(request, response);
	response.sendRedirect(request.getContextPath() + "/member/memberForm.do");
%>
<img src="<%=request.getContextPath() %>/resources/images/cat1.jpg">
<img src="../resources/images/cat1.jpg">
<img src="cat1.jpg"><br>
콘솔에서 location 쳤을 때 기억하고 있는 건 생략해도 됨.
http:
localhost
--------
Webstudy01은 생략 안 됨 -> reuqest.getContextPath()로 바꾸는 건 됨

<br>
<%-- 서버사이드 방식으로 접근한 파일의 크기 : <%=is2.available() %>  --%>
realPath1 : <%=realPath1 %> <br>
realPath2 : <%=realPath2 %>
</body>
</html>