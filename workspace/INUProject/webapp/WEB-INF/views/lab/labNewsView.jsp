<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023.02.02  윤호연      최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
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
	</head>
	
	<!-- HOME -->
	<section class="section-hero home-section overlay inner-page bg-image" style="background-image: url('<%=request.getContextPath()%>/resources/images/hero_1.jpg');" id="home-section">
		<div class="container">
	        <div class="row">
				<div class="col-md-7">
		            <h1 class="text-white font-weight-bold">뉴스</h1>
		            <div class="custom-breadcrumbs">
						<a href="${pageContext.request.contextPath}/lab">Lab</a> <span class="mx-2 slash">/</span>
						<span class="text-white"><strong>News</strong></span>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="site-section">
  	<!-- 검색창 -->
 	 <form method="get">
  	  <div class="row mb-4">
   	   <div class="col-lg-4" style="left: 160px">
   	     <input type="text" class="form-control form-control-lg" placeholder="검색내용을 입력하시오">
       </div>
       <div class="col-lg-1" style="left: 150px">
        <button type="submit" class="btn btn-primary text-white"><span class="icon-line-search d-block"></span>검색</button>
       </div>
   	  </div>
  	</form>
  	
 	 <div class="container">
  	  <div class="row">
  	  
   <div class="col-9">
    <div class="card">
        <table class="table">
          <thead>
            <tr style="background-color: rgb(215, 218, 216);">
              <th>분야</th>
              <th>제목</th>
              <th>조회수</th>
              <th>작성일</th>
            </tr>
          </thead>
          <tbody>
          <c:set var="newsList" value="${pagingVO.dataList }"/>
          	<c:choose>
          	  <c:when test="${not empty newsList }">
          	  	<c:forEach items="${newsList }" var="news">
		            <tr>
		              <!-- <td>
		              	<c:url value="/lab/News/Detail" var="viewURL">
							<c:param name="no" value="${news.newsNo }"/>
						</c:url>
						<a href="${viewURL }">${news.newsNo }</a>
					  </td> -->
		              <td><strong>${news.newsField }</strong></td>
		              <td>
		              	<c:url value="/lab/News/Detail" var="viewURL">
							<c:param name="no" value="${news.newsNo }"/>
						</c:url>
						<a href="${viewURL }">${news.newsName }</a>
					  </td>
		              <td>${news.newsHit }</td>
		              <td>${news.newsDate }</td>
		            </tr>
          	  	</c:forEach>
          	  </c:when>
          	  <c:otherwise>
          	  	<tr>
          	  		<td colspan="6">게시글 없음.</td>
          	  	</tr>
          	  </c:otherwise>
          	</c:choose>
            
          </tbody>
        </table>
    </div>
  </div> 
   
	<!-- 오른쪽 Categories -->
	  <div class="col-lg-3">
	    <div class="sidebar-box sidebar-category" style="border: 1px solid #dae791; border-radius: 15px;">
	      <div class="categories">
	        <h3>Categories</h3>
	        <br>
	        <li><a href="#">취업 뉴스 <span>(1)</span></a></li>
	        <li><a href="#">기업 뉴스 <span>(1)</span></a></li>
	        <li><a href="#">공채 뉴스 <span>(1)</span></a></li>
	      </div>
	    </div>
	  </div>
  
  	</div>
   </div>
   <div style="height: 25px"></div>
	  <div class="col-lg-2" style="left: 870px;">
	     <button type="button" class="btn btn-primary text-white" onclick="location.href='<%=request.getContextPath() %>/lab/News/Form'">
	     <span class="icon-line-document d-block"></span>뉴스 작성</button>
	  </div>
    <hr>
    <div style="height: 25px"></div>
    
	<!-- 페이징 -->
	<div class="row pagination-wrap">
	  <div class="col-md-6 text-center text-md-right" style="left: 100px">
	      <div class="custom-pagination ml-auto">
	          <a href="#" class="prev">Prev</a>
	          <div class="d-inline-block">
	              <a href="#" class="active">1</a>
	              <a href="#">2</a>
	              <a href="#">3</a>
	              <a href="#">4</a>
	          </div>
	          <a href="#" class="next">Next</a>
	      </div>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>