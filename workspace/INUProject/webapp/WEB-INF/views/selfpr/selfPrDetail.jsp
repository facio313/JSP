<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* ${date}      윤호연      최초작성
* 2023.02.17   윤호연      1차수정
* 2023.03.08   윤호연      2차수정
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%
	int intprNo = (int)request.getAttribute("prNo");
	String prNo = Integer.toString(intprNo);
// 	out.print("넘어온 prNo값 : " + prNo);
%>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/custom-bs.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/animate.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
    
    <style type="text/css">
      .img-jobseeker{
      	height: 220px;
      	width: 200px; 
      	border-radius: 10px;
      }
      .block_jobseeker {
		position: relative;
		background: #e7f4fb;
		padding: 55px;
		margin-bottom: 3rem;
		border-radius: 15px;
	  }
	  .table_header{
	  	background-color: #eff7ed
	  }
	  .top-interval{
        height: 25px;
      }
      .top-medium-interval{
      	height: 50px;
      }
      .top-large-interval{
      	height: 100px;
      }
      
/* 모달창 CSS 적용 */
	#contactModal{
		display : none;
		z-index : 1;
		background-color: rgba(0,0,0,.3);
		position:fixed;
		left:0;
		top: 0;
		width:100%;
		height:100%;
	}
	#contactModal>#content{
		width:300px;
		margin:100px auto;
		padding:20px;
		position: relative;
		background-color:#fff;
	}
	
    </style>
