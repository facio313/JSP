<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<script src="${pageContext.request.contextPath}/resources/header/lib/wow/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/header/js/main.js"></script>
<!-- link -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/header/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/header/css/style.css" rel="stylesheet">

<header class="ks-header nav-bar bg-transparentt radius">
    <nav class="navbar navbar-expand-lg navbar-light py-0 px-4 bg-transparent radius">
        <a href="${pageContext.request.contextPath}/" class="navbar-brand d-flex align-items-center text-center transparent">
            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/logo.jpg" alt="Icon" style="width: 45px; height: 45px;">
            &nbsp;&nbsp;&nbsp;
            <h1 class="m-0 text-primary">INU</h1>
        </a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
        	<div class="ks-blank ms-auto"></div>
            <div class="navbar-nav ms-auto">
              	<security:authorize url="/board/boardList.do">
                <a href="${pageContext.request.contextPath }/board/boardList.do" class="nav-item nav-link active">자유게시판</a>
          	    </security:authorize>
            </div>
            <div class="navbar-nav ms-auto">
                <security:authorize url="/member/memberList.do">
                <a href="${pageContext.request.contextPath }/member/memberList.do" class="nav-item nav-link active">회원관리</a>
                </security:authorize>
            </div>
            <div class="navbar-nav ms-auto">
          	  <security:authorize url="/prod">
                <a href="${pageContext.request.contextPath}/prod" class="nav-item nav-link active">상품관리</a>
			  </security:authorize>
            </div>
            <div class="navbar-nav ms-auto">
            	<security:authorize url="/buyer/buyerList.do">
                <a href="${pageContext.request.contextPath}/buyer/buyerList.do" class="nav-item nav-link active">거래처관리</a>
                </security:authorize>
            </div>
            <div class="navbar-nav ms-auto">
                <a href="?language=en" class="nav-item nav-link active">영어</a>
            </div>
            <div class="navbar-nav ms-auto">
                <a href="?language=ko" class="nav-item nav-link active">한글</a>
            </div>
            <div class="nav-item dropdown ms-auto">
                <a href="${pageContext.request.contextPath}/" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">고객센터</a>
                <div class="dropdown-menu rounded-0 m-0">
                    <a href="property-list.html" class="dropdown-item">공지사항</a>
                    <a href="property-type.html" class="dropdown-item">문의사항</a>
                    <a href="property-agent.html" class="dropdown-item">FAQ</a>
                </div>
            </div>
        	<div class="ks-blank ms-auto"></div>
        </div>
        <a href="" class="btn btn-primary hover px-3 d-none d-lg-flex ms-auto">마이페이지</a>
	</nav>
</header>