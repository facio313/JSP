<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023.02.02  윤호연      최초작성
* 2023.02.28  윤호연      화면수정
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	    
	<style>
		.tblType thead th, .tblType tbody th, .tblType tbody td {
		    font-size: 17px;
		}
	</style>
	</head>

	<section class="site-section">
  	<!-- 검색창 -->
  	<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
  	  <div class="row mb-4">
   	   <div class="col-lg-4" style="left: 160px">
   	     <form:input path="searchWord" type="text" class="form-control form-control-lg" placeholder="검색내용을 입력하시오"/>
       </div>
       <div class="col-lg-1" style="left: 150px">
        <button type="submit" id="searchBtn" class="btn btn-primary text-white"><span class="icon-line-search d-block"></span>검색</button>
       </div>
   	  </div>
<%--  <form:hidden path="searchWord" /> --%>
<!--  <input type="hidden" name="page"/> -->
	  <input type="hidden" name="newsField" />
	  <input type="hidden" name="page" />
  	</form:form>


  	 <div class="tblType">
        <table>
          <colgroup>
			<col width="64" />
			<col width="" />
			<col width="600" />
			<col width="107" />
		  </colgroup>
          <thead>
            <tr>
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
		              <td><strong>${news.newsField }</strong></td>
		              <td>
		              	<c:url value="/lab/News/Detail" var="viewURL">
							<c:param name="no" value="${news.newsNo }"/>
						</c:url>
						<a href="${viewURL }">${news.newsName }</a>
					  </td>
		              <td>${news.newsHit }</td>
		              <td><fmt:formatDate value="${news.newsDate }" pattern="yyyy-MM-dd" type="Date"/></td>
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

	<!-- 오른쪽 Categories -->
	  <div class="col-lg-3">
	    <div class="sidebar-box sidebar-category" style="border: 1px solid #dae791; border-radius: 15px;">
	      <div class="categories">
	        <h3>Categories<span>(${pagingVO.totalRecord })</span></h3>
	        <br>
	        <li><a href="#" onclick="selectCategory('취업')">취업 뉴스 <span>${NewsVO.newsFieldSum }</span></a></li>
	        <li><a href="#" onclick="selectCategory('기업')">기업 뉴스 <span>(1)</span></a></li>
	        <li><a href="#" onclick="selectCategory('공채')">공채 뉴스 <span>(1)</span></a></li>
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
	  <div class="col-md-12 text-center text-md-right" style="left: 450px">
		<div id = "pagingArea">
			<ui:pagination pagingVO="${pagingVO }" type="bootstrap"/>
	    </div>
	  </div>
	</div>

  </section>

	<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
		<input type="hidden" name="page" />
	</form:form>

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

	function selectCategory(category) {
		$('input[name=newsField]').val(category);
		$('#searchForm').submit();
	}
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>