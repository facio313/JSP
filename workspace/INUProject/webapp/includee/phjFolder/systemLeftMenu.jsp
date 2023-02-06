<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<script src="${pageContext.request.contextPath}/resources/leftMenu/lib/wow/wow.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/leftMenu/css/style.css">
		
<leftmenu class="col-lg-2 sidebar ks-leftmenu ks-lm-radius">
	<h1 style="text-align:right;"><i id="collapse" class="fa fa-bars"></i></h1>
	<sidebar>
		<h1 class="text-center"><a href="${pageContext.request.contextPath }/systemManagement" class="logo">시스템 관리 홈</a></h1>
		<hr>
		<h2 class="text-center"><a href="${pageContext.request.contextPath }/systemManagement/seekerList" class="logo">일반회원 계정관리</a></h2>
		<hr>
		<ul class="list-unstyled components mb-5 text-left">
			<li class="active">
				<a href="${pageContext.request.contextPath}/systemManagement/seekerList"><span class="fa fa-home"></span>일반회원 계정목록</a>
			</li>
			<li>
			    <a href="${pageContext.request.contextPath}/systemManagement/cutList"><span class="fa fa-user"></span>차단 계정목록</a>
			</li>
			<li>
			  	<a href="${pageContext.request.contextPath}/systemManagement/blackList"><span class="fa fa-sticky-note"></span>블랙리스트 목록</a>
			</li>
		</ul>
		<hr>
		<h2 class="text-center"><a href="${pageContext.request.contextPath }/" class="logo">기업회원 계정관리</a></h2>
		<hr>
		<ul class="list-unstyled components mb-5 text-left">
			<li class="active">
				<a href="${pageContext.request.contextPath}/"><span class="fa fa-home"></span>기업회원 계정목록</a>
			</li>
			<li>
			    <a href="${pageContext.request.contextPath}/"><span class="fa fa-user"></span>기업총괄회원 계정목록</a>
			</li>
		</ul>
		<hr>
		<h2 class="text-center"><a href="${pageContext.request.contextPath }/" class="logo">전문가 계정관리</a></h2>
		<hr>
		<ul class="list-unstyled components mb-5 text-left">
			<li class="active">
				<a href="${pageContext.request.contextPath}/"><span class="fa fa-home"></span>전문가 계정목록</a>
			</li>
			<li>
			    <a href="${pageContext.request.contextPath}/"><span class="fa fa-user"></span>전문가 신청목록</a>
			</li>
			<li>
			  	<a href="${pageContext.request.contextPath}/"><span class="fa fa-sticky-note"></span>상품 신청목록</a>
			</li>
			<li>
			  	<a href="${pageContext.request.contextPath}/"><span class="fa fa-sticky-note"></span>상품 철회목록</a>
			</li>
		</ul>
	</sidebar>
</leftmenu>


<script>
	(function($) {
		"use strict";
		var fullHeight = function() {
			$('.js-fullheight').css('height', $(window).height());
			$(window).resize(function(){
				$('.js-fullheight').css('height', $(window).height());
			});
		};
		fullHeight();
	
		let collapse = $('#collapse').on('click', function () {
			if ($('leftmenu').hasClass('active') == false) {
				$('leftmenu').removeClass('col-lg-2').addClass('col-lg-1 active');
				$('main').removeClass('col-lg-9').addClass('col-lg-10');
			} else {
				$('leftmenu').removeClass('col-lg-1 active').addClass('col-lg-2');
				$('main').removeClass('col-lg-10').addClass('col-lg-9');
			}
		});
    	new WOW().init();

    	// Sticky Navbar
    	$(window).scroll(function () {
        	if ($(this).scrollTop() > 45) {
            	$('leftmenu').addClass('sticky ks-leftmenu-extended').removeClass('ks-leftmenu ks-lm-radius');
        	} else {
            	$('leftmenu').removeClass('sticky ks-leftmenu-extended').addClass('ks-leftmenu ks-lm-radius');
        	}
    	});
	})(jQuery);
</script>