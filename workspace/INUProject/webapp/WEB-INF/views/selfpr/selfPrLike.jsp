<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023.02.23   윤호연      제작
* 2023.03.07   윤호연      1차수정
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom-bs.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/quill.snow.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">    
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/help.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/layout.css">
    
<style type="text/css">

.img-jobseeker {
	width: 150px;
	height: 130px;    	
}

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
	    
/* 카드 */
      
    @import url('https://fonts.googleapis.com/css?family=Abel');

	.center {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  -webkit-transform: translate(-50%, -50%);
	}
	
	.card {
	  width: 485px;
	  height: 250px;
	  background-color: #fff;
	  background: linear-gradient(#f8f8f8, #fff);
	  box-shadow: 6px 12px 16px -8px rgba(0,0,0,0.4);
	  border-radius: 15px;
	  overflow: hidden;
	  position: relative;
	  margin: 1.5rem;
	}
	
	.card h1 {
	  font-family: 'TheJamsil5Bold';
	  font-size : 2.5em;
	  text-align: center;
	}
	
	.card p{
	  font-family: 'NanumSquareNeo-Variable';
	}
	
	.card .additional {
	  position: absolute;
	  width: 150px;
	  height: 100%;
	  background: linear-gradient(#dE685E, #EE786E);
	  transition: width 0.4s;
	  overflow: hidden;
	  z-index: 2;
	  left: 0px;
	}
	
	.card.green .additional {
	  background: linear-gradient(#f1d1d1, #ff0000);
	}
	
	
	.card:hover .additional {
	  width: 100%;
	  border-radius: 0 5px 5px 0;
	}
	
	.card .additional .user-card {
	  width: 150px;
	  height: 100%;
	  position: relative;
	  float: left;
	}
	
	.card .additional .user-card::after {
	  content: "";
	  display: block;
	  position: absolute;
	  top: 10%;
	  right: -2px;
	  height: 80%;
	  border-left: 2px solid rgba(0,0,0,0.025);*/
	}
	
	.card .additional .user-card .level,
	.card .additional .user-card .points {
	  top: 15%;
	  color: #fff;
	  text-transform: uppercase;
	  font-size: 0.75em;
	  font-weight: bold;
	  background: rgba(0,0,0,0.15);
	  padding: 0.125rem 0.75rem;
	  border-radius: 100px;
	  white-space: nowrap;
	}
	
	.card .additional .user-card .points {
	  top: 85%;
	}
	
	.card .additional .user-card svg {
	  top: 50%;
	}
	
	.card .additional .more-info {
	  width: 300px;
	  float: left;
	  position: absolute;
	  left: 150px;
	  height: 100%;
	}
	
	.card.green .additional .coords {
	  margin: 0 1rem;
	  color: #c7c7c7;
	  font-size: 0.9rem;
	  font-family: 'NanumSquareNeo-Variable';
	}
	
	.card .additional .coords span + span {
	  float: right;
	}
	
	.card.green .additional .stats {
	  font-family: 'NanumSquareNeo-Variable';
	  font-size: 2rem;
	  display: flex;
	  position: absolute;
	  bottom: 1rem;
	  left: 1rem;
	  right: 1rem;
	  top: auto;
	  color: #c7c7c7;
	}
	
	.card .additional .stats > div {
	  flex: 1;
	  text-align: center;
	}
	
	.card .additional .stats i {
	  display: block;
	}
	
	.card .additional .stats div.title {
	  font-size: 0.9rem;
	  font-weight: bold;
	  text-transform: uppercase;
	  border-bottom: 1px solid white;
	}
	
	.card .additional .stats div.value {
		font-size: 0.9rem;
		font-weight: bold;
		line-height: 1rem;
	}
	
	.card .additional .stats div.value.infinity {
		font-size: 2.5rem;
	}
	
	.card .general {
		width: 300px;
		height: 100%;
		position: absolute;
		top: 0;
		right: 0;
		z-index: 1;
		box-sizing: border-box;
		padding: 1rem;
		padding-top: 0;
	}
	
	.card .general .more {
		position: absolute;
		bottom: 1rem;
		right: 1rem;
		font-size: 0.9em;
	}
	.selectboxwidth{
		width: 205px;
	}
	.prsearchBtn{
		border: 1px solid black;
		width: 90px;
		height: 35px;
		border-radius: 5px;
		background-color: #d9d9f9;
		float: right;
	}
	
	.search_table{
	    float: right;
   	 	width: 425px;
	}
   	
</style>    
</head>
<body>

    <!-- 관심인재  UI -->
    
    <section class="site-section">
    
    <div class="wrap_board">
  		<div class="search_area"> 
	  	<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
	  		<div class="search_table">
		   	 <div class="searchTypoBox">
<!--   					<span class="inpSel" style="border: 1px solid #dbdbdb;"> -->
<%-- 						<form:select path="searchType"> --%>
<!-- 							<option value>전체</option> -->
<%-- 							<form:option value="" label="이름" /> --%>
<%-- 							<form:option value="" label="제목" /> --%>
<%-- 							<form:option value="" label="경력" /> --%>
<%-- 						</form:select> --%>
<!-- 					</span> -->
		   	   	<form:input style="width: 276px;" path="searchWord" type="text" class="inpTypo" placeholder="이름이나 제목을 입력하세요"/>
	       	   	<button type="submit" id="searchBtn" class="btnTypoSearch">검색</button>
		     </div>
			    <input type="hidden" name="page" />
	  		 </div>
	  	</form:form>
	  	</div>
	</div>
	
    <div class="row">
       	<c:set var="selfprLikeList" value="${pagingVO.dataList }"/>
         <c:choose>
          <c:when test="${not empty selfprLikeList }">
	       <c:forEach items="${selfprLikeList }" var="selfprLike">
       		
		  <div class="card green">
		    <div class="additional">
	       	  <a href="${pageContext.request.contextPath}/selfpr/Detail/?no=${selfprLike.prNo }">
		      <div class="user-card">
		        <div class="level center">
		          ${selfprLike.prWantjob }
		        </div>
		        <div class="points center">
		          ${selfprLike.prAnnual }
		        </div>
		        <svg width="110" height="110" viewBox="0 0 250 250" xmlns="http://www.w3.org/2000/svg" role="img" aria-labelledby="title desc" class="center">
		          <title id="title">Teacher</title>
		          <desc id="desc">Cartoon of a Caucasian woman smiling, and wearing black glasses and a purple shirt with white collar drawn by Alvaro Montoro.</desc>
		          <style>
		            .skin { fill: #eab38f; }
		            .eyes { fill: #1f1f1f; }
		            .hair { fill: #2f1b0d; }
		            .line { fill: none; stroke: #2f1b0d; stroke-width:2px; }
		          </style>
		          <defs>
		            <clipPath id="scene">
		              <circle cx="125" cy="125" r="115"/>
		            </clipPath>
		            <clipPath id="lips">
		              <path d="M 106,132 C 113,127 125,128 125,132 125,128 137,127 144,132 141,142  134,146  125,146  116,146 109,142 106,132 Z" />
		            </clipPath>
		          </defs>
		          <circle cx="125" cy="125" r="120" fill="rgba(0,0,0,0.15)" />
		          <g stroke="none" stroke-width="0" clip-path="url(#scene)">
		            <rect x="0" y="0" width="250" height="250" fill="#b0d2e5" />
		            <g id="head">
		              <path fill="none" stroke="#111111" stroke-width="2" d="M 68,103 83,103.5" />
		              <path class="hair" d="M 67,90 67,169 78,164 89,169 100,164 112,169 125,164 138,169 150,164 161,169 172,164 183,169 183,90 Z" />
		              <circle cx="125" cy="100" r="55" class="skin" />
		              <ellipse cx="102" cy="107" rx="5" ry="5" class="eyes" id="eye-left" />
		              <ellipse cx="148" cy="107" rx="5" ry="5" class="eyes" id="eye-right" />
		              <rect x="119" y="140" width="12" height="40" class="skin" />
		              <path class="line eyebrow" d="M 90,98 C 93,90 103,89 110,94" id="eyebrow-left" />
		              <path class="line eyebrow" d="M 160,98 C 157,90 147,89 140,94" id="eyebrow-right"/>
		              <path stroke="#111111" stroke-width="4" d="M 68,103 83,102.5" />
		              <path stroke="#111111" stroke-width="4" d="M 182,103 167,102.5" />
		              <path stroke="#050505" stroke-width="3" fill="none" d="M 119,102 C 123,99 127,99 131,102" />
		              <path fill="#050505" d="M 92,97 C 85,97 79,98 80,101 81,104 84,104 85,102" />
		              <path fill="#050505" d="M 158,97 C 165,97 171,98 170,101 169,104 166,104 165,102" />
		              <path stroke="#050505" stroke-width="3" fill="rgba(240,240,255,0.4)" d="M 119,102 C 118,111 115,119 98,117 85,115 84,108 84,104 84,97 94,96 105,97 112,98 117,98 119,102 Z" />
		              <path stroke="#050505" stroke-width="3" fill="rgba(240,240,255,0.4)" d="M 131,102 C 132,111 135,119 152,117 165,115 166,108 166,104 166,97 156,96 145,97 138,98 133,98 131,102 Z" />
		              <path class="hair" d="M 60,109 C 59,39 118,40 129,40 139,40 187,43 189,99 135,98 115,67 115,67 115,67 108,90 80,109 86,101 91,92 92,87 85,99 65,108 60,109" />
		              <path id="mouth" fill="#d73e3e" d="M 106,132 C 113,127 125,128 125,132 125,128 137,127 144,132 141,142  134,146  125,146  116,146 109,142 106,132 Z" /> 
		              <path id="smile" fill="white" d="M125,141 C 140,141 143,132 143,132 143,132 125,133 125,133 125,133 106.5,132 106.5,132 106.5,132 110,141 125,141 Z" clip-path="url(#lips)" />
		            </g>
		            <g id="shirt">
		              <path fill="#8665c2" d="M 132,170 C 146,170 154,200 154,200 154,200 158,250 158,250 158,250 92,250 92,250 92,250 96,200 96,200 96,200 104,170 118,170 118,170 125,172 125,172 125,172 132,170 132,170 Z"/>
		              <path id="arm-left" class="arm" stroke="#8665c2" fill="none" stroke-width="14" d="M 118,178 C 94,179 66,220 65,254" />
		              <path id="arm-right" class="arm" stroke="#8665c2" fill="none" stroke-width="14" d="M 132,178 C 156,179 184,220 185,254" />
		              <path fill="white" d="M 117,166 C 117,166 125,172 125,172 125,182 115,182 109,170 Z" />
		              <path fill="white" d="M 133,166 C 133,166 125,172 125,172 125,182 135,182 141,170 Z" />
		              <circle cx="125" cy="188" r="4" fill="#5a487b" />
		              <circle cx="125" cy="202" r="4" fill="#5a487b" />
		              <circle cx="125" cy="216" r="4" fill="#5a487b" />
		              <circle cx="125" cy="230" r="4" fill="#5a487b" />
		              <circle cx="125" cy="244" r="4" fill="#5a487b" />
		              <path stroke="#daa37f" stroke-width="1" class="skin hand" id="hand-left" d="M 51,270 C 46,263 60,243 63,246 65,247 66,248 61,255 72,243 76,238 79,240 82,243 72,254 69,257 72,254 82,241 86,244 89,247 75,261 73,263 77,258 84,251 86,253 89,256 70,287 59,278" /> 
		              <path stroke="#daa37f" stroke-width="1" class="skin hand" id="hand-right" d="M 199,270 C 204,263 190,243 187,246 185,247 184,248 189,255 178,243 174,238 171,240 168,243 178,254 181,257 178,254 168,241 164,244 161,247 175,261 177,263 173,258 166,251 164,253 161,256 180,287 191,278"/> 
		            </g>
		          </g>
		        </svg>
		      </div>
		      <div class="more-info">
		      	<br style="height: 2px;">
		        <h1>${selfprLike.memName }</h1>
		        <div class="coords">
		          <span>학력 : ${selfprLike.prEdu }</span>
		          <br>
		          <span>등록일 : ${selfprLike.inteDate }</span>
		          <br>
		          <span>산업분야 : ${selfprLike.industryName }</span>
		          <br>
		          <span>지역 : ${selfprLike.regionName }</span>
		        </div>
		        <div class="stats">
		          <div>
		            <div class="title">경력</div>
		            <div class="value"><br>${selfprLike.prAnnual }</div>
		          </div>
		          <div>
		            <div class="title">원하는 직급</div>
		            <div class="value"><br>${selfprLike.prWantType }</div>
		          </div>
		          <div>
		            <div class="title">원하는 연봉</div>
		            <div class="value"><br>${selfprLike.prWantmn }</div>
		          </div>
		        </div>
		      </div>
		    </div>
		  	</a>
		    <div class="general">
		      <br>
		      <h1>${selfprLike.memName }</h1>
		      <br>
		      <br>
		      <p>&ldquo;${selfprLike.prName }&rdquo;</p>
		    </div>
		  </div>
		  
		  </c:forEach>
	     </c:when>
	    </c:choose>
	    </div>
	    </section>
    
    
    
    
    
    
    
	<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
		<form:hidden path="searchType"/>
		<form:hidden path="searchWord"/>
		<input type="hidden" name="page" />
	</form:form>
    
    <!-- 페이징 -->
	<div class="row pagination-wrap">
	  <div class="col-md-12 text-center text-md-right" style="left: 350px">
		<div id = "pagingArea">
			<ui:pagination pagingVO="${pagingVO }" type="bootstrap"/>
	    </div>
	  </div>
	</div>
	
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

	<script type="text/javascript">
	
	let searchForm = $("#searchForm").on("click", "#searchBtn", function(){
		let inputs = searchUI.find(":input[name]");
		$.each(inputs, function(index, input){
			let name = this.name;
			let value = $(this).val();
			searchForm.find("[name="+name+"]").val(value);
		});
		searchForm.submit();
	});
	
	$("a.paging").on("click", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(!page) return false;
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
		return false;
	});
	</script>
</body>