<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/cacheControl.jsp</title>
</head>
<body>
<h4>Cache 제어</h4>
<pre>
	cache란? 시스템 내부에서 발생하는 속도 저하를 커버하기 위한 임시 저장 데이터
	Pragma(http1.0), Cache-Control(http1.1) : 캐싱 정책 설정용 - 두 개 다 써야 함...(클라이언트가 뭘 사용할지 모르니까)
		no-cache : 일단 저장은 해놓는다 -> 캐시 데이터 사용 전 확인 절차를 거치도록 함(그냥 사용하지 말고 서버에 물어보라고!! ex)304상태코드 받아오는 것) 
		no-store : 아예 저장하지 않는다
		must-revalidate : 시한이 만료된 캐시 데이터 사용 전 확인 절차를 거치도록 함(시한이 만료되었다고 해서 그 캐시 데이터가 바로 사라지지는 않는다는 것)
		public : 일단 캐싱 해라 -> 클라이언트, 프록시 서버 둘 다에서 캐싱
										ㄴ 클라이언트와 서버 사이에서 요청과 응답을 가로채 원수신자에게 다시 보냄
		private :일단 캐싱 해라 -> 클라이언트에만 캐싱
		ex) public;maxages=milliseconds
	Expires : 캐싱 데이터 만료 시한 설정용(구체적인 날짜)
	<%
		response.setHeader("Pragma", "no-store"); // 1.0
		response.setHeader("Cache-Control", "no-store"); // 1.1
		// setter는 중복되면 그 전 값을 덮어씌움 그래서 add		
		response.addHeader("Pragma", "no-cache"); // 혹시 그 이전의 캐시가 있으면 나한테 검사를 받아!
		response.addHeader("Cache-Control", "no-cache"); // 혹시 그 이전의 캐시가 있으면 나한테 검사를 받아!
		response.setDateHeader("Expires", 0); // 1970-01-01 00:00:00 -> 과거로 가서 저장할 수 없으니 저장하지 말라는 뜻
	%>
</pre>
</body>
</html>