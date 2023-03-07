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
.count {
    color: #888;
    font-size: 20px;
    font-weight: normal;
    letter-spacing: -1px;
    line-height: 30px;
}
</style>

<div id="sri_section" class="layout_full">
	<div id="sri_wrap">
		<div id="content">
			<div class="company_honest_qna">
				<div class="contents_container">
					<div class="wrap_story_panel">
						<div class="wrap_section wrap_community_topic" style="margin-top: 36px;">
							<div class="wrap_title">
								<h3 class="main_tit">블랙회원목록</h3>
							</div>
							<div class="list_num_tit sub">
								<strong class="count">총
									<span style="color: #ff3c00;">
										${fn:length(blackList)}
									</span>건
								</strong>
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
											<th>블랙일자</th>
											<th>블랙만료일자</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty blackList }">
												<c:forEach items="${blackList }" var="black">
													<tr class="notice">
														<td>${black.rnum }</td>
														<td>${black.memId }</td>
														<td>${black.memName }</td>
														<td>${black.memJoinDate }</td>
														<td>${black.blackVO.blackListDate }</td>
														<td>${black.blackVO.blackListCheck }</td>
														<td>
															<a href="<c:url value='/systemManagement/memberList/blackList/${black.memId }' />">
																상세보기
															</a>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="7">
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
	</div>
</div>

<script>
	
	
</script>




















