<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:if test="${not empty message }">
	<script>
		alert("${message}");
	</script>
</c:if>
<form:form modelAttribute="prod" enctype="multipart/form-data">
	<table class="table table-hover table-bordered">
		<tr>
			<th>상품아이디</th>
			<td>
				<form:input path="prodId" cssClass="form-control" readonly="true"/>
				<form:errors path="prodId" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td>
				<form:input path="prodName" class="form-control"/>
				<form:errors path="prodName" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>상품분류</th>
			<td>
				<%-- <form:select path="prodLgu" items="${lprodList}" itemValue="lprodGu" label="lprodNm" /> --%>
				<form:select class="form-control" path="prodLgu">
					<option value>분류</option>
					<c:forEach items="${lprodList}" var="lprod">
						<form:option value="${lprod.lprodGu}" label="${lprod.lprodNm}" />
					</c:forEach>
				</form:select>
				<form:errors path="prodLgu" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>거래처명</th>
			<td>
				<%-- <form:select path="prodBuyer" items="${buyerList}" itemValue="buyerId" itemLabel="buyerName">
					<option value>거래처</option> -- 반복 안 하고 하나만 있게 됨. 사용 가능
				</form:select> --%>
				<form:select class="form-control" path="prodBuyer">
					<option value>거래처</option>
					<c:forEach items="${buyerList}" var="buyer">
						<form:option value="${buyer.buyerId}" cssClass="${buyer.buyerLgu}" label="${buyer.buyerName}"/>
					</c:forEach>
				</form:select>
				<form:errors path="prodBuyer" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>구매가</th>
			<td>
				<form:input type="number" path="prodCost" class="form-control"/>
				<form:errors path="prodCost" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>판매가</th>
			<td>
				<form:input type="number" path="prodPrice" class="form-control"/>
				<form:errors path="prodPrice" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>세일가</th>
			<td>
				<form:input type="number" path="prodSale" class="form-control"/>
				<form:errors path="prodSale" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>상품요약</th>
			<td>
				<form:input path="prodOutline" class="form-control"/>
				<form:errors path="prodOutline" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>상품상세</th>
			<td>
				<form:input path="prodDetail" class="form-control"/>
				<form:errors path="prodDetail" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>상품이미지</th>
			<td>
				<input class="form-control" type="file" name="prodImage" accept="image/*"/> 
<%-- 				value="${prod.prodImage}"/> --%>
				<form:errors path="prodImg" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>재고</th>
			<td>
				<form:input type="number" path="prodTotalstock" class="form-control"/>
				<form:errors path="prodTotalstock" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>입고일</th>
			<td>
				<form:input type="date" path="prodInsdate" class="form-control"/>
				<form:errors path="prodInsdate" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>적정재고</th>
			<td>
				<form:input type="number" path="prodProperstock" class="form-control"/>
				<form:errors path="prodProperstock" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>크기</th>
			<td>
				<form:input path="prodSize" class="form-control"/>
				<form:errors path="prodSize" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>색상</th>
			<td>
				<form:input path="prodColor" class="form-control"/>
				<form:errors path="prodColor" element="span" class="text-danger"/>
			</td>		
		</tr>
		<tr>
			<th>배송방법</th>
			<td>
				<form:input path="prodDelivery" class="form-control"/>
				<form:errors path="prodDelivery" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>단위</th>
			<td>
				<form:input path="prodUnit" class="form-control"/>
				<form:errors path="prodUnit" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>입고량</th>
			<td>
				<form:input type="number" path="prodQtyin" class="form-control"/>
				<form:errors path="prodQtyin" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>출고량</th>
			<td>
				<form:input type="number" path="prodQtysale" class="form-control"/>
				<form:errors path="prodQtysale" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>마일리지</th>
		<td>
				<form:input type="number" path="prodMileage" class="form-control"/>
				<form:errors path="prodMileage" element="span" class="text-danger"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" class="btn btn-success"value="저장">
				<input type="reset" class="btn btn-danger" value="취소">
			</td>
		</tr>
	</table>
</form:form>
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