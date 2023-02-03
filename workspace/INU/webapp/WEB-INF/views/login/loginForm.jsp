<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

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

<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">
	<script>
		alert("${SPRING_SECURITY_LAST_EXCEPTION.message}");
	</script>
	<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
</c:if>
<%-- 
<form class="contentsWrap" method="post" action="<c:url value='/login/loginProcess.do'/>" id="loginForm">
	<security:csrfInput/>
        <div class="loginWindow">
        <a href="#" class="">일반회원</a>
        <a href="#" class="">기업회원</a>
            <input type="text" name="memId" placeholder="아이디" class="inlineToBlock">
            <input type="password" name="memPass" placeholder="비밀번호" class="inlineToBlock">
        <button class="inlineToBlock ordinaryLogin unactivatedLoginColor">로그인</button>

    </div>
    <div class="haveAccount">
        <p>
          <a href="<c:url value='/join/incruiter'/>" class="noneunderline">기업회원가입</a>
          ,
          <a href="<c:url value='/join/seeker'/>" class="noneunderline">일반회원가입</a>
          |
          <a href="<c:url value='/idpwFind.do'/>" class="noneunderline">아이디/비밀번호 찾기</a>
          
        </p>
    </div>
</form>
 --%>



  <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border text-primary" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>
    

<div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->
    

    <!-- HOME -->
    <section class="section-hero overlay inner-page bg-image" style="background-image: url('<%=request.getContextPath()%>/resources/images/hero_1.jpg');" id="home-section">
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h1 class="text-white font-weight-bold">로그인</h1>
            <div class="custom-breadcrumbs">
              <a href="#">Home</a> <span class="mx-2 slash">/</span>
              <span class="text-white"><strong>Log In</strong></span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 mb-5">
            <h2 class="mb-4">로그인</h2>
            <form class="p-4 border rounded" action="<c:url value='/login/loginProcess.do'/>" method="post" id="loginForm">

              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">ID</label>
                  <input type="text" id="memId" class="form-control" placeholder="아이디">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">Password</label>
                  <input type="password" id="memPass" class="form-control" placeholder="비밀번호">
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="로그인" class="btn px-4 btn-primary text-white">
                </div>
                <div>
                  <hr>
                  <p>
                    <a href="<c:url value='/join/seeker'/>" class="noneunderline">회원가입</a>
                    |
                    <a href="<c:url value='/idpwFind'/>" class="noneunderline">아이디/비밀번호 찾기</a>
                  </p>
                </div>
              </div>

            </form>
          </div>
        </div>
      </div>
    </section>
    
  
  </div>

    <!-- SCRIPTS -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/stickyfill.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.fancybox.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.easing.1.3.js"></script>
    
    <script src="<%=request.getContextPath()%>/resources/js/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.animateNumber.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/quill.min.js"></script>
    
    
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap-select.min.js"></script>
    
    <script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
    