</head>
<body>

  <section class="site-section">

      <div class="container">
       <div class="block_jobseeker mb-6">
       
       		<!-- 관심인재 기능 -->
	          <div class="col-3" style="float: right;">
                 <a href="#" onclick="likeseeker(${selfprmem.prNo}); return false;" class="btn btn-block btn-light btn-md" style="border: 1px solid black;">
               	 <span id="likeheart" class="icon-heart<c:if test="${matchselfpr.likeresult eq 0 }">-o</c:if> mr-2 text-danger"></span>관심인재 등록</a>
              </div>
              
	          <div class="block__91147 d-flex align-items-center">
	         	 <figure class="mr-5"><img src="${pageContext.request.contextPath}/resources/images/profile.jpg" class="img-jobseeker"></figure>
		          <div>
		             <h3><strong>&quot;${selfprmem.prName }&quot;</strong></h3>
		             <hr>
		             <span>${selfprmem.memName }</span>
		             <br>
		             <span class="position">${selfprmem.prWantjob }</span>
		             <br>
		             <span>${selfprmem.memAddr1}</span>
		             <br>
		             <span>${selfprmem.memTel }</span>
		             <br>
		             <span>${selfprmem.memEmail }</span>
		             <hr>
		          </div>
	          </div>
	          	<p style="float: right;">작성일 : ${selfprmem.prDate }</p>
          <div class="top-interval"></div>
        </div> 
        
      </div>

	<div class="container">
      <div class="mb-4">
      	<div>
        <h3 class="mb-4, icon-portrait" style="font-size: 1.3em; color: #85c974;"><strong>&nbsp;자기소개</strong>
        <security:authorize url="/selfpr/Update">
        	<a href="${pageContext.request.contextPath}/selfpr/Update?no=${selfprmem.prNo}" class="icon-add_box" style="float: right; font-size: 70%;">&nbsp;내용 수정하기</a>
        </security:authorize>
        </h3>
      	</div>
        <hr>
        <p class="mb-0">${selfprmem.prContent }</p>
      </div>
    </div>
    
    <div class="top-interval"></div>
    
    <div class="container">
      <div class="row mb-4">
        <div class="col-sm-12 col-md-12 mb-4 col-lg-12">
          <h3 class="icon-school d-block" style="font-size: 1.3em; color: #85c974;"><strong>&nbsp;학력사항</strong></h3>
          <hr>
	          <table class="table">
	          	<thead class="table_header">
	          	  <tr>
	          		<th>학교명</th>
	          		<th>전공분류</th>
	          		<th>전공</th>
	          		<th>상태</th>
	          		<th>학점</th>
	          		<th>입학일</th>
	          		<th>졸업일</th>
	          	  </tr>
	          	</thead>
	          	<tbody>
	          	<c:forEach items="${selfpredu }" var="edu">
		          <tr>
		          	<td>${edu.eduName }</td>
		          	<td>${edu.eduDepart }</td>
		          	<td>${edu.eduMajor }</td>
		          	<td>${edu.eduStatus }</td>
		          	<td>${edu.eduScore }</td>
		          	<td>${edu.eduEntered }</td>
		          	<td>${edu.eduGraduated }</td>
		          </tr>
	         	</c:forEach>
	          	</tbody>
	          </table>
        </div>
        <div class="col-sm-12 col-md-12 mb-4 col-lg-12">
          <h3 class="icon-address-card d-block" style="font-size: 1.3em; color: #85c974;"><strong>&nbsp;경력사항</strong></h3>
          <hr>
          	<table class="table">
          		<thead class="table_header">
          			<tr>
          				<td>업종</td>
          				<td>직장명</td>
          				<td>직무</td>
          				<td>직급</td>
          				<td>입사일</td>
          				<td>퇴사일</td>
          				<td>연차</td>
          			</tr>
          		</thead>
          		<tbody>
          		<c:forEach items="${selfprcareer }" var="career">
          			<tr>
          				<td>${career.careerCategory }</td>
          				<td>${career.careerCompany }</td>
          				<td>${career.careerTask }</td>
          				<td>${career.careerClass }</td>
          				<td>${career.careerJoin }</td>
          				<td>${career.careerResign }</td>
          				<td>${career.careerAnnual }</td>
          			</tr>
          		</c:forEach>
          		</tbody>
          	</table>
        </div>
        <div class="col-sm-12 col-md-12 mb-4 col-lg-12">
       	  <h3 class="icon-playlist_add_check" style="font-size: 1.3em; color: #85c974;"><strong>&nbsp;자격증</strong></h3>
          <hr>
          <table class="table">
          	<thead class="table_header">
          		<tr>
          			<td>자격번호</td>
          			<td>자격증명</td>
          			<td>발급일</td>
          			<td>시행부처</td>
          		</tr>
          	</thead>
          	<tbody>
          	<c:forEach items="${selfprcert }" var="cert">
          		<tr>
          			<td>${cert.certNo }</td>
          			<td>${cert.certName }</td>
          			<td>${cert.certDate }</td>
          			<td>${cert.certInstitution }</td>
          		</tr>
          	</c:forEach>
          	</tbody>
          </table>
        </div>
        <div class="col-sm-12 col-md-12 mb-4 col-lg-12">
          <h3 class="icon-line-briefcase" style="font-size: 1.3em; color: #85c974;"><strong>&nbsp;주요활동</strong></h3>
          <hr>
          <table class="table">
          	<thead class="table_header">
          		<tr>
          			<td>주요활동명</td>
          			<td>주요활동종류</td>
          			<td>주요활동기관</td>
          			<td>주요활동기간</td>
          		</tr>
          	</thead>
          	<tbody>
          	<c:forEach items="${selfpract }" var="act">
          		<tr>
          			<td>${act.actName }</td>
          			<td>${act.actCategory }</td>
          			<td>${act.actInstitution }</td>
          			<td>${act.actPeriod }</td>
          		</tr>
          	</c:forEach>	
          	</tbody>
          </table>
        </div>
        <div class="col-sm-12 col-md-12 mb-4 col-lg-12">
          <h3 class="icon-trophy d-block" style="font-size: 1.3em; color: #85c974;"><strong>&nbsp;수상경력</strong></h3>
          <hr>
          <table class="table">
			<thead class="table_header">
				<tr>
					<td>수상대회명</td>
					<td>수상명</td>
					<td>수상대회종류</td>
					<td>수상날짜</td>
					<td>수상기관</td>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${selfpraward }" var="award">
				<tr>
					<td>${award.awardCompetition }</td>
					<td>${award.awardName }</td>
					<td>${award.awardCategory }</td>
					<td>${award.awardDate }</td>
					<td>${award.awardInstitution }</td>
				</tr>
			</c:forEach>
			</tbody>
          </table>
        </div>
        <div class="col-sm-12 col-md-12 mb-4 col-lg-12">
        <h3 class="icon-book d-block" style="font-size: 1.3em; color: #85c974;"><strong>&nbsp;교육이수</strong></h3>
          <hr>
          <table class="table">
          	<thead class="table_header">
          		<tr>
          			<td>교육명</td>
          			<td>교육종류</td>
          			<td>교육기관</td>
          			<td>교육기간</td>
          		</tr>
          	</thead>
          	<tbody>
          	<c:forEach items="${selfprcourse }" var="course">
          		<tr>
          			<td>${course.courseName }</td>
          			<td>${course.courseCategory }</td>
          			<td>${course.courseInstitution }</td>
          			<td>${course.coursePeriod }</td>
          		</tr>
          	</c:forEach>
          	</tbody>
          </table>
        </div>
        
        <div class="top-interval"></div>
        	<h3 class="icon-check d-block" style="font-size: 1.3em; color: #85c974;"><strong>&nbsp;희망근무조건</strong>
        	<security:authorize url="/selfpr/Update">
        		<a href="${pageContext.request.contextPath}/selfpr/Update?no=${selfprmem.prNo}" class="icon-add_box" style="float: right; font-size: 70%;" >&nbsp;내용 수정하기</a>
        	</security:authorize>
        	</h3>
        	<hr>
        	<table class="table">
        		<thead style="background-color: #eefaff">
	        		<tr>
						<td><strong>산업분야</strong></td>
						<td><strong>희망직급</strong></td>
						<td><strong>희망직무</strong></td>
						<td><strong>해당직무경력</strong></td>
						<td><strong>희망근무지</strong></td>
						<td><strong>희망연봉</strong></td>
	        		</tr>
				</thead>
				<tbody>
					<tr>
						<td>${selfprmem.industryName }</td>
						<td>${selfprmem.prWanttype }</td>
						<td>${selfprmem.prWantjob }</td>
						<td>${selfprmem.prAnnual }</td>
						<td>${selfprmem.regionName }</td>
						<td>${selfprmem.prWantmn }</td>
					</tr>
				</tbody>
        	</table>
        	
    <div class="top-medium-interval"></div>
    
    <hr style="border-top: 1px solid">
    
   	<div class="col-1" style="left: 980px;">
    	<input style="background-color: #0D6EFD;" type="button" value="내 이력서로 가기" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/resume'"/>
    </div>
    
    <security:authorize url="/selfpr/delete">
	   	<div class="col-1" style="left: 740px;">
	    	<input style="background-color: #0D6EFD;" type="button" value="내 홍보글 삭제" class="btn btn-primary text-white" 
	    		   onclick="location.href='${pageContext.request.contextPath}/selfpr/delete?no=${selfprmem.prNo}'"/>
	    </div>
    </security:authorize>
        	
	<!-- 컨택하기 -->
	
	<div class="col-2" style="left: -105px;">
    	<input id="contactbtn" style="background-color: #0D6EFD;" type="button" value="작성자와 컨택하기" class="btn btn-primary" onclick="contact()"/>
    </div>
	
    	<div id="contactModal">
    		<div id="content">
    			<label>메세지 내용을 입력하시오</label>
    			<input type="text" id="contactContent">
    			<input type="button" value="전송하기" id="send">
    			<input type="button" value="취소하기" id="sendClose">
    		</div>
    	</div>
    
	    
	    
    </section>

    
    
    
