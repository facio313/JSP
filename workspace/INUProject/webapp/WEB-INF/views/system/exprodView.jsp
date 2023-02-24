<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<h3>전문가 신청 세부</h3>

<form:form modelAttribute="exprod" action='${pageContext.request.contextPath }/systemManagement/acceptManagement/updateAcceptProd' method="post">
<table>
	<tr>
		<td>
			<input type="hidden" name="exprodId" value="${exprod.exprodId }"/>
		</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>${exprod.exprodId }</td>
	</tr>
	<tr>
		<th>시작일</th>
		<td>${exprod.exprodStart }</td>
	</tr>
	<tr>
		<th>종료일</th>
		<td>${exprod.exprodEnd }</td>
	</tr>
	<tr>
		<th>대상</th>
		<td>${exprod.exprodTarget }</td>
	</tr>
	<tr>
		<th>상품명</th>
		<td>${exprod.exprodName }</td>
	</tr>
	<tr>
		<th>상품 가격</th>
		<td>${exprod.exprodPrice }</td>
	</tr>
	<tr>
		<th>상품이용방법</th>
		<td>${exprod.exprodWay }</td>
	</tr>
	<tr>
		<th>시간</th>
		<td>${exprod.exprodTime }</td>
	</tr>
	<tr>
		<th>전문가아이디</th>
		<td>${exprod.memId }</td>
	</tr>
	<tr>
		<th>승인여부</th>
		<td>${exprod.exprodAproval }</td>
	</tr>
	<tr>
		<th>구분코드</th>
		<td>${exprod.exprodPrice }</td>
	</tr>
	<tr>
		<th>상세설명</th>
		<td>${exprod.exprodDetail }</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="승인" />
			<input type="button" onclick="location.href='<c:url value="#"/>'" value="반려" />
			<input type="button" onclick="location.href='<c:url value="/systemManagement/acceptManagement/appliExprodList"/>'" value="목록으로" />
		</td>
	</tr>
</table>
</form:form>	




















