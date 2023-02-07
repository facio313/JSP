<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* ${date}      양서연      최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/quill.snow.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
#temp{
	display: inline-block;
	width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    -webkit-transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    -o-transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;	
}
.t_center{
	text-align : center;
}
.t_button{
	background-color:transparent;
	border: 0px solid white;
	font-size: 13px;
	color: navy;
	
}
.close {display:inline-block;*display:inline;  text-shadow: 0px}
.close:after {display: inline-block;content: "\00d7"; font-size:15pt;}

</style>

<!-- NAVBAR -->
<header class="site-navbar mt-3">
  <div class="container-fluid">
<!--     <div class="row align-items-center"> -->
<!--       <div class="site-logo col-6"><a href="index.html">필터쓰</a></div> -->
<!-- 			<h1 class="text-white font-weight-bold">필터쓰</h1> -->
<!--     </div> -->
  </div>
</header>

<!-- HOME -->
<section class="section-hero home-section overlay inner-page bg-image" style="background-image: url('resources/images/hero_1.jpg')" id="home-section">

	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-md-12">
				<div class="mb-5 text-center">
					<h1 class="text-white font-weight-bold">JOB FILTER</h1>
					<p>조건 걸어서 검색해보자</p>
					<div>
						지역 : 
						<select name="metro">
							<!-- regionRef=null -->
							<option value>광역</option>
							<c:forEach items="${regionList }" var="region">
								<option value="${region.regionCode }" class="${region.regionRef}p">${region.regionName }</option>
							</c:forEach>
						</select>
						<select name="basic">
							<!-- regionRef=광역regionCode -->
							<option value>기초</option>
							<c:forEach items="${regionList }" var="region">
								<option value="${region.regionCode }" class="${region.regionRef}">${region.regionName }</option>
							</c:forEach>
						</select>
					</div>
					<div>
						업종 : 
						<select name="industry0">
							<option value>상위</option>
							<c:forEach items="${industryList }" var="industry">
								<option value="${industry.industryCode }" class="${industry.industryRef}p">${industry.industryName }</option>
							</c:forEach>
						</select>
						<select name="industry1">
							<option value>중위</option>
							<c:forEach items="${industryList }" var="industry">
								<option value="${industry.industryCode }" class="${industry.industryRef}">${industry.industryName }</option>
							</c:forEach>
						</select>
						<select name="industry2">
							<option value>전체선택</option>
							<c:forEach items="${industryList }" var="industry">
								<option value="${industry.industryCode }" class="${industry.industryRef}">${industry.industryName }</option>
							</c:forEach>
						</select>
					</div>
					<div>
						업종 : 
						<select name="job0">
							<option value>상위</option>
							<c:forEach items="${jobList }" var="job">
								<option value="${job.jobCode }" class="${job.jobRef}p">${job.jobName }</option>
							</c:forEach>
						</select>
						<select name="job1">
							<option value>중위</option>
							<c:forEach items="${jobList }" var="job">
								<option value="${job.jobCode }" class="${job.jobRef}">${job.jobName }</option>
							</c:forEach>
						</select>
						<select name="job2">
							<option value>전체선택</option>
							<c:forEach items="${jobList }" var="job">
								<option value="${job.jobCode }" class="${job.jobRef}">${job.jobName }</option>
							</c:forEach>
						</select>
					</div>
					<div>
						경력 : 
						<select name="career">
							<option value="경력무관">경력무관</option>
							<option value="신입">신입</option>
							<option value="경력">경력</option>
						</select>
						<ul>
	                		<li class="jobtype item" data-value="9" data-group="jobtype9" data-type="" >
				                <button type="button" class="t_button">
				                	병역특례 <i class="bi bi-x-lg" style="color:black"></i>
				                 </button>
				            </li>
						</ul>
					</div>
				</div>
				<form method="post" class="search-jobs-form">
					<div style="border: 1px solid black">
						<button name="regionBtn" class="btn btn-outline-dark" type="button" style="width: 200px; margin-right: 20px">지역</button>
						<button name="industryBtn" class="btn btn-outline-dark" type="button" style="width: 200px; margin-right: 20px">업종</button>
						<button name="jobBtn" class="btn btn-outline-dark" type="button" style="width: 200px; margin-right: 20px">직종</button>
						<button name="careerBtn" class="btn btn-outline-dark" type="button" style="width: 200px; margin-right: 20px">경력</button><!-- 연차 어떻게 할겨.. -->
						<!-- 정렬기준 : 기업투명도, 마감남은순, 최신등록순,   -->
					</div>
					<div class="next-filter" style="margin-top: 5px; background-color: navy;">
						<div class="container">
					        <div class="row row-cols-4">
					          <div class="col t_center" >Column</div>
					          <div class="col t_center">Column</div>
					          <div class="col t_center">Column</div>
					          <div class="col t_center">Column</div>
					          <div class="col t_center">Column</div>
					          <div class="col t_center">Column</div>
					        </div>
					        <div class="row row-cols-4">
					          <div class="col t_center">Column</div>
					          <div class="col t_center">Column</div>
					          <div class="col t_center">Column</div>
					          <div class="col t_center">Column</div>
					          <div class="col t_center">Column</div>
					          <div class="col t_center">Column</div>
					        </div>
						</div>
					</div>
					
					<div class="row" style="margin-top: 20px; margin-bottom: 20px">
						<div class="col-md-12 popular-keywords">
							<h3>Trending Keywords:</h3>
							<ul class="keywords list-unstyled m-0 p-0">
								<li><a href="#" class="">UI Designer</a></li>
								<li><a href="#" class="">Python</a></li>
								<li><a href="#" class="">Developer</a></li>
							</ul>
						</div>
					</div>
					<div>
						<input id="temp" type="text" class="form-control" placeholder="검색어 입력" style="width: 200px; margin-right: 30px">
						<button type="submit" class="btn btn-primary" >Search Job</button>
					</div>
					<div id="tagBody"></div>
				</form>
			</div>
		</div>
	</div>
	<a href="#next" class="scroll-button smoothscroll">
	   <span class=" icon-keyboard_arrow_down"></span>
	</a>
