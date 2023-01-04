<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includee/preScript.jsp" />
</head>
<body>
<h4>물품 조회</h4>
<table>
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
	<tbody id="listBody">
<%-- 		<c:set var="prodList" value="${pagingVO.dataList}"/> --%>
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${not empty prodList}"> --%>
<%-- 				<c:forEach items="${prodList}" var="prod"> --%>
<!-- 					<tr> -->
<%-- 						<td>${prod.rnum}</td> --%>
<%-- 						<td>${prod.lprodNm}</td> --%>
<%-- 						<td>${prod.prodName}</td> --%>
<%-- 						<td>${prod.buyer.buyerName}</td> --%>
<%-- 						<td>${prod.prodCost}</td> --%>
<%-- 						<td>${prod.prodPrice}</td> --%>
<%-- 						<td>${prod.memCount}</td> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<!-- 				<tr> -->
<!-- 					<td colspan="7">조건에 맞는 물품이 없음</td> -->
<!-- 				</tr> -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="7">
				<div class="pagingArea">
<%-- 					${pagingVO.pagingHTML} --%>
				</div>
				<div id="searchUI">
					<select name="prodLgu">
						<option value>분류</option>
						<c:forEach items="${lprodList}" var="lprod">
							<option value="${lprod.lprodGu}">${lprod.lprodNm}</option>
						</c:forEach>
					</select>
					<select name="prodBuyer">
						<option value>거래처</option>
						<c:forEach items="${buyerList}" var="buyer">
							<option value="${buyer.buyerId}" class="${buyer.buyerLgu}">${buyer.buyerName}</option>
						</c:forEach>
					</select>
					<input type="text" name="prodName" placeholder="상품명"/>
					<input type="button" id="searchBtn" value="검색" />
				</div>
			</td>
		</tr>
	</tfoot>
</table>
<h4>Hidden Form</h4>
<form id="searchForm">
	<input type="text" name="page" />
	<input type="text" name="prodLgu" placeholder="분류코드"/>
	<input type="text" name="prodBuyer" placeholder="거래처코드"/>
	<input type="text" name="prodName" placeholder="상품명"/>
</form>
<script>
	$("[name=prodLgu]").on("change", function(){
		let prodLgu = $(this).val();
		if (prodLgu) {
			prodBuyerTag.find("option:gt(0)").hide();
			prodBuyerTag.find("option." + prodLgu).show();
		}
	}).val("${detailCondition.prodLgu}");
	let prodBuyerTag = $("[name=prodBuyer]").val("${detailCondition.prodBuyer}");
// 	$("[name=prodName]").val("${detailCondition.prodName}");

	let listBody = $("#listBody");
	let pagingArea = $(".pagingArea").on("click", "a.paging", function(event){ // ui 동적으로!
		event.preventDefault();
		
		let page = $(this).data("page");
		if (!page) return false;
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
		
		return false;
	});
	
	let makeTrTag = function(prod){
		let aTag = $("<a>").attr("href", "${pageContext.request.contextPath}/prod/prodView.do?what=" + prod.prodId).html(prod.prodName);
		return $("<tr>").append(
			$("<td>").html(prod.rnum),		
			$("<td>").html(aTag),
			$("<td>").html(prod.lprodNm),		
			$("<td>").html(prod.buyer.buyerName),
			$("<td>").html(prod.prodCost),
			$("<td>").html(prod.prodPrice),	
			$("<td>").html(prod.memCount)	
		);
	}
	
	let searchForm = $("#searchForm").on("submit", function(event){
		event.preventDefault();
		
		let url = this.action;
		let method = this.method;
		let data = $(this).serialize();
		
		$.ajax({
			url : url,
			method : method,
			data : data,
			dataType : "json",
			success : function(resp) {
				listBody.empty();
				pagingArea.empty();
				searchForm[0].page.value="";
				
				let pagingVO = resp.pagingVO
				
				let dataList = pagingVO.dataList;
				let trTags = [];
				if (dataList) {
					$.each(dataList, function(index, prod){
						trTags.push(makeTrTag(prod));
					});
				} else {
					let tr = $("<tr>").html(
						$("<td>").attr("colspan", "7").html("조건에 맞는 상품 없음")
					);
					trTags.push(tr);
				}
				listBody.html(trTags);
// 				makeListBody(pagingVO);
				pagingArea.html(pagingVO.pagingHTML);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	}).submit();
	

// 	let makeListBody = function(pagingVO){
// 		let trTags = [];
// 		if(makeListBody.length>0){
// 			$.each(pagingVO.dataList, function(index, prod){ //인덱스와 한건의 메모를 값으로 받아온다
// 				let tr = $("<tr>").append(
// 					$("<td>").html(prod.rnum),
// 					$("<td>").html(prod.lprodNm),
// 					$("<td>").html(prod.prodName),
// 					$("<td>").html(prod.buyer.buyerName),
// 					$("<td>").html(prod.prodCost),
// 					$("<td>").html(prod.prodPrice),
// 					$("<td>").html(prod.memCount)
// 				);
// 				trTags.push(tr);
// 			});
// 		} else {
// 			let tr = $("<tr>").html(
// 			$("<td>")
// 				.attr("colspan","7")
// 				.html("존재하는 품목이 없습니다")
// 			);
// 		trTags.push(tr);
// 		}
// 		listBody.append(trTags);
// 	}
	
	
	let searchUI = $("#searchUI").on("click", "#searchBtn", function(){
		// searchUI에서 찾고
		let inputs = searchUI.find(":input[name]") // $("input") vs $(":input") 후자는 select도 선택됨
		$.each(inputs, function(index, input){
			let name = this.name;
			let value = $(this).val();
			// searchFrom에다 붙여넣기
// 			searchForm.find("[name=" + name + "]").val(value);
// 			searchForm.get(0)['searchType']
			searchForm[0][name].value = value;
		});
		searchForm.submit();
		
	});
	

	// searchUI의 첫 분류를 눌렀을 때에 맞는 것을 밑에서 리스트로 보여줘야 함
// 	let prodBuyer = $("select[name=prodBuyer]");
// 	let prodBuyer1 = $("select[name=prodBuyer] option");
// 	let html = prodBuyer.html();
// 	let prodLgu = $("select[name=prodLgu]").on("change", function(){
// 		prodBuyer.html(html);
// 		let lgu = $(this).val();
// 		let buyerLgu = "." + lgu;
		
// 		$.each(prodBuyer, function(index, option){
// 			if (option.indexOf(lgu) > 0){
// 				prodBuyer.html('<option value="" class="">'+ option +'</option>)
// 			}
// 			<option value="${buyer.buyerId}" class="${buyer.buyerLgu}">${buyer.buyerName}</option>
// 		});
// 		prodBuyer1.not(buyerLgu).attr("hidden");

// 	});
</script>
<jsp:include page="/includee/postScript.jsp" />
</body>
</html>