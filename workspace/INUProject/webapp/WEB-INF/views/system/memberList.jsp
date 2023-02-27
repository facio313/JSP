<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/pattern.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css"/>  

<style>
  .company_honest_qna .contents_container {
    width: 90%;
}

.wrap_community_topic .section_inner {
    width: 490px;
    height: 520px;
}

.wrap_community_topic .section_inner:nth-child(even) {
    float: left;
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
								<h3 class="main_tit">회원 목록</h3>
							</div>
							<div class="wrap_slide_category">
								<div class="bx-wrapper" style="max-width: 1374px">
									<div class="bx-viewport" aria-live="polite" style=" width: 100%; overflow: hidden; position: relative; height: 50px;">
										<ul class="list_category js-category" style=" width: 11215%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                        					<li aria-hidden="false" style=" float: left; list-style: none; position: relative; width: 170px; margin-right: 12px;">
                          						<a class="item_cate selected" href="<c:url value='#'/>">
													전체
												</a>
											</li>
                        					<li aria-hidden="false" style=" float: left; list-style: none; position: relative; width: 170px; margin-right: 12px;">
                          						<a class="item_cate" href="<c:url value='/systemManagement/memberList/seekerList'/>">
													일반회원목록
												</a>
											</li>
											<li aria-hidden="true" style=" float: left; list-style: none; position: relative; width: 170px; margin-right: 12px;">
												<a class="item_cate" href="<c:url value='#'/>">
													기업회원목록
												</a>
											</li>
											<li aria-hidden="true" style=" float: left; list-style: none; position: relative; width: 170px; margin-right: 12px;">
												<a class="item_cate" href="<c:url value='#'/>">
													전문가회원목록
												</a>
											</li>
											<li aria-hidden="true" style=" float: left; list-style: none; position: relative; width: 170px; margin-right: 12px;">
												<a class="item_cate" href="<c:url value='/systemManagement/memberList/cutList'/>">
													차단회원목록
												</a>
											</li>
											<li aria-hidden="true" style=" float: left; list-style: none; position: relative; width: 170px; margin-right: 12px;">
												<a class="item_cate" href="<c:url value='/systemManagement/memberList/blackList'/>">
													블랙회원목록
												</a>
											</li>
											<li aria-hidden="true" style=" float: left; list-style: none; position: relative; width: 170px; margin-right: 12px;">
												<a class="item_cate" href="<c:url value='#'/>">
													탈퇴회원목록
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
                			<div class="community_list">
                  				<div class="section_inner" style="margin-right:55px">
                    				<div class="wrap_title">
                      					<h4 class="title">
                        					<a href="<c:url value='/systemManagement/memberList/seekerList'/>" >
                        						일반회원목록
                        					</a>
                      					</h4>
                      					<a href="<c:url value='/systemManagement/memberList/seekerList'/>" >
                      						더보기
                      					</a>
                    				</div>
                    				<div class="tblType">
	                    				<table>
	                    					<colgroup>
							            		<col width="50">
							          		</colgroup>
	                    					<thead>
	                    						<tr>
	                    							<th>번호</th>
	                    							<th>ID</th>
	                    							<th>이름</th>
	                    							<th>가입일자</th>
	                    						</tr>
	                    					</thead>
	                    					<tbody>
	                    						<c:choose>
		                    						<c:when test="${not empty seekerList }">
		                    							<c:forEach items="${seekerList }" var="seeker" begin="0" end="7">
		                    								<c:if test="${seeker.memDelete eq null }">
			                    								<tr>
			                    									<td>${seeker.rnum }</td>
						                    						<td>${seeker.memId }</td>
						                    						<td>${seeker.memName }</td>
						                    						<td>${seeker.memJoinDate }</td>
			                    								</tr>
		                    								</c:if>
		                    							</c:forEach>
		                    						</c:when>
		                    						<c:otherwise>
		                    								<li>
		                    									목록 없음
		                    								</li>
		                    						</c:otherwise>
		                    					</c:choose>
	                    					</tbody>
	                    				</table>
                    				</div>
                  				</div>
                  				<div class="section_inner" style="margin-right:55px">
                    				<div class="wrap_title">
                      					<h4 class="title">
                        					<a href="<c:url value='#'/>">
                        						기업회원목록
                        					</a>
                      					</h4>
                      					<a href="<c:url value='#'/>">
                      						더보기
                      					</a>
                    				</div>
                    				<div class="tblType">
	                    				<table>
	                    					<colgroup>
							            		<col width="50">
							          		</colgroup>
		                    				<thead>
		                    					<tr>
		                    						<th>번호</th>
	                    							<th>ID</th>
	                    							<th>이름</th>
	                    							<th>가입일자</th>
		                    					</tr>
		                    				</thead>
		                    				<tbody>
		                    					<c:choose>
		                    						<c:when test="${not empty incruiterList }">
		                    							<c:forEach items="${incruiterList }" var="incruiter" begin="0" end="7">
		                    								<tr>
		                    									<td>${incruiter.rnum }</td>
					                    						<td>${incruiter.memId }</td>
					                    						<td>${incruiter.memName }</td>
					                    						<td>${incruiter.memJoinDate }</td>
		                    								</tr>
		                    							</c:forEach>
		                    						</c:when>
		                    						<c:otherwise>
		                    								<li>
		                    									목록 없음
		                    								</li>
		                    						</c:otherwise>
		                    					</c:choose>
		                    				</tbody>
	                    				</table>
                    				</div>
                  				</div>
                  				<div class="section_inner" >
                    				<div class="wrap_title">
                      					<h4 class="title">
                        					<a href='<c:url value="#"/>'>
                        						전문가회원목록
                       						</a>
                      					</h4>
                      					<a href='<c:url value="#"/>'>
                      						더보기
                      					</a>
                    				</div>
                    				<div class="tblType">
	                    				<table>
	                    					<colgroup>
							            		<col width="50">
							          		</colgroup>
	                    					<thead>
	                    						<tr>
	                    							<th>번호</th>
	                    							<th>ID</th>
	                    							<th>이름</th>
	                    							<th>가입일자</th>
	                    						</tr>
	                    					</thead>
	                    					<tbody>
	                    						<c:choose>
		                    						<c:when test="${not empty expertList }">
		                    							<c:forEach items="${expertList }" var="expert" begin="0" end="7">
		                    								<tr>
		                    									<td>${expert.rnum }</td>
					                    						<td>${expert.memId }</td>
					                    						<td>${expert.memName }</td>
					                    						<td>${expert.memJoinDate }</td>
		                    								</tr>
		                    							</c:forEach>
		                    						</c:when>
		                    						<c:otherwise>
		                    								<li>
		                    									목록 없음
		                    								</li>
		                    						</c:otherwise>
		                    					</c:choose>
	                    					</tbody>
	                    				</table>
                    				</div>
                  				</div>
                  				<div class="section_inner" style="margin-right:55px">
                    				<div class="wrap_title">
                      					<h4 class="title">
                        					<a href='<c:url value="/systemManagement/memberList/cutList"/>'>
                        						차단회원목록
                       						</a>
                      					</h4>
                      					<a href='<c:url value="/systemManagement/memberList/cutList"/>'>
                      						더보기
                      					</a>
                    				</div>
                    				<div class="tblType">
	                   					<table>
	                    					<colgroup>
							            		<col width="50">
							          		</colgroup>
	                    					<thead>
	                    						<tr>
	                    							<th>번호</th>
	                    							<th>ID</th>
	                    							<th>이름</th>
	                    							<th>가입일자</th>
	                    						</tr>
	                    					</thead>
	                    					<tbody>
	                    						<c:choose>
		                    						<c:when test="${not empty cutList }">
		                    							<c:forEach items="${cutList }" var="cut" begin="0" end="7">
		                    								<tr>
		                    									<td>${cut.rnum }</td>
					                    						<td>${cut.memId }</td>
					                    						<td>${cut.memName }</td>
					                    						<td>${cut.cutVO.cutDate }</td>
		                    								</tr>
		                    							</c:forEach>
		                    						</c:when>
		                    						<c:otherwise>
		                    								<li>
		                    									목록 없음
		                    								</li>
		                    						</c:otherwise>
		                    					</c:choose>
	                    					</tbody>
	                    				</table>
                    				</div>
                  				</div>
                  				<div class="section_inner" style="margin-right:55px">
                    				<div class="wrap_title">
                      					<h4 class="title">
                        					<a href='<c:url value="/systemManagement/memberList/blackList"/>'>
                        						블랙회원목록
                       						</a>
                      					</h4>
                      					<a href='<c:url value="/systemManagement/memberList/blackList"/>'>
                      						더보기
                      					</a>
                    				</div>
                    				<div class="tblType">
	                    				<table>
	                    					<colgroup>
							            		<col width="50">
							          		</colgroup>
	                    					<thead>
	                    						<tr>
	                    							<th>번호</th>
	                    							<th>ID</th>
	                    							<th>이름</th>
	                    							<th>가입일자</th>
	                    						</tr>
	                    					</thead>
	                    					<tbody>
	                    						<c:choose>
		                    						<c:when test="${not empty blackList }">
		                    							<c:forEach items="${blackList }" var="black" begin="0" end="7">
		                    								<tr>
		                    									<td>${black.rnum }</td>
					                    						<td>${black.memId }</td>
					                    						<td>${black.memName }</td>
					                    						<td>${black.blackVO.blackListDate }</td>
		                    								</tr>
		                    							</c:forEach>
		                    						</c:when>
		                    						<c:otherwise>
		                    								<li>
		                    									목록 없음
		                    								</li>
		                    						</c:otherwise>
		                    					</c:choose>
	                    					</tbody>
	                    				</table>
                    				</div>
                  				</div>
                  				<div class="section_inner" >
                    				<div class="wrap_title">
                      					<h4 class="title">
                        					<a href='<c:url value="#"/>'>
                        						탈퇴회원목록
                       						</a>
                      					</h4>
                      					<a href='<c:url value="#"/>'>
                      						더보기
                      					</a>
                    				</div>
                    				<div class="tblType">
	                    				<table>
	                    					<colgroup>
							            		<col width="50">
							          		</colgroup>
	                    					<thead>
	                    						<tr>
	                    							<th>번호</th>
	                    							<th>ID</th>
	                    							<th>이름</th>
	                    							<th>가입일자</th>
	                    						</tr>
	                    					</thead>
	                    					<tbody>
	                    						<c:choose>
		                    						<c:when test="${not empty delMemList }">
		                    							<c:forEach items="${delMemList }" var="delMem" begin="0" end="7">
		                    								<tr>
		                    									<td>${delMem.rnum }</td>
					                    						<td>${delMem.memId }</td>
					                    						<td>${delMem.memName }</td>
					                    						<td>${delMem.memDelete }</td>
		                    								</tr>
		                    							</c:forEach>
		                    						</c:when>
		                    						<c:otherwise>
		                    								<tr>
		                    									<td></td>
		                    									<td></td>
		                    									<td>목록 없음</td>
		                    								</tr>
		                    						</c:otherwise>
		                    					</c:choose>
	                    					</tbody>
	                    				</table>
                    				</div>
                  				</div>
                			</div>
              			</div>
           			</div>
        		</div>
      		</div>
    	</div>
  	</div>
</div>

