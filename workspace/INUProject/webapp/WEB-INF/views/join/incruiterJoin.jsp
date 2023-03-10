<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom-bs.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jquery.fancybox.min.css">
<%--     <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap-select.min.css"> --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/fonts/line-icons/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/animate.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/quill.snow.css">
<!-- MAIN CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<!-- slick-slider css파일 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/components.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/help.css" />
<style>
.scroller {
	overflow-y: auto;
	overflow-x: auto;
	height: 311px;
	width: 100%;
	position: sticky;
}
.content {
    max-width: 960px;
}
.help_find .wrap_lab{
	width: 359px;
}
</style>

<section class="site-section">
	<div class="site-wrap">
		<div class="sri_section" class="has_banner">
			<div class="sri_wrap">
				<div class="content" style="margin-left: 17%;">
					<div class="wrap_title_recruit">
						<h1 class="title_common" style="font-size: 40px;">기업회원</h1>
					</div>
							<h3 class="text-black my-1 border-bottom pb-2"
								style="margin-bottom: 0ch;">회사정보</h3>
							<div class="wrap_input">
								<button type="button" id="companyModal" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModal">회사검색
									</button>
							</div>
						<!-- 기업등록 -->
						<div class="help_find help_lost wrap_help" id="companyInsert">
							<div class="cont_find">
								<ul class="list_find">
								<form:form id="companyForm" name="companyForm"
									modelAttribute="company" method="post"
									class="p-4 p-md-5 border rounded" enctype="multipart/form-data">

									<!-- 						<div class="wrap_input"> -->
									<!-- 							<label for="job-title">회사아이디</label> -->
									<%-- 							<form:input path="cmpId" type="text" cssClass="inp_find" /> --%>
									<%-- 							<form:errors path="cmpId" element="span" cssClass="text-danger" /> --%>
									<!-- 						</div> -->
									<li>
										<div class="wrap_lab" style="
											    width: 29%;
											">
											<span class="ico_required"> <span class="blind">필수항목</span>
											</span> <label for="help_title" class="lab_find">사업자등록증</label>
										</div>
										<div class="wrap_input">
											<div class="uploads"></div>
											<!--                   <label for="company-website-tw d-block">프로필사진</label> <br> -->
											<div class="wrap_file">
												<form:input type="file" path="attachFiles" id="attachFiles1"/>
											</div>
											<label class="btn_basic2 type03" for="attachFiles1" style="
											    top: 20px;
											    left: 10px;
											"> 사업자등록증</label>
											<p class="noti_inp">
													10MB 이하의 hwp, pdf, zip, MS Office 파일, 이미지 파일(JPG, GIF, PNG,
													BMP) 만 등록 가능합니다.
													<!--<br/>(최대 5개까지 가능)-->
											</p>
										</div>
									</li>
									<li>
										<div class="wrap_lab" style="
											    width: 29%;
											">
											<span class="ico_required"> <span class="blind">필수항목</span>
											</span> <label for="help_title" class="lab_find">회사로고</label>
										</div>
										<div class="wrap_input">
											<div class="uploads"></div>
											<!--                   <label for="company-website-tw d-block">프로필사진</label> <br> -->
											<div class="wrap_file">
												<form:input type="file" path="attachFiles" id="attachFiles"/>
											</div>
											<label class="btn_basic2 type03" for="attachFiles" style="
											    top: 20px;
											    left: 10px;
											"> 사업자등록증</label>
											<p class="noti_inp">
													10MB 이하의 hwp, pdf, zip, MS Office 파일, 이미지 파일(JPG, GIF, PNG,
													BMP) 만 등록 가능합니다.
													<!--<br/>(최대 5개까지 가능)-->
											</p>
										</div>
									</li>
									<li>
											<div class="wrap_lab">
												<span class="ico_required"> <span class="blind">필수항목</span>
												</span> <label for="help_title" class="lab_find">법인등록번호</label>
											</div>
									<div class="wrap_input">
										<label for="job-title">법인등록번호</label>
										<form:input path="cmpNo" type="text" cssClass="inp_find" />
										<form:errors path="cmpNo" element="span"
											cssClass="text-danger" />
									</div>
									</li>
									<li>
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">필수항목</span>
											</span> <label for="help_title" class="lab_find">법인명</label>
										</div>
										<div class="wrap_input">
											<label for="job-title">법인명</label>
											<form:input path="cmpName" id="companyName" type="text"
												cssClass="inp_find" />
											<form:errors path="cmpName" element="span"
												cssClass="text-danger" />
										</div>
									</li>
									<li>
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">필수항목</span>
											</span> <label for="help_title" class="lab_find">회사대표자성명</label>
										</div>
									<div class="wrap_input">
										<label for="job-title">회사대표자성명</label>
										<form:input path="cmpRepName" type="text"
											cssClass="inp_find" />
										<form:errors path="cmpRepName" element="span"
											cssClass="text-danger" />
									</div>
									</li>
									<li>
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">필수항목</span>
											</span> <label for="help_title" class="lab_find">사업자등록번호</label>
										</div>
									<div class="wrap_input">
										<label for="job-title">사업자등록번호</label>
										<form:input path="cmpBsnsNo" type="text"
											cssClass="inp_find" />
										<form:errors path="cmpBsnsNo" element="span"
											cssClass="text-danger" />
									</div>
									</li>
									<li>
									<div class="wrap_lab" style="
									    width: 351px;
									">
										<span class="ico_required"> <span class="blind">
												필수항목 </span>
										</span> <label for="help_email" class="lab_find"> 주소 </label>
									</div>
									<div class="wrap_input">
										<span class="box_input2"> <input type="button"
											class="inp_find" onclick="sample3_execDaumPostcode()"
											value="우편번호 찾기" > <label
											for="job-title">사업장 우편번호</label>
										</span> <span class="box_input1"> <form:input path="cmpZip"
												type="text" cssClass="inp_find" id="sample3_postcode"
												placeholder="우편번호" /> <form:errors
												path="cmpZip" element="span" cssClass="text-danger"
												 />
										</span> <span class="box_input1"> <label for="job-title">사업장주소</label>
											<form:input path="cmpAddr1" type="text" cssClass="inp_find"
												placeholder="사업장주소" id="sample3_address" /> <form:errors
												path="cmpAddr1" element="span" cssClass="text-danger"
												 />
										</span> <span class="box_input1"> <label for="job-title">사업장
												상세주소</label> <form:input path="cmpAddr2" type="text"
												cssClass="inp_find" id="sample3_detailAddress" placeholder="상세주소"
												 /> <form:errors path="cmpAddr2"
												element="span" cssClass="text-danger"  />
										</span>
									</div>
									<div id="wrap"
										style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
										<img
											src="//t1.daumcdn.net/postcode/resource/images/close.png"
											id="btnFoldWrap"
											style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
											onclick="foldDaumPostcode()" alt="접기 버튼">
									</div>
								</li>
								<li>
									<div class="wrap_lab">
										<span class="ico_required"> <span class="blind">필수항목</span>
										</span> <label for="help_title" class="lab_find">회사전화번호</label>
									</div>
									<div class="wrap_input">
										<label for="job-title">회사전화번호</label>
										<form:input path="cmpPhone" type="text"
											cssClass="inp_find" />
										<form:errors path="cmpPhone" element="span"
											cssClass="text-danger" />
									</div>
								</li>
								<li>
									<div class="wrap_lab">
										<span class="ico_required"> <span class="blind">필수항목</span>
										</span> <label for="help_title" class="lab_find">회사이메일</label>
									</div>
									<div class="wrap_input">
										<label for="job-title">회사이메일</label>
										<form:input path="cmpEmail" type="text"
											cssClass="inp_find" />
										<form:errors path="cmpEmail" element="span"
											cssClass="text-danger" />
									</div>
								</li>
								<li>
									<div class="wrap_lab">
										<span class="ico_required"> <span class="blind">필수항목</span>
										</span> <label for="help_title" class="lab_find">회사URL</label>
									</div>
									<div class="wrap_input">
										<label for="job-title">회사URL</label>
										<form:input path="cmpUrl" type="text" cssClass="inp_find" />
										<form:errors path="cmpUrl" element="span"
											cssClass="text-danger" />
									</div>
								</li>
								<li>
									<div class="wrap_lab">
										<span class="ico_required"> <span class="blind">필수항목</span>
										</span> <label for="help_title" class="lab_find">회사설립일자</label>
									</div>
									<div class="wrap_input">
										<label for="job-title">회사설립일자</label>
										<form:input path="cmpEstblDate" type="date"
											cssClass="inp_find" />
										<form:errors path="cmpEstblDate" element="span"
											cssClass="text-danger" />
									</div>
								</li>
								<li>
									<div class="wrap_lab">
										<span class="ico_required"> <span class="blind">필수항목</span>
										</span> <label for="help_title" class="lab_find">회사형태</label>
									</div>
									<div class="wrap_input">
										<label for="job-title">회사형태</label>
										<form:input path="cmpSmenp" type="text"
											cssClass="inp_find" />
										<form:errors path="cmpSmenp" element="span"
											cssClass="text-danger" />
									</div>
								</li>
								<li>
									<div class="wrap_lab">
										<span class="ico_required"> <span class="blind">필수항목</span>
										</span> <label for="help_title" class="lab_find">회사종업원수</label>
									</div>
									<div class="wrap_input">
										<label for="job-title">회사종업원수</label>
										<form:input path="cmpEmpNo" type="text"
											cssClass="inp_find" />
										<form:errors path="cmpEmpNo" element="span"
											cssClass="text-danger" />
									</div>
								</li>
								<li>
									<div class="wrap_lab">
										<span class="ico_required"> <span class="blind">필수항목</span>
										</span> <label for="help_title" class="lab_find">종업원평균근속기간</label>
									</div>
									<div class="wrap_input">
										<label for="job-title">종업원평균근속기간</label>
										<form:input path="cmpAvrWork" type="text"
											cssClass="inp_find" />
										<form:errors path="cmpAvrWork" element="span"
											cssClass="text-danger" />
									</div>
								</li>	
								<li>
									<div class="wrap_lab">
										<span class="ico_required"> <span class="blind">필수항목</span>
										</span> <label for="help_title" class="lab_find">회사1인평균급여금액</label>
									</div>
									<div class="wrap_input">
										<label for="job-title">회사1인평균급여금액</label>
										<form:input path="cmpAvrSalary" type="text"
											cssClass="inp_find" />
										<form:errors path="cmpAvrSalary" element="span"
											cssClass="text-danger" />
									</div>
								</li>
								<li>
									<div class="wrap_lab">
										<span class="ico_required"> <span class="blind">필수항목</span>
										</span> <label for="help_title" class="lab_find">회사주요사업명</label>
									</div>
									<div class="wrap_input">
										<label for="job-title">회사주요사업명</label>
										<form:input path="cmpMbName" type="text"
											cssClass="inp_find" />
										<form:errors path="cmpMbName" element="span"
											cssClass="text-danger" />
									</div>
								</li>
								<li>
										<div class="wrap_lab">
											<span class="ico_required"> <span class="blind">필수항목</span>
											</span> <label for="help_title" class="lab_find">기업소개</label>
										</div>
									<div class="wrap_input">
										<label for="job-title">기업소개</label>
										<form:textarea path="cmpContent" type="text"
											cssClass="inp_find" />
										<form:errors path="cmpContent" element="span"
											cssClass="text-danger" />
									</div>
								</li>
									<!-- 						<div class="wrap_input"> -->
									<!-- 							<label for="job-title">회사로고</label> -->
									<%-- 							<form:input path="cmpLogo" type="number" cssClass="inp_find" /> --%>
									<%-- 							<form:errors path="cmpLogo" element="span" cssClass="text-danger" /> --%>
									<!-- 						</div> -->
									<div class="wrap_link">
									<div class="row align-items-center mb-5">
										<button type="submit" form="incruiterInsert"
											class="btn_biggest_type01" id=insertCompanyBtn>등록</button>
									</div>
									</div>
								</form:form>
								</ul>
							</div>
							</div>
							<br><br>
							<h3 class="text-black my-1 border-bottom pb-2"
								style="margin-bottom: 0ch;"></h3>
								<br><br>
					<!-- 인사담당자 등록 -->
					<div class="help_find help_lost wrap_help" >
						<div class="cont_find">
								<ul class="list_find">
							<form:form id="insertIncruiter" name="insertIncruiter"
								modelAttribute="incruiter" method="post"
								class="p-4 p-md-5 border rounded">
								<h3 class="text-black mb-5 border-bottom pb-2">인사 담당자 정보</h3>
								<!-- 회사 아이디 담을 히든폼 -->
								<!-- 	<div class="wrap_input">
	                    <label for="company-website-tw d-block">보유자격증</label> <br>
	                    <label class="btn btn-primary btn-md btn-file">
	                      자격증선택<input type="file" hidden>
	                    </label>
                  		</div> -->
							<li>
								<div class="wrap_lab">
									<span class="ico_required"> <span class="blind">필수항목</span>
									</span> <label for="help_title" class="lab_find">회사명</label>
								</div>
									<form:input path="cmpId" type="hidden" id="companyId"
										cssClass="inp_find" />
								<div class="wrap_input">
									<label for="job-title">회사명</label> <input type="text"
										class="inp_find" id="companyName" placeholder=""
										name="cmpName" disabled>
								</div>
							</li>
								<!-- <div class="wrap_input">
							<label for="company-website-tw d-block">프로필사진</label> <br> <label
								class="btn btn-primary btn-md btn-file"> 사진선택<input
								type="file" hidden>
							</label>
						</div> -->
						<li>
								<div class="wrap_lab">
									<span class="ico_required"> <span class="blind">필수항목</span>
									</span> <label for="help_title" class="lab_find">회원아이디</label>
								</div>
								<div class="wrap_input">
									<label for="job-title">회원아이디</label>
									<form:input path="memId" type="text" cssClass="inp_find" />
									<form:errors path="memId" element="span" cssClass="text-danger" />
								</div>
							</li>
							<li>
								<div class="wrap_lab">
									<span class="ico_required"> <span class="blind">필수항목</span>
									</span> <label for="help_title" class="lab_find">비밀번호</label>
								</div>
								<div class="wrap_input">
									<label for="job-title">비밀번호</label>
									<form:input path="memPass" type="text" cssClass="inp_find" />
									<form:errors path="memPass" element="span"
										cssClass="text-danger" />
								</div>
							</li>
							<li>
								<div class="wrap_lab">
									<span class="ico_required"> <span class="blind">필수항목</span>
									</span> <label for="help_title" class="lab_find">이름</label>
								</div>
								<div class="wrap_input">
									<label for="job-title">이름</label>
									<form:input path="memName" type="text" cssClass="inp_find" />
									<form:errors path="memName" element="span"
										cssClass="text-danger" />
								</div>
							</li>
							<li>
								<div class="wrap_lab">
									<span class="ico_required"> <span class="blind">필수항목</span>
									</span> <label for="help_title" class="lab_find">이메일</label>
								</div>
								<div class="wrap_input">
									<label for="job-title">이메일</label>
									<form:input path="memEmail" type="text" cssClass="inp_find" />
									<form:errors path="memEmail" element="span"
										cssClass="text-danger" />
								</div>
							</li>
							<li>
								<div class="wrap_lab">
									<span class="ico_required"> <span class="blind">필수항목</span>
									</span> <label for="help_title" class="lab_find">전화번호</label>
								</div>
								<div class="wrap_input">
									<label for="job-title">전화번호</label>
									<form:input path="memTel" type="text" cssClass="inp_find" />
									<form:errors path="memTel" element="span"
										cssClass="text-danger" />
								</div>
							</li>
									<div class="wrap_link">
										<a href="${pageContext.request.contextPath }/">
											<button type="button" class="btn_biggest_type03"
												id="help_cancel">취소하기</button>
										</a>
										<button type="submit" class="btn_biggest_type01"
											id="help_send">가입하기</button>
									</div>
							</form:form>
									</ul>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
</section>

<jsp:include page="incruiterModal.jsp"></jsp:include>

<script
	src="<%=request.getContextPath()%>/resources/js/company/incruiterJoin.js">
	
</script>
<!-- SCRIPTS -->
<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/stickyfill.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery.fancybox.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery.easing.1.3.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/js/jquery.waypoints.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery.animateNumber.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/quill.min.js"></script>


<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap-select.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/daumPostcode.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
<!-- 다음 주소 찾기 api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- slick-slider js 소스 -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
