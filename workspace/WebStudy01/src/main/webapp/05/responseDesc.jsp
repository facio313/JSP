<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="7kb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/responseDesc.jsp</title>
</head>
<body>
<h4>response(HttpServletResponse)</h4>
<pre>
	Http의 response packaging
	1. Response Line : Status Code(응답상태코드, XXX)
		100 ~ : ...ING...
		200 ~ : OK
		300 ~ : 최종 처리하기 위해 클라이언트의 추가 액션이 필요함 -> 현재의 응답이 최종 응답이 아님 => response의 body가 없음 / 서버나 framework에서 자동으로 만들어줌
			304(cache data 관련) : Not Modified
			301 / 302 / 307 : Moved + Location response header와 함께 사용(redirect request)
			<%
				// 서버 내에서 이동
// 				request.getRequestDispatcher("/04/messageView.jsp").forward(request, response); //여기에는 path가 필요하고, 서버 사이드 주소 
				String location = request.getContextPath() + "/04/messageView.jsp"; // 이 주소는 서버 사이드가 아닌 클라이언트 사이드에서 새로운 요청을 다시 보낼 때 쓰이는 것
				// 클라이언트로부터 새로운 요청이 발생
				response.sendRedirect(location); // 여기에는 location이 필요함
				// 하는 방법 : 주소창에 이 jsp 주소를 치면 messageView로 감
				// body가 없지만 response heaer에서 location이 있음
				
				// 이 두 가지 방법의 차이 때문에 scope에서 차이가 발생함
			%>
		400 ~ : client side error -> Fail => 개발자들이 직접 만들어줘야 하는 코드임!!
			400 : <%= HttpServletResponse.SC_BAD_REQUEST %>, 클라이언트 전송 데이터(파라미터) 검증 시 활용 ex) 사칙연산 시 피연산자로 잘못된 것 보냄, 아이디 길이가 초과됨
			401 / 403 : 인증(Authentication - 신원확인)과 인가(Authorization - 신원확인된 이에게 어떤 자원 접근에 대한 권한을 주는 것) 기반의 접근 제어에 활용(보안 처리에 활용됨) 
				<%= HttpServletResponse.SC_UNAUTHORIZED %>, <%= HttpServletResponse.SC_FORBIDDEN %>
			404 : <%= HttpServletResponse.SC_NOT_FOUND %>, 자원이 존재하지 않음
			405 : <%= HttpServletResponse.SC_METHOD_NOT_ALLOWED %>, 7가지의 request 메서드(server side에 해당 요청 메서드가 있지 않음) => 현재 요청의 메서드에 대한 콜백 메서드가 재정의되지 않았을 때
			406 / 415 : content-type(MIME)과 관련된 상태코드
				<%= HttpServletResponse.SC_NOT_ACCEPTABLE %> : Accept request 헤더에 설정된 MIME 데이터를 만들어낼 수 없을 때  즉, request header의 accpet(클라이언트가 받을 답장이 어떤 언어인가? - json, xml, html 등)
					ex) accept:application/json => content-type:application/json(XXX)
				<%= HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE %> : Content-Type request 헤더를 해석할 수 없을 때
					ex) content-type:application/json => unmarshalling(XXX)
		500 ~ : server side error -> Fail, 500(Internal Server Error)
	2. Response Header : meta data가 들어감
		Content에 대한 부가정보 설정 :	Content-*, Content-Type(MIME), Content-Length(size)
								Content-Disposition(content name, 첨부 여부)
			<%--
				response.setHeader("Content-Disposition", "inline[attachment];filename=\"파일명\"");
			--%>
		Cache control : 자원에 대한 캐싱 설정
		Auto Request : 주기적으로 갱신되는 자원에 대한 자동 요청
		Location 기반의 이동구조(redirection)
	3. Response Body(Content body, message body) : 
<%-- 		response.getWriter(), response.getOutputTream(), <%= %>, out(.print) --%>
		이 녀석들의 공통점 = stream을 통해 body에 내용을 적는 것
</pre>
</body>
</html>