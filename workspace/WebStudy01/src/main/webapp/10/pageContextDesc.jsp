<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10/pageContextDesc.jsp</title>
</head>
<body>
<h4>pageContext(PageContext)</h4>
<pre>
	: 하나의 JSP 페이지와 관련된 모든 정보(기본 객체)를 가진 객체
	
	1. EL에서 주로 기본 객체를 확보할 때 사용
		ex) <%= request.getContextPath() %>,
			<%= ((HttpServletRequest)pageContext.getRequest()).getContextPath() %>,
			${pageContext.request.contextPath}
			다 같은 것들
	2. 에러 데이터 확보
	3. 흐름 제어(요청 분기 - requestDispather) : forward/include
	4. 영역 제어(*****)
		<%
// 			pageContext.setAttribute("", "", PageContext.)
		%>
</pre>
<h4>Scope</h4>
<pre>
	Servlet[JSP] Container : 서블릿 객체나 JSP 객체의 모든 관리 권한을 가진 주체(IoC(Inversion Of Control) : 제어의 역전).
	
	Scope : 웹 어플리케이션에서 데이터를 공유하기 위해 사용되는 저장 공간(Map&lt;<String, Object>&gt;이 4개 존재함)
		Scope라는 저장 공간을 소유한 기본 객체의 생명주기와 동일함(소유한 기본 객체가 없어질 때 해당 저장 공간도 없어짐)
		page scope : pageContext의 소유 공간, 현재 페이지에서만 공유 가능 영역
			- 평소에는 잘 안 쓰임
			- custom tag를 만든다면 쓸 이유가 생김
			- page scope는 나머지 세 개를 다 갖고 있음!
		request scope : 해당 영역의 소유 요청 객체가 소멸될 때 함께 소멸됨(request)
			- 응답이 나가면(요청과 응답은 1:1구조라) 소멸
			- forward는 계속 사용 가능한데 redirect는 request가 중간에 사라짐
			- redirect나 reload에서 사라지는 문제 때문에 session이 필요함
		session scope : 해당 영역을 소유한 세션 객체와 생명주기 동일
		application scope : ServletContext와 동일한 생명주기를 가짐 (application은 딱 하나만 존재)
		
	Attirbute : scope를 통해 공유되는 데이터(String name/Object value)
	setAttirbute(name, value) -> getAttribute(name) / removeAttribute(name) - 무거운 거 없애줌, 정말 중요할 수 있음
	
	<%
		pageContext.setAttribute("pageAttr", "페이지 속성");
		request.setAttribute("requestAttr", "요청 속성");
		session.setAttribute("sessionAttr", "세션 속성");
		application.setAttribute("applicationAttr", "어플리케이션 속성");
		
		pageContext.setAttribute("sample", "페이징샘플");
		pageContext.setAttribute("sample", "요청샘플", PageContext.REQUEST_SCOPE); // 이러면 request.setAttribute()한 것임
		 // page scope는 나머지 다 갖고 있음 
		
// 		1. forward -> page scope는 나오지 않음
// 		2. include -> page scope는 나오지 않음
		String viewName = "/09/attrView.jsp";
// 		request.getRequestDispatcher(viewName).include(request, response);
// 		3. redirect -> page scope와 request scope는 나오지 않음
		String location = request.getContextPath() + viewName; // body가 없어도 어차피 응답이 나간 것이니 새로운 request가 생겨서 두 개밖에 안 나옴
// 		response.sendRedirect(location);
			
	%>
</pre>
<h4>공유된 속성 데이터들</h4>
<pre>
	sample : ${sample}
	- el은 범위가 좁은 녀석부터 뒤져서 찾는다!
		- page scope부터 찾음. 거기서 못 찾으면 "요청샘플"을 보여줄 것임
	- 그럼 다른 범위에 있는 건 어떻게 할 거?!
		- el의 기본 객체(11개)를 사용하면 됨
	sample : ${requestScope.sample}
	
	page scope : <%= pageContext.getAttribute("pageAttr") %>, ${pageAttr}
	request scope : <%= request.getAttribute("requestAttr") %>, ${requestAttr}
	session scope : <%= session.getAttribute("sessionAttr") %>, ${sessionAttr}
	<%
		// flash attribute
		session.removeAttribute("sessionAttr"); // 한 번은 나오는데 remove하고 지우면 null 뜸. 필요없어지면 바로 지워라!
	%>
	application scope : <%= application.getAttribute("applicationAttr") %>, ${applicationAttr}
</pre>
</body>
</html>