</section>

<!-- 페이징 -->
<section class="site-section" id="next" style="background-color: white">
	<ul class="job-listings mb-5" id="listBody">
<%-- 		<c:set var="annoList" value="${pagingVO.dataList}" /> --%>
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${not empty annoList}"> --%>
<%-- 				<c:forEach items="${annoList}" var="anno"> --%>
<!-- 					<li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center"  style="margin: 10px;" > -->
<%-- 						<a href="${pageContext.request.contextPath}/announcement/view/${anno.annoNo}"></a> --%>
<!-- 			            <div class="job-listing-logo"> -->
<!-- 							<img src="resources/images/job_logo_1.jpg" alt="Image" class="img-fluid"> -->
<!-- 			            </div> -->
<!-- 			            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4"> -->
<!-- 							<div class="job-listing-position custom-width w-50 mb-3 mb-sm-0"> -->
<%-- 								<h2>${anno.annoTitle }</h2> --%>
<%-- 				                <strong>기업: ${anno.cmpId }</strong> --%>
<%-- 				                <div>업종: ${anno.industryCode }</div> --%>
<!-- 							</div> -->
<!-- 							<div class="job-listing-location mb-3 mb-sm-0 custom-width w-25"> -->
<!-- 								<span class="icon-room"></span> 지역<br> -->
<%-- 				                <span class="icon-room"></span> 연봉: ${anno.annoSalary }<br> --%>
<!-- 				                <span class="icon-room"></span> 경력/별점<br> -->
<!-- 							</div> -->
<!-- 							<div class="job-listing-meta"> -->
<!-- 								<span class="badge badge-danger">D-7</span> -->
<!-- 								<span class="badge badge-success">D-7</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</li> -->
<%-- 				</c:forEach> --%>
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<!-- 				<tr> -->
<!-- 					<td colspan="6">게시글 없음.</td> -->
<!-- 				</tr> -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
	</ul>
	
	<div class="row pagination-wrap">
		<div class="col-md-6 text-center text-md-left mb-4 mb-md-0">
           	<span>Showing 1-7 Of 43,167 Jobs</span>
       	</div>
       	<div class="col-md-6 text-center text-md-right">
			<div class="pagingArea d-inline-block"></div>
		</div>
	</div>
</section>

<!-- 검색은 위에서 할거임 -->
<!-- 		<div id="searchUI"> -->
<!-- 			<input type="text" name="annoName" placeholder="공고명"/> -->
<!-- 			<input class="btn btn-success" type="button" value="검색" id="searchBtn"  /> -->
<!-- 		</div> -->

<section class="py-5 bg-image overlay-primary fixed overlay" style="background-image: url('resouces/images/hero_1.jpg');">
	<div class="container">
		<div class="row align-items-center">
		<div class="col-md-8">
			<h2 class="text-white">Looking For A Job?</h2>
			<p class="mb-0 text-white lead">Lorem ipsum dolor sit amet consectetur adipisicing elit tempora adipisci impedit.</p>
		</div>
		<div class="col-md-3 ml-auto">
			<a href="#" class="btn btn-warning btn-block btn-lg">Sign Up</a>
		</div>
		</div>
	</div>
</section>


<!-- hidden form -->
<form id="searchForm">
	<input type="hidden" name="page" />	
	<input type="hidden" name="annoName" placeholder="공고명"/>
</form>

<!-- SCRIPTS -->

<script>

