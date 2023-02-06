<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="site-wrap">

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close mt-3">
				<span class="icon-close2 js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>
	<!-- .site-mobile-menu -->


	<section class="site-section">
		<div class="container">

			<div class="row align-items-center mb-5">
				<div class="col-lg-8 mb-4 mb-lg-0">
					<div class="d-flex align-items-center">
						<div>
							<h2>기업회원</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-lg-12">
					<h3 class="text-black my-1 border-bottom pb-2"
						style="margin-bottom: 0ch;">회사정보</h3>
					<div class="form-group">
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#exampleModal">회사검색 모달</button>

					</div>
					<div id=companyInsert>
						<form:form id="companyForm" name="companyForm"
							modelAttribute="company" method="post" onclick="return false;">

							<!-- 						<div class="form-group"> -->
							<!-- 							<label for="job-title">회사아이디</label> -->
							<%-- 							<form:input path="cmpId" type="text" cssClass="form-control" /> --%>
							<%-- 							<form:errors path="cmpId" element="span" cssClass="text-danger" /> --%>
							<!-- 						</div> -->
							<div class="form-group">
								<label for="job-title">법인등록번호</label>
								<form:input path="cmpNo" type="text" cssClass="form-control" />
								<form:errors path="cmpNo" element="span" cssClass="text-danger" />
							</div>
							<div class="form-group">
								<label for="job-title">법인명</label>
								<form:input path="cmpName" id="companyName" type="text"
									cssClass="form-control" />
								<form:errors path="cmpName" element="span"
									cssClass="text-danger" />
							</div>
							<div class="form-group">
								<label for="job-title">회사대표자성명</label>
								<form:input path="cmpRepName" type="text"
									cssClass="form-control" />
								<form:errors path="cmpRepName" element="span"
									cssClass="text-danger" />
							</div>
							<div class="form-group">
								<label for="job-title">사업자등록번호</label>
								<form:input path="cmpBsnsNo" type="text" cssClass="form-control" />
								<form:errors path="cmpBsnsNo" element="span"
									cssClass="text-danger" />
							</div>
							<div class="form-group">
								<label for="job-title">회사우편번호</label>
								<form:input path="cmpZip" type="text" id="sample3_postcode"
									cssClass="form-control" placeholder="우편번호" />
								<form:errors path="cmpZip" element="span" cssClass="text-danger" />
								<input type="button" class="form-control"
									onclick="sample3_execDaumPostcode()" value="우편번호 찾기"> <label
									for="job-title">회사기본주소</label>
								<form:input path="cmpAddr1" type="text" id="sample3_address"
									placeholder="주소" cssClass="form-control" />
								<form:errors path="cmpAddr1" element="span"
									cssClass="text-danger" />
								<label for="job-title">회사상세주소</label>
								<form:input path="cmpAddr2" type="text"
									id="sample3_detailAddress" placeholder="상세주소"
									cssClass="form-control" />
								<form:errors path="cmpAddr2" element="span"
									cssClass="text-danger" />
							</div>
							<div id="wrap"
								style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
									id="btnFoldWrap"
									style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
									onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>
							<div class="form-group">
								<label for="job-title">회사전화번호</label>
								<form:input path="cmpPhone" type="text" cssClass="form-control" />
								<form:errors path="cmpPhone" element="span"
									cssClass="text-danger" />
							</div>
							<div class="form-group">
								<label for="job-title">회사이메일</label>
								<form:input path="cmpEmail" type="text" cssClass="form-control" />
								<form:errors path="cmpEmail" element="span"
									cssClass="text-danger" />
							</div>
							<div class="form-group">
								<label for="job-title">회사URL</label>
								<form:input path="cmpUrl" type="text" cssClass="form-control" />
								<form:errors path="cmpUrl" element="span" cssClass="text-danger" />
							</div>
							<div class="form-group">
								<label for="job-title">회사설립일자</label>
								<form:input path="cmpEstblDate" type="date"
									cssClass="form-control" />
								<form:errors path="cmpEstblDate" element="span"
									cssClass="text-danger" />
							</div>
							<div class="form-group">
								<label for="job-title">회사형태</label>
								<form:input path="cmpSmenp" type="text" cssClass="form-control" />
								<form:errors path="cmpSmenp" element="span"
									cssClass="text-danger" />
							</div>
							<div class="form-group">
								<label for="job-title">회사종업원수</label>
								<form:input path="cmpEmpNo" type="text" cssClass="form-control" />
								<form:errors path="cmpEmpNo" element="span"
									cssClass="text-danger" />
							</div>
							<div class="form-group">
								<label for="job-title">종업원평균근속기간내용</label>
								<form:input path="cmpAvrWork" type="text"
									cssClass="form-control" />
								<form:errors path="cmpAvrWork" element="span"
									cssClass="text-danger" />
							</div>
							<div class="form-group">
								<label for="job-title">회사1인평균급여금액</label>
								<form:input path="cmpAvrSalary" type="text"
									cssClass="form-control" />
								<form:errors path="cmpAvrSalary" element="span"
									cssClass="text-danger" />
							</div>
							<div class="form-group">
								<label for="job-title">회사주요사업명</label>
								<form:input path="cmpMbName" type="text" cssClass="form-control" />
								<form:errors path="cmpMbName" element="span"
									cssClass="text-danger" />
							</div>

							<div class="form-group">
								<label for="job-title">기업소개</label>
								<form:textarea path="cmpContent" type="text"
									cssClass="form-control" />
								<form:errors path="cmpContent" element="span"
									cssClass="text-danger" />
							</div>
							<!-- 						<div class="form-group"> -->
							<!-- 							<label for="job-title">회사로고</label> -->
							<%-- 							<form:input path="cmpLogo" type="number" cssClass="form-control" /> --%>
							<%-- 							<form:errors path="cmpLogo" element="span" cssClass="text-danger" /> --%>
							<!-- 						</div> -->
							<div class="row align-items-center mb-5">
								<button type="submit" form="incruiterInsert"
									class="btn btn-block btn-primary btn-md" id=insertCompanyBtn>등록</button>
							</div>
						</form:form>
					</div>
					<br>
					<form:form id="insertIncruiter" name="insertIncruiter"
						modelAttribute="incruiter" method="post" onclick="return false;">
						<h3 class="text-black mb-5 border-bottom pb-2">인사 담당자 정보</h3>
						<!-- 회사 아이디 담을 히든폼 -->
						<div class="form-group">
							<form:input path="cmpId" type="text" id="companyId" cssClass="form-control" />
							<form:errors path="cmpId" element="span" cssClass="text-danger" />
						</div>
						<div class="form-group">
							<label for="job-title">회사명</label> <input type="text"
								class="form-control" id="companyName" placeholder=""
								name="cmpName" disabled>
						</div>
						<!-- <div class="form-group">
							<label for="company-website-tw d-block">프로필사진</label> <br> <label
								class="btn btn-primary btn-md btn-file"> 사진선택<input
								type="file" hidden>
							</label>
						</div> -->
						<div class="form-group">
							<label for="job-title">회원아이디</label>
							<form:input path="memId" type="text" cssClass="form-control" />
							<form:errors path="memId" element="span" cssClass="text-danger" />
						</div>
						<div class="form-group">
							<label for="job-title">비밀번호</label>
							<form:input path="memPass" type="text" cssClass="form-control" />
							<form:errors path="memPass" element="span" cssClass="text-danger" />
						</div>
						<div class="form-group">
							<label for="job-title">이름</label>
							<form:input path="memName" type="text" cssClass="form-control" />
							<form:errors path="memName" element="span" cssClass="text-danger" />
						</div>
						<div class="form-group">
							<label for="job-title">이메일</label>
							<form:input path="memEmail" type="text" cssClass="form-control" />
							<form:errors path="memEmail" element="span"
								cssClass="text-danger" />
						</div>
						<div class="form-group">
							<label for="job-title">전화번호</label>
							<form:input path="memTel" type="text" cssClass="form-control" />
							<form:errors path="memTel" element="span" cssClass="text-danger" />
						</div>
					</form:form>
				</div>
			</div>
			<div class="row align-items-center mb-5">

				<div class="col-lg-4 ml-auto">
					<div class="row">
						<div class="col-6">
							<a href="#" class="btn btn-block btn-light btn-md"
								style="border: 1px solid;">이전</a>
						</div>
						<div class="col-6">
							<button type="submit" form="insertIncruiter"
								class="btn btn-block btn-primary btn-md">가입</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<!-- 모달창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	style="top: 100px">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">회사검색</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- 검색영역 시작 -->
				<form:form id="searchUI" name="myform"
					modelAttribute="simpleCondition" method="post"
					onclick="return false;">
					<fieldset>
						<legend>통합검색</legend>
						<table class="tb wrt_tb2 mb10">
							<caption>회사검색 테이블</caption>
							<colgroup>
								<col style="width: 120px;">
								<col>
								<col style="width: 100px;">
							</colgroup>
							<tr>
								<th>회사명</th>
								<form:input path="searchType" type="hidden" value="company" />
								<td><form:input path="searchWord" type="text"
										style="width: 100%;" value="" id="searchWord" /> <!--                   	<input type="text" id=searchWord  style="width: 100%;"> -->
								</td>
								<td class="tc">
									<button type="button" class="btn btn-black btn-sm"
										id="searchBtn">검색</button>
								</td>
							</tr>
						</table>
					</fieldset>
				</form:form>
				<!-- 검색영역 끝 -->
				<!-- 검색결과 시작 -->
			</div>
			<div class="well well-gray group_srch_result">
				<!-- <span class="clr-red">검색된 결과가 없습니다.<span> -->
				<table border="1" style="width: 100%;">
					<thead>
						<tr>
							<th style="font-weight: border:">회사이름</th>
							<th style="font-weight: border:">대표자</th>
							<th style="font-weight: bolder;">회사위치</th>
						</tr>
					</thead>
					<tbody name="companyList" id="companyList">
						<c:set var="companyList" value="${pagingVO.dataList }"></c:set>
						<c:choose>
							<c:when test="${not empty companyList }">
								<c:forEach items="${companyList }" var="company">
									<tr>
										<td><a href="" onclick="companyClick(this)"
											data-dismiss="modal" style="color: black; font-weight: bold;">${company.cmpName }</a></td>
										<td>${company.cmpRepName }</td>
										<td>${company.cmpAddr2 }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3">검색된 회사가 없음.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>

			<!-- 검색결과 끝 -->
			<div class="modal-footer">
				<button type="button" class="btn btn-dark" id="insertComBtn"
					data-dismiss="modal">회사등록</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
</div>


<script
	src="<%=request.getContextPath()%>/resources/js/company/incruiterJoin.js"></script>
