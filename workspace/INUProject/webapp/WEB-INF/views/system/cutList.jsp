<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/pattern.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/components.css"/>  
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/help.css">

<style>
.sub_top_wrap.tag_list::before {
	background: 0;
}
.company_honest_qna .contents_container {
  	width: 95%;
}
</style>

<div id="sri_section" class="layout_full">
	<div id="sri_wrap">
		<div id="content">
			<div class="company_honest_qna">
				<div class="contents_container">
					<div class="sub_top_wrap tag_list">
						<span class="sub_title_tag">
							<strong class="stit">전문가회원목록</strong>
						</span>
					</div>
					<c:set var="cutList" value="${cutList }"/>
					<div class="list_num_tit sub">
						전체 <strong>${fn:length(cutList)}</strong>건
					</div>
					<div class="tblType">
						<table>
							<colgroup>
								<col width="80">
								<col width="250">
								<col width="200">
								<col width="150">
								<col width="150">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>가입일자</th>
									<th>차단일자</th>
									<th>차단만료일자</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty cutList }">
										<c:forEach items="${cutList }" var="cut">
											<tr class="notice">
												<td>${cut.rnum }</td>
												<td>${cut.memId }</td>
												<td>${cut.memName }</td>
												<td>${cut.memJoinDate }</td>
												<td>${cut.cutVO.cutDate }</td>
												<td>${cut.cutVO.cutCheck }</td>
												<td>
													<a href="<c:url value='#' />">
														상세보기
													</a>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td>
												목록 없음
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
							<tfoot>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	
	
</script>




















