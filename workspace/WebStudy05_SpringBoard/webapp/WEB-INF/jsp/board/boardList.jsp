<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<table class="table table-hover table-bordered">
	<thead>
		<tr>
			<th>일련번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>이메일</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody id="listBody">
		<c:set var="boardList" value="${pagingVO.dataList}"/>
		<c:choose>
			<c:when test="${not empty boardList}">
				<c:forEach items="${boardList}" var="board" varStatus="">
					<tr>
						<td>${board.boNo}</td>
						<td>
							<c:url value="/board/boardView.do" var="viewURL">
								<c:param name="boNo" value="${board.boNo}"/>
							</c:url>
							<a href="${viewURL}">${board.boTitle}[${board.attCount}]</a>
						</td>
						<td>${board.boWriter}</td>
						<td>${board.boMail}</td>
						<td>${board.boDate}</td>
						<td>${board.boHit }</td>						
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">조건에 맞는 회원이 없음</td>
				</tr>
			</c:otherwise>
		</c:choose>	</tbody>
	<tfoot>
		<tr>
			<td colspan="6">
				<div class="pagingArea">${pagingVO.pagingHTML}</div>
				<form:form id="searchUI" modelAttribute="simpleCondition" method="get" onclick="return false;">
					<form:select path="searchType">
						<option value>전체</option>
						<form:option value="writer" label="작성자" />
						<form:option value="content" label="내용" />
					</form:select>
					<form:input path="searchWord" />
					<input type="button" value="검색" id="searchBtn"/>
				</form:form>
			</td>
		</tr>
	</tfoot>
</table>
<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
	<form:hidden path="searchType"/>
	<form:hidden path="searchWord"/>
	<input type="hidden" name="page" />
</form:form>
<script>
// 	$("[name=searchType]").val("${searchVO.searchType}"); // 이미 커스텀태그를 사용해서 안 써도 됨
// 	$("[name=searchWord]").val("${searchVO.searchWord}");
	
	
	// 서버 사이드가 없어서 그냥 어디든 갖다 쓰면 됨 // #searchBtn만 설정해주기
	let searchForm = $("#searchForm");
	let searchUI = $("#searchUI").on("click", "#searchBtn", function(){
		let inputs = searchUI.find(":input[name]") // $("input") vs $(":input") 후자는 select도 선택됨
		$.each(inputs, function(index, input){
			let name = this.name;
			let value = $(this).val();
			searchForm.find("[name=" + name + "]").val(value);
		});
		searchForm.submit();
						
	});
	
	$("a.paging").on("click", function(event){
		event.preventDefault();
		
		let page = $(this).data("page");
		if (!page) return false;
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
		
		return false;
	});
</script>
