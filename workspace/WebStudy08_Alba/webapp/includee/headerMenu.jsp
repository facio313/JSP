<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<link href="<%=request.getContextPath()%>/resources/css1/lib/animate/animate.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css1/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css1/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css1/css/style.css" rel="stylesheet">

<div class="container-fluid nav-bar bg-transparent">
    <nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
        <a href="${pageContext.request.contextPath}/" class="navbar-brand d-flex align-items-center text-center bg-white">
            <div class="icon p-2 me-2">
                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/logo.jpg" alt="Icon" style="width: 60px; height: 60px;">
            </div>
            <h1 class="m-0 text-primary">HOME</h1>
        </a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto">
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">채용공고</a>
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">인재홍보</a>
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">전문컨텐츠</a>
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">취업랩</a>
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">커뮤니티</a>
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">부가기능</a>
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">고객센터</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">고객센터</a>
                    <div class="dropdown-menu rounded-0 m-0">
                        <a href="property-list.html" class="dropdown-item">ㅁ</a>
                        <a href="property-type.html" class="dropdown-item">Property Type</a>
                        <a href="property-agent.html" class="dropdown-item">Property Agent</a>
                    </div>
                </div>
            </div>
            <a href="" class="btn btn-primary px-3 d-none d-lg-flex">마이페이지</a>
        </div>
    </nav>
</div>

<!--  
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap w-100 p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="${pageContext.request.contextPath }">WebStudy06</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <ul class="nav px-3 col">
    <li class="nav-item text-nowrap"><a href="${pageContext.request.contextPath}/" class="nav-link">로고</a></li>
	<li class="nav-item text-nowrap"><a class="nav-link" href="${pageContext.request.contextPath}/">채용공고</a></li>
	<li class="nav-item text-nowrap"><a class="nav-link" href="${pageContext.request.contextPath}/">인재홍보</a></li>
	<li class="nav-item text-nowrap"><a class="nav-link" href="${pageContext.request.contextPath}/">전문컨텐츠</a></li>
	<li class="nav-item text-nowrap"><a class="nav-link" href="${pageContext.request.contextPath}/">취업랩</a></li>
	<li class="nav-item text-nowrap"><a class="nav-link" href="${pageContext.request.contextPath}/">커뮤니티</a></li>
	<li class="nav-item text-nowrap"><a class="nav-link" href="${pageContext.request.contextPath}/">부가기능</a></li>
	<li class="nav-item text-nowrap"><a class="nav-link" href="${pageContext.request.contextPath}/">고객센터</a></li>
  </ul>
</nav>
 -->