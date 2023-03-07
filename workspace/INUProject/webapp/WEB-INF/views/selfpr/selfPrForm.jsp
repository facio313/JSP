<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* ${date}      윤호연      최초작성
* 2023.02.20   윤호연      1차수정
* 2023.03.07   윤호연      2차수정
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/custom-bs.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/animate.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">

<style type="text/css">
	/* 폰트 */
	@font-face {
	    font-family: 'TheJamsil5Bold';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
	}
	/* 나눔스퀘어 네오 */
	@font-face {
	    font-family: 'NanumSquareNeo-Variable';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
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
	p, label{
	 	font-family: 'NanumSquareNeo-Variable';
	}
	.selectboxwidth{
		width: 205px;
	}
	
	
.qna_write_wrap .qna_write_selection {padding: 0 0 22px;}
.btn-primary {background-color: #045738; border-color: #045738;}
.ck-editor__editable { height: 400px; }
.ck-content { font-size: 15px; }

</style>   
</head>
<body>
	<section style="padding-top: 100px;">
        <div class="container">
		<h4 style="font-family: 'TheJamsil5Bold'; font-size: 2em;">인재 홍보글 작성</h4>
		<div style="height: 25px;"></div>
          <div class="row align-items-center justify-content-center">
            <div class="col-md-12">
            
              <form action="${pageContext.request.contextPath}/selfpr/Insert" method="post" class="p-4 p-md-5 border rounded" id="searchUI">
              	<input type="hidden" name="memId" value="${memId}" />
                <div class="row mb-5">
	                <p>※ 해당하는 항목을 선택해주세요</p>
	                <div style="height: 10px;"></div>
	                <hr style="width: 1000px; height: 1px;">
	                
					<!-- 1번째 -->
	                <div class="selectboxwidth">
					<p style="text-align: center;">희망산업분야선택(대분류)</p>
		                  <select name="industry0" class="form-select form-select-sm selectBox">
							 <option value>기초</option>
						  </select>
					</div>	
	                 
	                  <!-- 2번째 -->
					<div class="selectboxwidth">
	                 	  <p style="text-align: center;">희망근무지역선택(광역)</p>
		                  <select name="metro" class="form-select form-select-sm selectBox">
							 <option value>기초</option>
						  </select>
					</div>	
	                  
	                  <!-- 3번째 -->
	                <div class="selectboxwidth">
	                	<p style="text-align: center;">희망직급선택</p>
	                    <select class="form-select form-select-sm selectBox" name="prWanttype">
	                      <option class="bs-title-option" value="none">희망직급 선택</option>
	                      <option value="사원급">사원급</option>
	                      <option value="주임급">주임급</option>
	                      <option value="대리급">대리급</option>
	                      <option value="과장급">과장급</option>
	                      <option value="부장급">부장급</option>
	                    </select>
	                </div>
	                 
	                  <!-- 4번째 -->
	                <div class="selectboxwidth">
	               	<p style="text-align: center;">해당직무경력선택</p>
	                   <select class="form-select form-select-sm selectBox" name="prAnnual">
	                      <option class="bs-title-option" value="none">직무경력 선택</option>
	                      <option value="신입">신입</option>
	                      <option value="1년차 미만">1년차 미만</option>
	                      <option value="1~2년">1~2년</option>
	                      <option value="2~3년">2~3년</option>
	                      <option value="3~5년">3~5년</option>
	                      <option value="5~10년">5~10년</option>
	                      <option value="10년 이상">10년 이상</option>
					   </select>
	                 </div>
	                  
	                  <!-- 5번째 -->
	                   <div class="selectboxwidth">
	                  	<p style="text-align: center;">본인학력선택</p>
	                      <select class="form-select form-select-sm selectBox" name="prEdu">
	                        <option class="bs-title-option" value="none">본인학력 선택</option>
	                        <option value="초,중졸">초,중졸</option>
	                        <option value="고졸">고졸</option>
	                        <option value="대학교(2,3년)졸업예정">대학교(2,3년)졸업예정</option>
	                        <option value="대학교(4년)졸업예정">대학교(4년)졸업예정</option>
	                        <option value="대학교(2,3년)졸업">대학교(2,3년)졸업</option>
	                        <option value="대학교(4년)졸업">대학교(4년)졸업</option>
	                        <option value="석사">석사</option>
	                        <option value="박사">박사</option>
	                      </select>
	                  </div>
                  
                  <!-- 칸 띄우기 -->
                  <div style="width: 840px; height: 15px;"></div>
                  
                  <!-- 6번째 -->
                  <div class="selectboxwidth">
                 	<p style="text-align: center;">희망분야산업선택(중분류)</p>
	                  <select name="industry1" class="form-select form-select-sm selectBox">
						  <option value>중위</option>
					  </select>
			      </div>
                  
                  <!-- 7번째 -->
                  <div class="selectboxwidth">
                    <p style="text-align: center;">희망근무지역선택(기초)</p>
	                  <select name="regionCode" class="form-select form-select-sm selectBox">
						 <option value>기초</option>
					  </select>
				  </div>	
				  
                 <!-- 칸 띄우기 -->
                 <div style="width: 890px; height: 15px;"></div>
									
				<!-- 8번째 (industryCode)하위 -->
				<div class="selectboxwidth">	
				   <p style="text-align: center;">희망분야산업선택(소분류)</p> 
					 <select name="industryCode" class="form-select form-select-sm selectBox">
							<option value>하위</option>
					 </select>
				</div>
                </div>
                <hr style="width: 1000px; height: 1px;">
            </div>
          </div>
        </div>
       </section>
	
	<!-- 입력 폼 -->
    <section class="site-section">
      <div class="container">
        <div class="row mb-5">
		  <div class="col-lg-12 p-4 p-md-5 border rounded">
			<div class="contents_container qna_write_wrap">
			
              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black">자신을 표현하는 한마디</label> 
                  <input type="text" class="form-control" name="prName" placeholder="(ex.매사 성실한 사람입니다.)">
                </div>
              </div>
              
              <div class="row form-group">
	                <div class="col-md-6">
	                  <label class="text-black">희망연봉</label> 
	                  <input type="text" class="form-control" name="prWantmn" placeholder="(ex.3000만원)">
	                </div>
	              
	                <div class="col-md-6">
	                  <label class="text-black">희망직무</label> 
	                  <input type="text" class="form-control" name="prWantjob" placeholder="(ex.총무)">
	                </div>
              </div>
              
              <div class="top-interval"></div>

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black">간단 자기소개글</label> 
                  <textarea name=prContent cols="30" rows="7" class="form-control" placeholder="Write your notes or questions here..."></textarea>
                </div>
              </div>

             <div class="col-md-12">
               <input type="submit" value="작성하기" class="btn btn-primary btn-md text-white">
               <input type="submit" onclick="" value="저장 후 이력서로 이동" class="btn btn-primary btn-md text-white">
             </div>
            
            </form>
                <div class="top-interval"></div>
                
                </div>
            </div>
           </div>
          </div>
        </section>
        
        
    <script>
    
    /* 하위 지역 셀렉트 */
    $("[name=metro]").on("change", function(){
  		$("[name='regionCode'] option").remove();   
  		$("[name='regionCode']").append("<option>지역</option>");
  		
  		let ref = $(this).val();
  		let data = [{type:'region',code:ref}];
  		
  		$.ajax({
  			url : "${pageContext.request.contextPath}/selfpr/search",
  			method : "post",
  			data : JSON.stringify(data),
  			dataType : "json",
  			contentType: 'application/json',
  			success : function(resp) {
  				console.log("리스트뽑아옴");
  				console.log(resp);
  				let regionList = resp.regionList;
  				let regionOption = [];
  				
  				$.each(regionList, function(index, val){
  					let tr = null;
  					tr = $("<option>").attr("class","code").prop("value",val.regionCode).html(val.regionName);
  					regionOption.push(tr);
  				})
  				$("select[name=regionCode]").append(regionOption);
  			},
  			error : function(jqXHR, status, error) {
  				console.log(jqXHR);
  				console.log(status);
  				console.log(error);
  			}
  		});   
  	});
    
    /* 업종 셀렉트 */
    $("[name=industry0]").on("change", function(){
//  	 	console.log($(this).val());
//  	 	console.log($("[name=industry0]").val());
  		
  		$("[name='industry1'] option").remove();   
  		$("[name='industry1']").append("<option>중위</option>");
  		$("[name='industryCode'] option").remove();   
  		$("[name='industryCode']").append("<option>하위</option>");
  		
  		let ref = $(this).val();
  		let data = [{type:'industry',code:ref}];
  		
  		$.ajax({
  			url : "${pageContext.request.contextPath}/selfpr/search",
  			method : "post",
  			data : JSON.stringify(data),
  			dataType : "json",
  			contentType: 'application/json',
  			success : function(resp) {
  				
  				console.log("리스트뽑아옴");
  				let industryList = resp.industryList;
  				let industryOption = [];
  				
  				$.each(industryList, function(index, val){
  					let tr = null;
  					tr = $("<option>").attr("class","code").prop("value",val.industryCode).html(val.industryName);
  					industryOption.push(tr);
  				})
  				$("select[name=industry1]").append(industryOption);
  			},
  			error : function(jqXHR, status, error) {
  				console.log(jqXHR);
  				console.log(status);
  				console.log(error);
  			}
  		});   
  	});
    $("[name=industry1]").on("change", function(){
		$("[name='industryCode'] option").remove();   
		$("[name='industryCode']").append("<option>하위</option>");
		
		let ref = $(this).val();
		let data = [{type:'industry',code:ref}];
		
		$.ajax({
			url : "${pageContext.request.contextPath}/selfpr/search",
			method : "post",
			data : JSON.stringify(data),
			dataType : "json",
			contentType: 'application/json',
			success : function(resp) {
				console.log("리스트뽑아옴");
				let industryList = resp.industryList;
				let industryOption = [];
				
				$.each(industryList, function(index, val){
					let tr = null;
					tr = $("<option>").attr("class","code").prop("value",val.industryCode).html(val.industryName);
					industryOption.push(tr);
				})
				$("select[name=industryCode]").append(industryOption);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});   
	});
    
    /* 최상위 셀렉트... */
    let topData = [
  		{type:'region', code:''}
  		, {type:'industry', code:''}
  	]
  	$.ajax({
  		url : "${pageContext.request.contextPath}/selfpr/search",
  		method : "post",
  		data : JSON.stringify(topData),
  		dataType : "json",
  		contentType: 'application/json',
  		success : function(resp) {
  			console.log("리스트뽑아옴");
  			let regionList = resp.regionList;
  			let industryList = resp.industryList;
  			
  			console.log("regionList",regionList);
  			console.log("industryList",industryList);
  			
  			let regionOption = [];
  			let industryOption = [];
  			
  			$.each(regionList, function(index, val){
  				let tr = null;
  				tr = $("<option>").attr("class","code").prop("value",val.regionCode).html(val.regionName);
  				regionOption.push(tr);
  			})
  			
  			$.each(industryList, function(index, val){
  				let tr = null;
  				tr = $("<option>").attr("class","code").prop("value",val.industryCode).html(val.industryName);
  				industryOption.push(tr);
  			})
  			
  			$("select[name=metro]").append(regionOption);
  			$("select[name=industry0]").append(industryOption);
  		},
  		error : function(jqXHR, status, error) {
  			console.log(jqXHR);
  			console.log(status);
  			console.log(error);
  		}
  	});
    
    
    </script>
    
          
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
</body>
</html>