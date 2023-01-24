<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<h4>WELCOME</h4>
<c:set var="principal" value="${pageContext.request.userPrincipal}"/>
<c:choose>
	<c:when test="${not empty principal}">
		<c:set var="authMember" value="${principal.realMember}"/>
		<h4>로그인된 사용자??? : ${principal}</h4>
		<!-- <form name="logoutForm" action="<c:url value='/login/logout.do'/>" method="post"></form>
		<a href="#" class="logoutBtn">${authMember.memName}님 로그아웃</a>  -->
		<!-- a태그를 이용해서 서블릿을 호출했기 때문에 get을 오버라이딩  => 하지만 인증 관련은 모두 form으로만 해야 함-->
		프로필 이미지 : 
		<img src="data:image/*;base64, ${authMember.base64MemImg}"/>
		<a href="<c:url value='/mypage.do'/>">${authMember.memName}[${authMember.memRole}]님</a>
		<form name="logoutForm" action="<c:url value='/login/logout.do'/>" method="post"></form>
		<a href="#" class="logoutBtn">로그아웃</a> 
		<script>
			$(".logoutBtn").on("click", function(event){
				event.preventDefault();
				document.logoutForm.submit();
				return false;
			});
		</script>
	</c:when>
	<c:otherwise>
		<a href="<c:url value='/loginForm.do'/>">로그인</a>
		<a href="<c:url value='/member/memberInsert.do'/>">회원가입</a>
	</c:otherwise>
</c:choose>