<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/flowControl.jsp</title>
<jsp:include page="/includee/preScript.jsp" />
</head>
<body>
<h4>흐름 제어 방법</h4>
<pre>
!!!forward, include, include2, redirect 차이를 알아두기

	Http : Connectless, Stateless를 알아야 밑에 두 개를 이해 가능함
	A -> B 이동 방식
	
	1. 요청 분기(request dispatch) : A를 대상으로 한 최초의 요청이 계속 유지됨
		1) forward(Model2) : A(request 처리, controller) -> B(response 생성, view)에서 이동 후의 최종 응답은 B에서 전송 - 서버 사이드 위임 구조
		2) include : A -> B -> A 최종 응답에 A + B의 모든 데이터가 포함됨.
			- 정적 내포 : 컴파일  전에 소스가 파싱되는 단계에서 소스  파일이 내포됨
			- 동적 내포 : 실행 시 실행 결과 데이터가 내포됨
		<%
			request.setAttribute("attr1", new Date()); // 파라미터나 어트리뷰트나 사용 목적은 같음(데이터를 주고 받기 위함) - but! parameter는 문자만 attribute는 객체
			String path = "/02/standard.jsp";
// 			이동할 때 request와 response를 담아서 보냄
// 			request.getRequestDispatcher(path).forward(request, response); // Dispatcher은 요청분기관리자
// 			request.getRequestDispatcher(path).include(request, response);
// 			pageContext.include(path);
		%>
	2. Redirect	
		A -> Response Body가 없고, Line(302) + Header(Location)로만 구성된 응답이 전송
			-> Location 방향으로 새로운 요청을 전송함
			-> B에서 Body를 가진 최종 응답이 전송됨
		1 요청 	connect통로가 만들어지고 request를 보냄
		2 응답	line(302)과 header(location)만 있음-connect통로가 사라지고 request가 사라짐
		3 재요청	2에서 받은 location으로 새로운 request를 만들어서 새로운 connect통로를 만들어 그 location으로 보냄
		4 재응답	2번을 준 서버에 대해서는 새로운 서버가 알 수 없음
				클라이언트는 B를 알 수 있음
		<%
			session.setAttribute("attr2", "세션 속성");
			String location = request.getContextPath() + path;
// 			response.sendRedirect(location);
// 			response.sendRedirect(location + "?param1="+request.getParameter("param1")); // 파라미터를 보내려면 이 방법밖에 없음.. 굳이 이렇게 하는 이유? http의 connectless와 stateless 때문에
		%>
</pre>
</body>
</html>