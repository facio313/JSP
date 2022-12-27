<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/memberList.do</title>
<jsp:include page="/includee/preScript.jsp" />
</head>
<body>
<h4>회원목록 조회</h4>

<table>
	<thead>
		<tr>
			<th>회원아이디</th>
			<th>회원명</th>
			<th>이메일</th>
			<th>휴대폰</th>
			<th>거주지역</th>
			<th>마일리지</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${not empty memberList}">
				<c:forEach items="${memberList}" var="member">
<%-- 				향상된 for문!! --%>
<!-- 				tr태그와 그에 맞는 td태그 넣기. -->
<!-- 				각 td태그에는 th태그에서 작성했던 MemberVO의 entity에 맞게 getter 호출하기 -->
					<tr>
						<td>${member.memId}</td>
						<td>${member.memName}</td>
						<td>${member.memMail}</td>
						<td>${member.memHp}</td>
						<td>${member.memAdd1}</td>
						<td>${member.memMileage}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">조건에 맞는 회원이 없음</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<jsp:include page="/includee/postScript.jsp" />
</body>
</html>