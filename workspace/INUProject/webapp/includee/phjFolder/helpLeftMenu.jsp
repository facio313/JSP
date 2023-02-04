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
		<h1 class="text-center"><a href="${pageContext.request.contextPath }/help/helpList" class="logo">고객센터</a></h1>
		<ul class="list-unstyled components mb-5 text-left">
			<li class="active">
				<a href="${pageContext.request.contextPath}/"><span class="fa fa-home"></span>홈</a>
			</li>
			<li>
			    <a href="${pageContext.request.contextPath}/help/helpList"><span class="fa fa-user"></span>도움말</a>
			</li>
			<li>
			  	<a href="${pageContext.request.contextPath}/help/noticeList"><span class="fa fa-sticky-note"></span>공지사항</a>
			</li>
			<li>
			  	<a href="${pageContext.request.contextPath}/ask"><span class="fa fa-cogs"></span>문의하기</a>
			</li>
			<li>
			  	<a href="${pageContext.request.contextPath}/ask/askList"><span class="fa fa-paper-plane"></span>내문의목록</a>
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