/* 지역 */
$("[name=metro]").find("option:gt(0)").hide();
$("[name=metro]").find("option.p").show();

$("[name=metro]").on("change", function(){
	let metro = $(this).val();
	regionTag.find("option:gt(0)").hide();
	regionTag.find("option." + metro).show();
});
let regionTag = $("[name=basic]");

/* 업종 */
$("[name=industry0]").find("option:gt(0)").hide();
$("[name=industry0]").find("option.p").show();

$("[name=industry0]").on("change", function(){
	let industry0 = $(this).val();
	industry1Tag.find("option:gt(0)").hide();
	industry1Tag.find("option." + industry0).show();
});
let industry1Tag = $("[name=industry1]");

$("[name=industry1]").on("change", function(){
	let industry1 = $(this).val();
	industry2Tag.find("option:gt(0)").hide();
	industry2Tag.find("option." + industry1).show();
});
let industry2Tag = $("[name=industry2]");

/* 직종 */
$("[name=job0]").find("option:gt(0)").hide();
$("[name=job0]").find("option.p").show();

$("[name=job0]").on("change", function(){
	let job0 = $(this).val();
	job1Tag.find("option:gt(0)").hide();
	job1Tag.find("option." + job0).show();
});
let job1Tag = $("[name=job1]");

$("[name=job1]").on("change", function(){
	let job1 = $(this).val();
	job2Tag.find("option:gt(0)").hide();
	job2Tag.find("option." + job1).show();
});
let job2Tag = $("[name=job2]");

/* 페이징 */
let listBody = $("#listBody");

	
let pagingArea = $(".pagingArea").on("click", "a.paging", function(event){
	event.preventDefault();
	let page = $(this).data("page");
	if(!page) return false;
	searchForm.find("[name=page]").val(page);
	searchForm.submit();
	return false;
});

let makeTrTag = function(anno){
	return $("<li class='job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center'  style='margin: 10px;' >").append(
				$("<a>").attr("href", "${pageContext.request.contextPath}/announcement/view/"+anno.annoNo)
					, $("<div>").attr("class","job-listing-logo")
					, $("<div>").attr("class","job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4").append(
						$("<div>").attr("class","job-listing-position custom-width w-50 mb-3 mb-sm-0").append(
							$("<h2>").html(anno.annoTitle)
							, $("<strong>").html("기업 : " + anno.cmpId)
							, $("<div>").html("업종: " + anno.industryCode)
					)
					, $("<div>").attr("class","job-listing-location mb-3 mb-sm-0 custom-width w-25").append(
						$("<span>").attr("class","icon-room").html("지역: 아직안함 <br>")
						, $("<span>").attr("class","icon-room").html("연봉: " + anno.annoSalary + "<br>")
						, $("<span>").attr("class","icon-room").html("경력/별점 <br>")
					)
					, $("<div>").attr("class","job-listing-meta").append(
// 						$("<span>").attr("class","badge badge-danger").html("D-7")	
						$("<span>").attr("class","badge badge-success").html("D-7")	
					)
				)
			);
}

let searchForm = $("#searchForm").on("submit", function(event){
	event.preventDefault();
	
	let url = this.action;
	let method = this.method;
	let queryString = $(this).serialize();
	$.ajax({
		url : url,
		method : method,
		data : queryString,
		dataType : "json",
		success : function(resp) {
			listBody.empty();
			pagingArea.empty();
			searchForm[0].page.value="";
			
			let pagingVO = resp.pagingVO;
			
			let dataList = pagingVO.dataList;
			let trTags = [];
			if(dataList){
				$.each(dataList, function(index, anno){
					trTags.push(makeTrTag(anno));
				});
			}else{
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "7")
							.html("조건에 맞는 공고 없음.")
				);	
				trTags.push(tr);
			}
			listBody.html(trTags);
			if(resp.pagingHTML)
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

let searchUI = $("#searchUI").on("click", "#searchBtn", function(){
	let inputs = searchUI.find(":input[name]");
	$.each(inputs, function(index, input){
		let name = this.name;
		let value = $(this).val();
		searchForm[0][name].value = value;
	});
	searchForm.submit();
});

/* 보내자... */
let tagBody = $("#tagBody");
let searchTag = function(event){
	return $("<div>").html("예");
}

let refCode = 'aa';
let regionBtn = $("[name=regionBtn]").on("click", function(event){
	$.ajax({
		url : '${pageContext.request.contextPath}/announcement/region',
		method : 'post',
		data : refCode,
		dataType : 'json',
		success : function(resp) {
			console.log('버튼클릭');
// 			tagBody.empty();
// 			let trTags = [];
// 			$.each(resp, function(index, val){
// 				trTags.push(searchTag(val));
// 			}
// 			tagBody.html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});


</script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stickyfill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/quill.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
