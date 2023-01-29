<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    
    <div class="header-blue">
		<nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
			<div class="container">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/index.do">로고</a>
                <ul class="nav navbar-nav">
				    <li class="nav-item text-nowrap">
				      <a class="nav-link" href="${pageContext.request.contextPath}/">채용공고</a>
				    </li>
				    <li class="nav-item text-nowrap">
				      <a class="nav-link" href="${pageContext.request.contextPath}/">인재홍보</a>
				    </li>
				    <li class="nav-item text-nowrap">
				      <a class="nav-link" href="${pageContext.request.contextPath}/">전문컨텐츠</a>
				    </li>
				    <li class="nav-item text-nowrap">
				      <a class="nav-link" href="${pageContext.request.contextPath}/">취업랩</a>
				    </li>
				    <li class="nav-item text-nowrap">
				      <a class="nav-link" href="${pageContext.request.contextPath}/">커뮤니티</a>
				    </li>
				    <li class="nav-item text-nowrap">
				      <a class="nav-link" href="${pageContext.request.contextPath}/">부가기능</a>
				    </li>
				    <li class="nav-item text-nowrap">
				      <a class="nav-link" href="${pageContext.request.contextPath}/">고객센터</a>
				    </li>
				</ul>
				<ul class="nav px-4 col-4">
				    <li class="nav-item text-nowrap">
				      <a class="nav-link" href="<%=request.getContextPath() %>/login/loginForm.jsp">Sign in</a>
				    </li>
				    <li class="nav-item text-nowrap">
				      <a class="nav-link" href="<%=request.getContextPath() %>/login/logout.do">Sign out</a>
				    </li>
				    <li class="nav-item text-nowrap">
				      <a class="nav-link" href="${pageContext.request.contextPath}/">마이페이지</a>
				    </li>
                </ul>
            </div>
		</nav>
    </div>
