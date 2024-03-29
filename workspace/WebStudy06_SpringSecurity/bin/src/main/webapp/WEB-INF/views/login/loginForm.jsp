<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty message}">
	<script>
		alert("${message}");
	</script>
	<c:remove var="message" scope="session"/>
</c:if>
	<form method="post" action="<c:url value='/login/loginProcess.do'/>">
		<ul>
			<li>
				<c:set var="saveId" value="${cookie['saveId']['value']}"/>
				<input type="text" name="memId" placeholder="아이디" value="${not empty validId ? validId : saveId}"/> <!-- dispatcher방식이니까 req가 살아있을 테니 거기에 parameter 있을 것임 -->
				<input type="checkbox" name="saveId" ${not empty saveId ? 'checked' : '' }/>아이디 기억하기 (5일동안)
				<c:remove var="validId" scope="session" />
			</li>
			<li>
				<input type="password" name="memPass" placeholder="비밀번호" />
				<input type="submit" value="로그인" />
			</li>
		</ul>
	</form>
