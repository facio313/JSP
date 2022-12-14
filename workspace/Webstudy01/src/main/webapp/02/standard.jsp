<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	// java code : 전역 코드
	String variable; 
	private void test(){}
%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- <style> -->
/* comment */
<!-- </style> -->
<!-- </head> -->
<!-- <body> -->
<h4> request parameter param1 : <%= request.getParameter("param1") %></h4>
<h4> request attribute attr1 : <%= request.getAttribute("attr1") %></h4>
<h4> session attribute attr2 : <%= session.getAttribute("attr2") %></h4>
<h4>JSP spec</h4>
<pre>
	: 서블릿 스펙에서 파생된 하위 스펙, 템플릿 기반의 스크립트 형태를 가진 스펙
	
	JSP 소스 표준 구성 요소
	1. 정적 텍스트 : 일반 텍스트, HTML,. JavaScript, Css
	2. backend script code
		1) scriptlet : <% // java code : 지역 코드
						String data = "데이터";
						Date now = new Date();
						%>
		2) directive : <%-- <%@ page import="java.util.Date" %> --%>
						JSP 페이지에 대한 부가설정이나 전처리 구문에 사용되며, 지시자의 이름과 속성들의 형태로 사용됨
						page(required) : 페이지에 대한 환경 설정
						include(optional) : 정적 include
						taglib(optional) : 커스텀 태그 로딩
						 
		3) expression : <%= data %>, <%= now %>
		4) declaration : 보통 맨 위에 둠
		<%-- <%! 
				// java code : 전역 코드
				String variable; 
				private void test(){}
			%> --%>
		5) comment : 주석 처리 시점이 다르다
			- client side comment : HTML, CSS, JS
			<!-- comment -->
			- server side commnet : java, jsp
			<% // java comment %>
			<%-- jsp comment --%>
			주석은 개발자끼리 의사소통하고자 하는 것이어서 보이면 안 됨. 그래서 보안을 위해 응답 데이터에 보이지 않는 서버 사이드 주석을 사용해야 함
			그리고 응답 데이터에 넣은 클라이언트 사이드 주석이 늘어나면 응답이 느려짐. 그걸 위해서도 서버 사이드 주석을 사용해야 함
			1. 보안
			2. 속도
	3. action tag
	4. EL(표현 언어)
	5. JSTL
	
</pre>
<script>
// 	comment
	console.log("body 랜더링 완료");
	console.log($("body"));
</script>
<!-- </body> -->
<!-- </html> -->