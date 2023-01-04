<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includee/preScript.jsp" />
<c:if test="${not empty message }">
	<script>
		alert("${message}");
	</script>
</c:if>
</head>
<body>
<h4>입력 양식</h4>
<form method="post">
	<table>
		<tr>
			<th>상품아이디</th>
			<td>
				<input class="form-control" type="text" readonly name="prodId" VALUE="${prod.prodId}" /><span class="text-danger">${errors.prodId}</span>
			</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td>
				<input class="form-control" type="text" required name="prodName" VALUE="${prod.prodName}" /><span class="text-danger">${errors.prodName}</span>
			</td>
		</tr>
		<tr>
			<th>상품분류</th>
			<td>
			<select class="form-control" name="prodLgu">
				<option value>분류</option>
				<c:forEach items="${lprodList}" var="lprod">
					<option value="${lprod.lprodGu}"
						${lprod.lprodGu eq prod.prodLgu ? "selected" : ""}
					>${lprod.lprodNm}</option>
				</c:forEach>
			</select>
				<span class="text-danger">${errors.prodLgu}</span></td>
		</tr>
		<tr>
			<th>거래처명</th>
			<td>
			<select class="form-control" name="prodBuyer">
				<option value>거래처</option>
				<c:forEach items="${buyerList}" var="buyer">
					<option value="${buyer.buyerId}" class="${buyer.buyerLgu}" 
					${buyer.buyerId eq prod.prodBuyer ? "selected" : "" }
					>${buyer.buyerName}</option>
				</c:forEach>
			</select>
				<span class="text-danger">${errors.prodBuyer}</span></td>
		</tr>
		<tr>
			<th>구매가</th>
			<td><input class="form-control" type="number" required
				name="prodCost" VALUE="${prod.prodCost}" /><span
				class="text-danger">${errors.prodCost}</span></td>
		</tr>
		<tr>
			<th>판매가</th>
			<td><input class="form-control" type="number" required
				name="prodPrice" VALUE="${prod.prodPrice}" /><span
				class="text-danger">${errors.prodPrice}</span></td>
		</tr>
		<tr>
			<th>세일가</th>
			<td><input class="form-control" type="number" required
				name="prodSale" VALUE="${prod.prodSale}" /><span
				class="text-danger">${errors.prodSale}</span></td>
		</tr>
		<tr>
			<th>상품요약</th>
			<td><input class="form-control" type="text" required
				name="prodOutline" VALUE="${prod.prodOutline}" /><span
				class="text-danger">${errors.prodOutline}</span></td>
		</tr>
		<tr>
			<th>상품상세</th>
			<td><input class="form-control" type="text" name="prodDetail"
				VALUE="${prod.prodDetail}" /><span class="text-danger">${errors.prodDetail}</span></td>
		</tr>
		<tr>
			<th>상품이미지</th>
			<td><input class="form-control" type="text" required
				name="prodImg" VALUE="${prod.prodImg}" /><span class="text-danger">${errors.prodImg}</span></td>
		</tr>
		<tr>
			<th>재고</th>
			<td><input class="form-control" type="number" required
				name="prodTotalstock" VALUE="${prod.prodTotalstock}" /><span
				class="text-danger">${errors.prodTotalstock}</span></td>
		</tr>
		<tr>
			<th>입고일</th>
			<td><input class="form-control" type="date" name="prodInsdate"
				VALUE="${prod.prodInsdate}" /><span class="text-danger">${errors.prodInsdate}</span></td>
		</tr>
		<tr>
			<th>적정재고</th>
			<td><input class="form-control" type="number" required
				name="prodProperstock" VALUE="${prod.prodProperstock}" /><span
				class="text-danger">${errors.prodProperstock}</span></td>
		</tr>
		<tr>
			<th>크기</th>
			<td><input class="form-control" type="text" name="prodSize"
				VALUE="${prod.prodSize}" /><span class="text-danger">${errors.prodSize}</span></td>
		</tr>
		<tr>
			<th>색상</th>
			<td><input class="form-control" type="text" name="prodColor"
				VALUE="${prod.prodColor}" /><span class="text-danger">${errors.prodColor}</span></td>
		</tr>
		<tr>
			<th>배송방법</th>
			<td><input class="form-control" type="text" name="prodDelivery"
				VALUE="${prod.prodDelivery}" /><span class="text-danger">${errors.prodDelivery}</span></td>
		</tr>
		<tr>
			<th>단위</th>
			<td><input class="form-control" type="text" name="prodUnit"
				VALUE="${prod.prodUnit}" /><span class="text-danger">${errors.prodUnit}</span></td>
		</tr>
		<tr>
			<th>입고량</th>
			<td><input class="form-control" type="number" name="prodQtyin"
				VALUE="${prod.prodQtyin}" /><span class="text-danger">${errors.prodQtyin}</span></td>
		</tr>
		<tr>
			<th>출고량</th>
			<td><input class="form-control" type="number" name="prodQtysale"
				VALUE="${prod.prodQtysale}" /><span class="text-danger">${errors.prodQtysale}</span></td>
		</tr>
		<tr>
			<th>마일리지</th>
			<td><input class="form-control" type="number" name="prodMileage"
				VALUE="${prod.prodMileage}" /><span class="text-danger">${errors.prodMileage}</span></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" class="btn btn-success"value="저장">
				<input type="reset" class="btn btn-danger" value="취소">
			</td>
		</tr>
	</table>
</form>
<jsp:include page="/includee/postScript.jsp" />
<script>
	let prodBuyerTag = $("[name=prodBuyer]");
	$("[name=prodLgu]").on("change", function(){
		let prodLgu = $(this).val();
		if (prodLgu){
			prodBuyerTag.find("option:gt(0)").hide();
			prodBuyerTag.find("option." + prodLgu).show();
		}
// 	}).val("${prod.prodLgu}");
	}).trigger("change");
// 	let prodBuyerTag = $("[name=prodBuyer]").val("${prod.prodBuyer}");
</script>
</body>
</html>