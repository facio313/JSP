<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023.02.23   윤호연      제작
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    	.img-jobseeker {
			width: 150px;
			height: 130px;    	
    	}
    </style>    
</head>
<body>

	<!-- 검색 -->
	
	<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
  	  <div class="row mb-4">
   	   <div class="col-lg-4" style="left: 160px">
   	     <form:input path="searchWord" type="text" class="form-control form-control-lg" placeholder="검색내용을 입력하시오"/>
       </div>
       <div class="col-lg-1" style="left: 150px">
        <button type="submit" id="searchBtn" class="btn btn-primary text-white"><span class="icon-line-search d-block"></span>검색</button>
       </div>
   	  </div>
   	  <input type="hidden" name="page"/>
  	</form:form>
	
	<!-- 관심인재 확인 UI -->

 	<section class="site-section" id="next">
      <div class="container">
        
      <c:set var="selfprLikeList" value="${pagingVO.dataList }"/>
        <c:choose>
          <c:when test="${not empty selfprLikeList }">
	       <c:forEach items="${selfprLikeList }" var="selfprLike">
	        <ul class="job-listings mb-5">
	          <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
	            <a href="${pageContext.request.contextPath}/selfpr/Detail/?no=${selfprLike.prNo }"></a>
	            <div class="job-listing-logo">
	              <img src="${pageContext.request.contextPath}/resources/images/jobSeeker.png" alt="Image" class="img-jobseeker">
	            </div>
	
	            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
	              <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
	              
	              <!-- 여기 추가 쿼리 돌려야함 -->
	                <h3 class="icon-account_circle">&nbsp;${selfprLike.memName }</h3>
	                <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                	    ${selfprLike.industryName }</strong>
	                <br>
	                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                	  ${selfprLike.prAnnual }</span>
	              </div>
	              <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
	                <span class="icon-room"></span>&nbsp;${selfprLike.regionName }
	                <br>
	                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${selfprLike.prWantjob }</span>
	                <br>
	                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${selfprLike.prWantmn }</span>
	              </div>
	            </div>
	          </li>
	         </ul>
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
	  <div class="col-md-12 text-center text-md-right" style="left: 450px">
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
</html>