<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-hover table-bordered">
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
	<tbody id="listBody" />
	<tfoot>
		<tr>
			<td colspan="7">
				<div class="pagingArea">
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
		<tr>
			<td colspan="7">
				<form id="searchForm">
					<input type="text" name="page" />
					<input type="text" name="prodLgu" placeholder="분류코드"/>
					<input type="text" name="prodBuyer" placeholder="거래처코드"/>
					<input type="text" name="prodName" placeholder="상품명"/>
				</form>
			</td>
		</tr>
	</tfoot>
</table>

<script>
	$("[name=prodLgu]").on("change", function(){
		let prodLgu = $(this).val();
		if (prodLgu) {
			prodBuyerTag.find("option:gt(0)").hide();
			prodBuyerTag.find("option." + prodLgu).show();
		}
	}).val("${detailCondition.prodLgu}");
	let prodBuyerTag = $("[name=prodBuyer]").val("${detailCondition.prodBuyer}");

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
		let aTag = $("<a>").attr("href", "${pageContext.request.contextPath}/prod/" + prod.prodId).html(prod.prodName);
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
				pagingArea.html(resp.pagingHTML);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	}).submit();
	
	searchForm.trigger();
	
	let searchUI = $("#searchUI").on("click", "#searchBtn", function(){
		let inputs = searchUI.find(":input[name]");
		$.each(inputs, function(index, input){
			let name = this.name;
			let value = $(this).val();

			searchForm[0][name].value = value;
		});
		searchForm.submit();
	});
	
</script>