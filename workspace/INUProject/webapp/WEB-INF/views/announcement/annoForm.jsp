<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 2.      양서연      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set  var="prePath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${prePath}/resources/css/custom-bs.css">
<link rel="stylesheet" href="${prePath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="${prePath}/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${prePath}/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="${prePath}/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="${prePath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${prePath}/resources/css/animate.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script src="${prePath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<!-- MAIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
.pp {
	margin-bottom: 15px;
	color:black;
}
.ck-editor__editable { 
	height: 400px; 
}
.ref{
	color: red;
	font-size: 6px;
}
.chck {
	display: inline-block;
	margin: 1px;
	margin-right: 20px;
}

.text_box {position:relative; display:inline-block; width:100%;}
.text_box textarea {width:100%; height:152px; color:#666; font-family:"ht_r"; font-size:18px; line-height:28px; padding:20px; border:1px solid #e4dcd3; outline:0; resize:none}
.text_box .count {position:absolute; right:20px; bottom:20px; color:#666; font-family:"ht_r"; font-size:15px;}
.box{border:1px solid #e4dcd3}
.divbox input:focus{border-color: rgb(4, 87, 56); outline: none;}

/* .ck-content {  */
/* 	font-size: 12px;  */
/* } */
</style>
<security:authorize url="/announcement/insert">
<!-- html body -->
<div class="site-wrap" style="background-color: white">
	<!-- HOME -->
	<section class="section-hero overlay inner-page bg-image" style="background-image: url('resources/images/hero_1.jpg');" id="home-section">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1 class="text-white font-weight-bold">Post A Job</h1>
					<div class="custom-breadcrumbs">
						<a href="#">Home</a> <span class="mx-2 slash">/</span>
						<a href="#">Job</a> <span class="mx-2 slash">/</span>
						<span class="text-white"><strong>Post a Job</strong></span>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="site-section">
		<div class="container">
			<div class="row align-items-center mb-5">
				<div class="col-lg-8 mb-4 mb-lg-0">
					<div class="d-flex align-items-center">
						<div>
							<h2>공통 입력</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-lg-12">
					<form:form modelAttribute="anno" enctype="multipart/form-data" class="p-4 p-md-5 border rounded" method="post">
						<!-- 1. 담당자 정보 : 담당자 이름, 전화번호, 이메일 주소, 업종, 대표 근무지역(+api)  -->
						<!-- 2. 모집분야 : 모집분야명, 모집인원, 경력여부*, 담당업무, 근무부서, 근무 직급직책*(최대 3개까지 선택 가능), 필수/우대조건 -->
						<!-- 3. 자격/조건 : 지원자 학력*, 지원자 성별(성차별금지 남녀고용평등에 관한 법률), 지원자 연령(연령차별 금지에 관한 법률), 연봉/급여, 고용형태*, 수습기간, 근무요일, 근무시간 -->
						<!-- 4. 채용절차 : 공고 대표 직무*, 지원 접수 기간, 전형절차(, 제출서류) -->
						<!-- 5. 채용 제목, 근무환경, 복지/처우, 입사 전형, 지원 자격 -->
						
						<!-- 1. 담당자 정보 : 담당자 이름, 전화번호, 이메일 주소, 업종, 대표 근무지역(+api)  -->
						<h3 class="text-black mb-5 border-bottom pb-2">1.대표 정보</h3>
						<div style="margin-bottom: 100px">
							<!-- 담당자 아이디 -->
							<div class="form-group">
								<form:hidden path="memId" value="asdf"/>
								<form:hidden path="cmpId" value="C777777"/>
							</div>
							<div class="container">
								<div class="row pp">
									<div class="col-6 col-md-2" >
										공지 제목
										<div class="ref">
											※필수
										</div>
									</div>
									<div class="form-group col-md-10" >
										<form:input path="annoTitle" type="text" class="box" style="width: 600px" placeholder="제목을 입력해주세요" />
									</div>
								</div>
								<div class="row pp">
									<div class="col-6 col-md-2" >
										모집 기간
										<div class="ref">
											※필수
										</div>
									</div>
									<div class="form-group col-md-10" >
										<input type="text" name="datetimes" class="box" style="width: 270px"/>
										<form:hidden path="annoStartdate" />
										<form:hidden path="annoEnddate" />
									</div>
								</div>
								<div class="row pp">
									<div class="col-6 col-md-2">
										업종
										<div class="ref">
											※필수
										</div>
									</div>
									<div class="form-group col-md-6 ">
										<form:select path="industry0" class="box">
											<option value>대분류</option>
										</form:select>
										<form:select path="industry1" class="box">
											<option value>중분류</option>
										</form:select>
										<form:select path="industryCode" class="box">
											<option value>소분류</option>
										</form:select>
									</div>
								</div>
							</div>
							<div class="container">
								<div class="row pp">
									<div class="col-6 col-md-2">근무 환경</div>
									<div class="form-group col-md-6 text_box text_boxp2">
										<form:textarea path="annoWorkenv" rows="4" cols="50"></form:textarea>
										<div class="count countp2"><span>0</span>/200</div>
									</div>
								</div>
							</div>
							<!-- 지원자 학력 -->
							<div class="container">
								<div class="row pp">
									<div class="col-6 col-md-2">
										공통 학력
										<div class="ref">
											※필수
										</div>
									</div>
									<div class="form-group col-md-6">
										<form:select path="eduCode" class="box">
											<option value>학력선택</option>
										</form:select>
									</div>
								</div>
							</div>
							<!-- 급여 -->
							<div class="container">
								<div class="row pp">
									<div class="col-6 col-md-2">
										급여
										<div class="ref">
											※필수
										</div>
									</div>
									<div class="form-group col-md-6">
										<form:select path="annoSalary" class="box">
<!-- 											<option value/>급여선택 -->
											<form:option value="면접후결정"/>면접 후 결정
											<form:option value="연봉"/>연봉
											<form:option value="월급"/>월급
											<form:option value="시급"/>월급
										</form:select>
										<div style="display: inline-block;">
											<div id="salaryDetail" style="display: none;">
												<input type="number" name="salaryDetail" class="box" value="0" min="0" step="0.1" style="width: 100px; height: 26px;"> 만원
											</div>
										</div>
									</div>
								</div>
								<div style="font-size: 13px; margin-bottom: 17px">	
									※ 2023년 최저시급 9,620원, 주 40시간 기준 최저연봉 약 24,126,960원 입니다.
									2023년 최저임금에 부합한 급여를 입력해주세요. 위 최저임금은 기본소정 근로시간 기준의 급여이므로, 그 외 수당 발생시 추가 지급되어야 합니다. 
									당사는 본 채용건과 관련하여 '최저임금법'을 준수합니다, 최저임금을 준수하지 않는 경우, 공고 강제 마감 및 행정처분을 받을 수 있습니다.
								</div>
							</div>
							<div class="container">
								<div class="row pp">
									<div class="col-6 col-md-2">
										수습기간
										<div class="ref">
										</div>
									</div>
									<div class="form-group col-md-6">
										<form:input path="annoProbation" type="text" class="box" placeholder=" ex) 1개월" />
									</div>
								</div>
							</div>
							<div class="container">
							<div class="row pp">
								<div class="col-6 col-md-2">복지 사항</div>
									<div class="form-group col-md-6">
										<form:select path="walfareList[0].walfare0" class="box">
											<option value>대분류</option>
										</form:select>
										<form:select path="walfareList[0].walfareCode" class="box">
											<option value>소분류</option>
										</form:select>
									</div>
									<ul id="walDiv" style="background-color: lavender;">
									</ul>
								</div>
							</div>
							<div class="container">
								<div class="row pp">
									<div class="col-6 col-md-2">내용작성</div>
									<div class="form-group col-md-10">
										<form:textarea path="annoContent" name="text"></form:textarea>
									</div>
								</div>
							</div>
						</div>
						
						
						<!-- 					세부 페이지						 -->
						
						
						<h3 class="text-black mb-5 border-bottom pb-2">2. 모집분야(세부)</h3>
						
						<!-- 탭머리 -->
						<div class="row" style="margin-bottom: 50px">
						    <div>
						        <div class="profile-head">
						        <button type="button" id="testBtn" class="btn btn-success" style="color: white; float:right">추가</button>
						            <ul class="nav nav-tabs" id="myTab" role="tablist">
						                <li class="nav-item" style="display: none;">
						                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#detailContainer" role="tab" aria-controls="detailContainer0" aria-selected="true">탭1</a>
						                </li>
<!-- 						                <li class="nav-item"> -->
<!-- 						                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#detailContainer0" role="tab" aria-controls="detailContainer0" aria-selected="true">탭1</a> -->
<!-- 						                </li> -->
<!-- 						                <li class="nav-item"> -->
<!-- 						                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#detailContainer1" role="tab" aria-controls="detailContainer1" aria-selected="false">탭2</a> -->
<!-- 						                </li> -->
						            </ul>
						        </div>
						    </div>
						</div>
						<!-- 탭몸통 -->
						<div class="tab-content profile-tab" id="myTabContent">
							
						
						</div>
						<!-- 탭몸통 끝 -->
						
						<form:button type="submit" class="btn btn-success" style="color: white; float:right">등록</form:button>
						<div class="container">
							<div style="font-size: 13px; margin-top: 80px;">
								※ 성별, 연령 입력 불가 안내<br>
								- 당사는 남녀고용평등 및 연령차별 금지에 관한 법률을 준수하여, 불합리한 성별, 연령 조건은 제시할 수 없습니다. 이를 준수하지 않는 경우, 공고 강제 마감 및 행정처분을 받을 수 있습니다.<br>
								- 성별, 연령 입력 불가로 인해 기존에 등록한 공고는 수정, 연장, 복사시에 '성별무관','연령무관'으로 변경됩니다.
							</div>
						</div>
						
					</form:form>
				</div>
			</div>
		</div>  
	</section>
</div>

<!-- Hidden Tab -->
<!-- 탭몸통1  -->
<div class="tab-pane fade show active d-none" id="detailContainer" role="tabpanel" aria-labelledby="home-tab" >
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">
				모집분야
				<div class="ref">
					※필수
				</div>
			</div>
			<div class="form-group col-md-6">
				<input name="detailList[%n].daFd" type="text" class="box" style="width: 100%" placeholder="모집분야를 입력해주세요" />
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">직무</div>
			<div class="form-group col-md-6">
				<select name="detailList[%n].job0" class="job0 box">
					<option value>상위</option>
				</select>
				<select name="detailList[%n].job1" class="job1 box">
					<option value>중위</option>
				</select>
				<select name="detailList[%n].jobCode" class="jobCode box">
					<option value>하위</option>
				</select>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">모집인원</div>
			<div class="form-group col-md-6">
				<input name="detailList[%n].daCount" type="number" class="box" value="0" min="0" style="width: 100px"/> 명
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">
				경력
				<div class="ref">
					※필수
				</div>
			</div>
			<div class="form-group col-md-8" id="careerDiv">
				<div class="row pp">
					<div class="col-4 col-sm-3">
						경력무관 
						<input type="checkbox" name="detailList[%n].careerNames" value="경력무관" class="career0" />
					</div>
					<div class="col-4 col-sm-3">
						신입 
						<input type="checkbox" name="detailList[%n].careerNames" value="신입" class="career1"/>
					</div>
					<div class="col-4 col-sm-3">
						경력 
						<input type="checkbox" name="detailList[%n].careerNames" value="경력" class="career2"/>
					</div>
				</div>
				<div class="careerYear" style="display: none">
					<select name="detailList[%n].daCarYeer" class="box">
						<option value="1년 이상">1년 이상</option>
						<option value="4년 이상">4년 이상</option>
						<option value="7년 이상">7년 이상</option>
						<option value="10년 이상">10년 이상</option>
						<option value="15년 이상">15년 이상</option>
						<option value="20년 이상">20년 이상</option>
					</select>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">근무부서</div>
			<div class="form-group col-md-6">
				<input name="detailList[%n].daDepartment" type="text" class="box" placeholder=" ex) 영업부" />
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">담당 업무</div>
			<div class="form-group col-md-6 text_box text_boxp1">
				<textarea name="detailList[%n].daTask" rows="4" cols="50"></textarea>
				<div class="count countp1"><span>0</span>/200</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">직급/직책</div>
			<div class="form-group col-md-8" id="positionCheck" >
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">
				고용 형태
				<div class="ref">
					※필수
				</div>
			</div>
			<div class="form-group col-md-6">
				<select name="detailList[%n].empltypeCode" class="box">
					<option value>고용형태</option>
				</select>
			</div>
		</div>
	</div>
	<div class="form-group container">
		<div class="row pp">
			<div class="col-6 col-md-2">
				근무지역
				<div class="ref">
					※필수
				</div>
			</div>
			<div class="form-group col-md-6">
                <input type="hidden" id="sample4_postcode" placeholder="우편번호">
				<input type="text" id="sample4_jibunAddress" class="box" placeholder="지번주소" >
<!-- 											<input type="button" onclick="sample4_execDaumPostcode()" id="execDaumPostcode" value="주소 찾기" class="box"><br> -->
				<input type="button" id="execDaumPostcode" value="주소 찾기" class="box"><br>
				<input type="hidden" id="sample4_roadAddress" placeholder="도로명주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="hidden" id="sample4_detailAddress" placeholder="상세주소">
				<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
				<!-- data.sido+" "+data.sigungu -->
				<input type="hidden" name="detailList[%n].regionVO.regionName"/>
              	</div>
		</div>
	</div>
	<!-- 근무 직급직책*(최대 3개까지 선택 가능), 필수/우대조건 -->
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">지원 조건</div>
			<div class="form-group col-md-6 text_box text_boxp3">
				<textarea name="detailList[%n].daCondition" rows="4" cols="50"></textarea>
				<div class="count countp3"><span>0</span>/200</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row pp">
			<div class="col-6 col-md-2">우대 사항</div>
			<div class="form-group col-md-6 text_box text_boxp4">
				<textarea name="detailList[%n].daPrefer" rows="4" cols="50"></textarea>
				<div class="count countp4"><span>0</span>/200</div>
			</div>
		</div>
	</div>
</div>
<!-- 탭몸통1 끝 -->
</security:authorize>
<!-- SCRIPTS -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>
//test-start



//test-end

let topData = [
	{type:'region', code:''}
	, {type:'industry', code:''}
	, {type:'job', code:''}
	, {type:'edu', code:''}
	, {type:'walfare', code:''}
	, {type:'position', code:''}
	, {type:'empltype', code:''}
]

$(function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/announcement/select",
		method : "post",
		data : JSON.stringify(topData),
		dataType : "json",
		contentType: 'application/json',
		success : function(resp) {
			
			let industryList = resp.industryList;
			let walfareList = resp.walfareList;
			let eduList = resp.eduList;
			let positionList = resp.positionList;
			let jobList = resp.jobList;
			let empltypeList = resp.empltypeList;
			
			let industryOption = [];
			let walfareOption = [];
			let eduOption = [];
			let positionOption = [];
			let jobOption = [];
			let empltypeOption = [];
	
			$.each(industryList, function(index, val){
				let tr = $("<option>").attr("class","code").prop("value",val.industryCode).html(val.industryName);
				industryOption.push(tr);
			})
			$.each(eduList, function(index, val){
				let tr = $("<option>").attr("class","code").prop("value",val.eduCode).html(val.eduName);
				eduOption.push(tr);
			})
			$.each(walfareList, function(index, val){
				let tr = $("<option>").attr("class","code").prop("value",val.walfareCode).html(val.walfareName);
				walfareOption.push(tr);
			})
			$.each(positionList, function(index, val){
				let div = $("<div>").attr("class","chck");
				let tr = $("<input>").attr("type","checkbox").attr("name","detailList[%n].inpositionCode").prop("value",val.positionCode).attr("style","margin-right: 3px");
				div.append(tr);
				div.html(div.html() + val.positionName);
				positionOption.push(div);
			})
			$.each(jobList, function(index, val){
				let tr = $("<option>").attr("class","code").prop("value",val.jobCode).html(val.jobName);
				jobOption.push(tr);
			})
			$.each(empltypeList, function(index, val){
				let tr = $("<option>").attr("class","code").prop("value",val.empltypeCode).html(val.empltypeName);
				empltypeOption.push(tr);
			})
			
			$("select[name=industry0]").append(industryOption);
			$("select[name=eduCode]").append(eduOption);
			$("select[name='walfareList[0].walfare0']").append(walfareOption);
			$("#positionCheck").append(positionOption);
			$(".job0").append(jobOption);
			$("select[name='detailList[%n].empltypeCode']").append(empltypeOption);
			
	// 		$("select[name=industry0]").val("${anno.industry0}").trigger("change");
	// 		$("select[name=eduCode]").val("${anno.eduCode}").trigger("change");
	// 		$("select[name='detailList[0].job0']").val("${anno.detailList[0].job0}").trigger("change");
	// 		$("select[name='detailList[0].empltypeCode']").val("${anno.detailList[0].empltypeCode}");
	// 		$("select[name='detailList[0].positionCode']").val("${anno.detailList[0].positionCode}");
	// 		$("select[name='walfareList[0].walfare0']").val("${anno.walfareList[0].walfare0}").trigger("change");
	
		 	$("#testBtn").trigger("click");
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
})


/* 탭 생성 */
let detailContainer = $("#detailContainer");
let myTabContent = $("#myTabContent");
let x = 0;
$("#testBtn").on("click",function(){
	console.log("클릭햇다이거, x = ",x);
	let nextContainer = detailContainer.clone();
	nextContainer.attr("id","detailContainer"+x); 
	nextContainer.removeClass("d-none");
	myTabContent.append(nextContainer);
	
	let nWord = $("#detailContainer"+x).find("[name*='%n']");
	for(i=0;i<nWord.length;i++){
        let nName = nWord.eq(i).attr('name');
        let newName = nName.replace("%n",x);
        nWord.eq(i).attr("name",newName);
    }

	$("#myTab").append(
		$("<li>").attr("class","nav-item").append(
			$("<a>").attr("class","nav-link").attr("id","tab"+x).attr("role","tab").attr("data-toggle","tab")
			.attr("href","#detailContainer"+x).attr("aria-selected",true).html("분야"+(x+1))
		)
	);

	$("#detailContainer"+x).find("#sample4_postcode").attr("id","sample4_postcode"+x);
	$("#detailContainer"+x).find("#sample4_jibunAddress").attr("id","sample4_jibunAddress"+x);
	$("#detailContainer"+x).find("#execDaumPostcode").attr("onclick","sample4_execDaumPostcode("+x+")");
	$("#detailContainer"+x).find("#sample4_roadAddress").attr("id","sample4_roadAddress"+x);
	$("#detailContainer"+x).find("#guide").attr("id","guide"+x);
	$("#detailContainer"+x).find("#sample4_postcode").attr("id","sample4_postcode"+x);
	$("#detailContainer"+x).find("#sample4_detailAddress").attr("id","sample4_detailAddress"+x);
	$("#detailContainer"+x).find("#sample4_extraAddress").attr("id","sample4_extraAddress"+x);
	
	$("#tab"+x).trigger("click");
	x=x+1;
	
	job0();
	job1();
	career();
	
	$(".jobCode").on("change",function(){
		console.log("jobCOde",$(".jobCode").val());
	});
});

/* 복지 태그 */
let walval = $("[name='walfareList[0].walfareCode']").on("change",function(){
	let walSelect = $("[name='walfareList[0].walfareCode'] option:selected");
	console.log(walval.val());
	console.log(walSelect.html());
	$("#walDiv").append(
		$("<li>").attr("type","button").attr("class","walBtn").css({"display":"inline-block","margin-right":"15px"}).html(walSelect.html()).append(
			$("<i>").attr("class","bi bi-x-lg")
			,$("<input>").attr("type","hidden").attr("name","walfareCodeList").val(walval.val())
		)
	)
});

/* 경력 체크박스 */
//아이디 다르게 만들던가 클래스 주기
function career(){
	let career0 = $(".career0");
	let career1 = $(".career1");
	let career2 = $(".career2");
	let careerYear = $(".careerYear");

	career0.on("change", function (e) {
	    e.preventDefault();
		console.log($(this));
	    $(this).parents("#careerDiv").find(".career1").prop("checked", false);
	    $(this).parents("#careerDiv").find(".career2").prop("checked", false);
	   	$(this).parents("#careerDiv").find(".careerYear").attr("style","display:none");
	});
	career1.on("change", function (e) {
	    e.preventDefault();
	    console.log($(this));
	    if($(this).parents("#careerDiv").find(".career0").is(":checked")){
	    	$(this).parents("#careerDiv").find(".career0").prop("checked", false);
	    }
	});
	career2.on("change", function (e) {
	    e.preventDefault();
	    console.log($(this));
	    if($(this).parents("#careerDiv").find(".career0").is(":checked")){
	    	$(this).parents("#careerDiv").find(".career0").prop("checked", false);
	    }
	    if($(this).parents("#careerDiv").find(".career2").is(":checked")){
	    	$(this).parents("#careerDiv").find(".careerYear").attr("style","display:block");
	    }else{
	    	$(this).parents("#careerDiv").find(".careerYear").attr("style","display:none");
	    }
	});
}

	let salary = $("#annoSalary");
	let salaryDetail = $("#salaryDetail");
	salary.on("change", function (e) {
//	 	연봉,월급,시급
	    if(salary.val()=="연봉"||salary.val()=="월급"||salary.val()=="시급"){
	    	salaryDetail.attr("style","display:block");
	    }else{
	    	salaryDetail.attr("style","display:none");
	    }
	});

/* 도로명주소 */
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode(x) {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // DB로 가져갈 값
            let regionName = document.querySelector("[name='detailList["+x+"].regionVO.regionName']");
            regionName.value=data.sido+" "+data.sigungu;
			console.log(regionName.value);

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode'+x).value = data.zonecode;
            document.getElementById("sample4_roadAddress"+x).value = roadAddr;
            document.getElementById("sample4_jibunAddress"+x).value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress"+x).value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress"+x).value = '';
            }

            var guideTextBox = document.getElementById("guide"+x);
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
    
/* CKEDITOR */
CKEDITOR.replace('annoContent',{
	filebrowserUploadUrl: '${pageContext.request.contextPath}/help/notice/noticeAttach?command=QuickUpload&type=Files&responseType=json'

});

/* 글자수세기 */
$('.text_boxp1 textarea').keyup(function(){
	var content = $(this).val();
	$('.text_boxp1 .countp1 span').html(content.length);
	if (content.length > 200){
		alert("최대 200자까지 입력 가능합니다.");
		$(this).val(content.substring(0, 200));
		$('.text_boxp1 .countp1 span').html(200);
	}
});
$('.text_boxp2 textarea').keyup(function(){
	var content = $(this).val();
	$('.text_boxp2 .countp2 span').html(content.length);
	if (content.length > 200){
		alert("최대 200자까지 입력 가능합니다.");
		$(this).val(content.substring(0, 200));
		$('.text_boxp2 .countp2 span').html(200);
	}
});
$('.text_boxp3 textarea').keyup(function(){
	var content = $(this).val();
	$('.text_boxp3 .countp3 span').html(content.length);
	if (content.length > 200){
		alert("최대 200자까지 입력 가능합니다.");
		$(this).val(content.substring(0, 200));
		$('.text_boxp3 .countp3 span').html(200);
	}
});
$('.text_boxp4 textarea').keyup(function(){
	var content = $(this).val();
	$('.text_boxp4 .countp4 span').html(content.length);
	if (content.length > 200){
		alert("최대 200자까지 입력 가능합니다.");
		$(this).val(content.substring(0, 200));
		$('.text_boxp4 .countp4 span').html(200);
	}
});

/* daterangepicker */
$(function() {
	$('input[name="datetimes"]').daterangepicker({
		opens: 'left',
		timePicker: true,
		startDate: moment().startOf('hour'),
		endDate: moment().startOf('hour').add(32, 'hour'),
		locale: {
			format: 'M/DD hh:mm A'
		}
	}, function(start, end, label) {
		//DB로 가져갈 값
		let annoStartdate = document.querySelector("[name=annoStartdate]");
		let annoEnddate = document.querySelector("[name=annoEnddate]");
		annoStartdate.value=start.format('YYYY-MM-DD HH:mm:ss');
		annoEnddate.value=end.format('YYYY-MM-DD HH:mm:ss');
		console.log('시작날짜',annoStartdate.value);
		console.log('종료날짜',annoEnddate.value);
	});
});
let today = new Date();
$('input[name=daterange]').val(today);

/* 하위 업종 셀렉트 */
$("[name=industry0]").on("change", function(){
	let ref = $(this).val();
	let data = [{type:'industry',code:ref}];
	
	$.ajax({
		url : "${pageContext.request.contextPath}/announcement/select",
		method : "post",
		data : JSON.stringify(data),
		dataType : "json",
		contentType: 'application/json',
		success : function(resp) {
			
			let industryList = resp.industryList;
			let industryOption = [];
			$.each(industryList, function(index, val){
				let tr = null;
				tr = $("<option>").attr("class","code").prop("value",val.industryCode).html(val.industryName);
				industryOption.push(tr);
			})
			$("select[name=industry1] option").remove();
			$("select[name=industry1]").append(industryOption);
			$("select[name=industryCode] option").remove();
			$("select[name=industryCode]").append($("<option>").html("소분류"));
// 			$("select[name=industry1]").val("${anno.industry1}").trigger("change");
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});   
});
$("[name=industry1]").on("change", function(){
	let ref = $(this).val();
	let data = [{type:'industry',code:ref}];
	
	$.ajax({
		url : "${pageContext.request.contextPath}/announcement/select",
		method : "post",
		data : JSON.stringify(data),
		dataType : "json",
		contentType: 'application/json',
		success : function(resp) {
			let industryList = resp.industryList;
			let industryOption = [];
			$.each(industryList, function(index, val){
				let tr = null;
				tr = $("<option>").attr("class","code").prop("value",val.industryCode).html(val.industryName);
				industryOption.push(tr);
			})
			$("select[name=industryCode] option").remove();
			$("select[name=industryCode]").append(industryOption);
// 			$("select[name=industryCode]").append(industryOption).val("${anno.industryCode}");
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});   
});

/* 복지 하위 셀렉트 */
$("[name='walfareList[0].walfare0']").on("change", function(){
	let ref = $(this).val();
	let data = [{type:'walfare',code:ref}];
	
	$.ajax({
		url : "${pageContext.request.contextPath}/announcement/select",
		method : "post",
		data : JSON.stringify(data),
		dataType : "json",
		contentType: 'application/json',
		success : function(resp) {
			let walfareList = resp.walfareList;
			let walfareOption = [];
			$("select[name='walfareList[0].walfareCode'] option").remove();
			$.each(walfareList, function(index, val){
				let tr = null;
				tr = $("<option>").attr("class","code").prop("value",val.walfareCode).html(val.walfareName);
				walfareOption.push(tr);
			})
			$("select[name='walfareList[0].walfareCode']").append(walfareOption);
// 			$("select[name='walfareList[0].walfareCode']").append(walfareOption).val("${anno.walfareList[0].walfareCode}");
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});   
});

/* 직종 하위 셀렉트 */
function job0(){
	$(".job0").on("change", function(){
		let job0 = $(this);
		let job1 = $(this).siblings(".job1");
		let ref = $(this).val();
		let data = [{type:'job',code:ref}];
		
		$.ajax({
			url : "${pageContext.request.contextPath}/announcement/select",
			method : "post",
			data : JSON.stringify(data),
			dataType : "json",
			contentType: 'application/json',
			success : function(resp) {
				let jobList = resp.jobList;
				let jobOption = [];
				
				$.each(jobList, function(index, val){
					let tr = null;
					tr = $("<option>").attr("class","code").prop("value",val.jobCode).html(val.jobName);
					jobOption.push(tr);
				})
				
				job0.siblings(".job1").find("option").remove();
				job0.siblings(".job1").append(jobOption);
				job1.siblings(".jobCode").find("option").remove();
				job1.siblings(".jobCode").append($("<option>").html("소분류"));
	// 			$("select[name='detailList[0].job1']").append(jobOption).val("${anno.detailList[0].job1}").trigger("change");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});   
	});

}
function job1(){
	$(".job1").on("change", function(){
		let job1 = $(this);
		let ref = $(this).val();
		let data = [{type:'job',code:ref}];
		
		$.ajax({
			url : "${pageContext.request.contextPath}/announcement/select",
			method : "post",
			data : JSON.stringify(data),
			dataType : "json",
			contentType: 'application/json',
			success : function(resp) {
				let jobList = resp.jobList;
				let jobOption = [];
				
				$.each(jobList, function(index, val){
					let tr = null;
					tr = $("<option>").attr("class","code").prop("value",val.jobCode).html(val.jobName);
					jobOption.push(tr);
				})
				job1.siblings(".jobCode").find("option").remove();
				job1.siblings(".jobCode").append(jobOption);
				
//	 			$("select[name='detailList[0].jobCode']").append(jobOption).val("${anno.detailList[0].jobCode}");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});   
	});
}

</script>
<script src="${prePath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="${prePath}/resources/js/isotope.pkgd.min.js"></script>
<script src="${prePath}/resources/js/stickyfill.min.js"></script>
<script src="${prePath}/resources/js/jquery.fancybox.min.js"></script>
<script src="${prePath}/resources/js/jquery.easing.1.3.js"></script>

<script src="${prePath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${prePath}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${prePath}/resources/js/owl.carousel.min.js"></script>
<script src="${prePath}/resources/js/quill.min.js"></script>


<script src="${prePath}/resources/js/bootstrap-select.min.js"></script>

<script src="${prePath}/resources/js/custom.js"></script>
