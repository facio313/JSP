<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>기본객체(내장객체)</h4>
<pre>
	// 제일 많이 쓰이는 것들
	request(HttpServletRequest) : 클라이언트와 그로부터 발생한 요청에 대한 정보를 캡슐화한 객체
	response(HttpServletResponse) : 서버에서 클라이언트로 전송되는 응답에 대한 정보를 캡슐화한 객체
	out(JspWriter) : response.getWriter(), response body에 content를 기록(버퍼 제어)할 때 활용
	session(HttpSession) : 한 클라이언트와 하나의 브라우저를 대상으로 생성되는 한 세션에 대한 정보를 캡슐화한 객체
	application(ServletContext) : 하나의 컨텍스트와 서버에 대한 정보를 캡슐화한 객체
	* 하나의 컨텍스트 -> 밑에 서버에서 Webstudy01이나 dummyWeb1 같은 것들. 두 개가 되면 컨텍스트가 두 개, 컨텍스트 패스도 두 개
	
	// 웬만해선 안 씀
	page(Object) == this, custom tag 작성 시 활용됨
	config(ServletConfig) : 현재 서블릿의 설정 정보를 캡슐화한 객체
	
	// 제일 중요!!****************
	pageContext(PageContext) : 현재 JSP 페이지에 대한 모든 정보(핵심)를 캡슐화한 객체
		el에서 많이 이용됨. el은 다 지원 안 하는데 pageContext는 지원함
		ex) ${pageContext.request.contextPath} 
	
	// 엥간해선 안 씀
	exception : 발생한 에러(예외)에 대한 정보를 캡슐화한 객체// page 지시자의 isErrorPage가 활성화된 경우에만 사용가능
</pre>
</body>
</html>