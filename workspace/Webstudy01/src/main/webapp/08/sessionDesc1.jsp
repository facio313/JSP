<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>08/session(HttpSession)</title>
<jsp:include page="/includee/preScript.jsp"/>
<script src="<%= request.getContextPath() %>/resources/js/custom.js"></script>
</head>
<body>
<h4>Session</h4>
<h4 id="timerArea"><%=session.getMaxInactiveInterval()%></h4>
<pre>
 (웹)세션이란?
 	: 어플리케이션 서버를 사용하기 시작한 순간부터 사용 종료까지의 기한
 	
 	시작(생성) : 클라이언트의 최초 요청(재전송되는 아이디가 없는 요청) 발생 -> 식별자가 부여된 세션이 새로 생성
 				-> 요청에 대한 응답이 전송될 때 세션 아이디가 응답 헤더에 포함되어 클라이언트로 전송
 		세션 아이디 : <%= session.getId() %>
 		세션 생성 시점 : <%= new Date(session.getCreationTime()) %>
 		마지막 요청 시점 : <%= new Date(session.getLastAccessedTime()) %>
 		timeout : <%= session.getMaxInactiveInterval() %>s
 		
 		*web.xml에 설정할 수 있음
 		
 		유지(tracking mode) : 세션의 식별자(세션 아이디) 재전송 구조
 			1) COOKIE
 			2) URL : <a href="sessionDesc.jsp;jsessionid=<%= session.getId() %>">URL트랙킹 모드</a>
 					-> session 파라미터 / 쿠키보다 훨씬 보안 문제가 심각함(브라우저 상단에 그대로 노출돼서)
 					-> session 하이재킹 당하기 쉬움
 			* COOKIE와 URL은 어쨋든 재전송만 되면 세션이 유지되지만, 하이재킹 등의 보안위험이 큼! 그래서 밑에 거 씀
 			3) SSL(Secure Socket Layer) : 클라이언트와 서버 사이에 보안 채널 생성 -> 키가 없으면 중간에 가로채도 읽을 수가 없음
 					-> 인증서라는 개념이 있어야 쓸 수 있음
 		
 	종료(만료)
 		1) 세션의 아이디가 재전송되지 않을 때 ex) 세션과 관련된 쿠키 삭제
 		2) 브라우저가 종료될 때
 		3) session timeout 이내에 새로운 요청을 통해 아이디가 재전송되지 않을 때
 		* 만료 시간이란 최초의 요청부터 30분 이런 개념이 아님.
 		4) session invalidation(명시적인 로그아웃)
 		
 		미션 : 세션 만료되면 연장할지 안 할지 정하도록 하게 해야 함
 		jquery객체와 html element의 차이점, 메서드, 커스텀 태그 등등
 		
 		
 </pre>
<script>
 	let time = <%= session.getMaxInactiveInterval() %>;
 	let half = parseInt(time/2);
 	
 	$("#timerArea").sessionTimer1(time, half);
 	
</script>
<jsp:include page="/includee/postScript.jsp"/>
</body>
</html>