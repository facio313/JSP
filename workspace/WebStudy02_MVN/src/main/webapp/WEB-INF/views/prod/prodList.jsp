<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1px">
	<thead>
		<tr>
			<th>일련번호</th>
			<th>상품분류</th>
			<th>상품명</th>
			<th>거래처명</th>
			<th>구매가</th>
			<th>판매가</th>
			<th>상품구매자수</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="prodList" value="${pagingVO.dataList}"/>
		<c:choose>
			<c:when test="${not empty prodList}">
				<c:forEach items="${prodList}" var="prod">
					<tr>
						<td>${prod.prodId}</td>
						<td>${prod.prodLgu}</td>
						<td>${prod.prodName}</td>
						<td>${prod.buyerName}</td>
						<td>${prod.prodPrice}</td>
						<td>${prod.prodSale}</td>
						<td>${prod.cnt}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="7">조건에 맞는 물품이 없음</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="7">
				${pagingVO.pagingHTML}
				<div id="searchUI">
					<select name="searchType">
						<option value>전체</option>
						<option value="lprodNm">분류명</option>
						<option value="buyerName">거래처명</option>
						<option value="prodName">상품명</option>
					</select>
					<input type="text" name="searchWord" />
				</div>
			</td>
		</tr>
	</tfoot>
</table>
</body>
</html>