<!-- SCRIPTS -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/isotope.pkgd.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/stickyfill.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.fancybox.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.easing.1.3.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.waypoints.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.animateNumber.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/quill.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap-select.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/daumPostcode.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/custom.js"></script>
    
    <script>

    // 관심인재 관련
    
	    function likeseeker(prNo){
	    	let matchresult = ${matchselfpr.likeresult}
	    	if(matchresult==0){
		    	$.ajax({
		    		url: '${pageContext.request.contextPath}/selfpr/like/likepr',
		    		type : 'POST',
		    		data : {'prNo': prNo},
		    		success: function(resp){
						$("#likeheart").removeClass('icon-heart-o');
						$("#likeheart").addClass('icon-heart');
// 						window.location.reload();

// 							$.ajax({
// 								url: '${pageContext.request.contextPath}/selfpr/like/likeMatch',
// 								type : 'POST',
// 								data : {'prNo': prNo},
// 								success: function(match){
// 									alert("성공");
// 								}
// 							});
		    		}
				});
		    }else {
	    		$.ajax({
	    			url: '${pageContext.request.contextPath}/selfpr/like/deleteLikepr',
	    			type : 'POST',
	    			data : {'prNo': prNo},
	    			success: function(remove){
	    				$("#likeheart").addClass('icon-heart-o');
	    				$("#likeheart").removeClass('icon-heart');
// 	    				window.location.reload();

// 	    				$.ajax({
// 							url: '${pageContext.request.contextPath}/selfpr/like/likeMatch',
// 							type : 'POST',
// 							data : {'prNo': prNo},
// 							success: function(match){
// 								alert("성공");
// 							}
// 						});
	    				
	    			}	
	    		});
	    	}
	    }
    
    // 들어가자마자 오늘 본 인재에 저장
    
   	//TODAYSEE 테이블에 insert
	$(document).ready(function(){
    	console.log("TODAYSEE 테이블에 insert 시작..");
    	
    	let memId = "${memId2}";
    	let prNo = "${param.no}";    	
    	
    	console.log("memId : " + memId);
    	console.log("prNo : " + prNo);
    	
    	let data = {"memId":memId,"prNo":prNo};
    	
    	console.log("data : " + JSON.stringify(data));
    	
    	$.ajax({
    		url: "${pageContext.request.contextPath}/selfpr/today",
    		contentType: "application/json;charset:utf-8",
    		data: JSON.stringify(data),
    		type: "post",
    		success:function(result){
    			console.log("result : " + result)
    		}
    	});
   	});
    
//     컨택하기 실행시 모달창 띄우기
    var contactbtn = document.getElementById('contactbtn');
    var sendClose = document.getElementById('sendClose');
    
//     컨택 창 띄우기
    contactbtn.onclick = function(){
    	var contactModal = document.getElementById('contactModal');
    	contactModal.style.display = 'block';
    }
    
//     컨택 창 닫기
    sendClose.onclick = function(){
    	var contactModal = document.getElementById('contactModal');
    	contactModal.style.display = 'none';
	}
    
    
    </script>
    
</body>