<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<script src="${pageContext.request.contextPath}/resources/header/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/header/lib/wow/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/header/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/header/lib/waypoints/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/header/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/header/js/main.js"></script>
<!-- link -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/header/lib/animate/animate.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/header/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/header/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/header/css/style.css" rel="stylesheet">

<header class="ks-header nav-bar bg-transparentt radius">
    <nav class="navbar navbar-expand-lg navbar-light py-0 px-4 bg-transparent">
        <a href="${pageContext.request.contextPath}/" class="navbar-brand d-flex align-items-center text-center">
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
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">채용공고</a>
            </div>
            <div class="navbar-nav ms-auto">
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">인재홍보</a>
            </div>
            <div class="navbar-nav ms-auto">
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">유료상품</a>
            </div>
            <div class="navbar-nav ms-auto">
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">취업랩</a>
            </div>
            <div class="navbar-nav ms-auto">
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">커뮤니티</a>
            </div>
            <div class="navbar-nav ms-auto">
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">부가기능</a>
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
        <a href="" class="btn btn-primary px-3 d-none d-lg-flex ms-auto">마이페이지</a>
	</nav>
</header>