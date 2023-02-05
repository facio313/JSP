<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>    
  <nav id="sidebarMenu" class="col-md-2 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="sidebar-sticky pt-3">
        <ul class="nav flex-column">     
        	<c:forEach items="${menuList }" var="menu">
        		<security:authorize url="${menu.menuURL }">
					<li class="nav-item">
						<a class="nav-link active" href="<c:url value='${menu.menuURL }'/>">${menu.menuText }</a>
					</li>
				</security:authorize>
        	</c:forEach> 
        </ul>
      </div>
    </nav>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

		<script src="${pageContext.request.contextPath}/resources/leftMenu/lib/wow/wow.min.js"></script>
		<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/leftMenu/css/style.css">
		
<leftmenu class="col-md-2 sidebar ks-leftmenu ks-lm-radius">
	<h1 style="text-align:right;"><i id="collapse" class="fa fa-bars"></i></h1>
	<sidebar>
		<h1 class="text-center"><a href="${pageContext.request.contextPath}/" class="logo">INU</a></h1>
		<ul class="list-unstyled components mb-5 text-left">
      		<c:forEach items="${menuList }" var="menu">
        		<security:authorize url="${menu.menuURL }">
					<li class="nav-item">
						<a class="nav-link active" href="<c:url value='${menu.menuURL }'/>">${menu.menuText }</a>
					</li>
				</security:authorize>
        	</c:forEach> 
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
			$('leftmenu').removeClass('col-md-2').addClass('col-md-1 active');
			$('main').removeClass('col-md-9').addClass('col-md-11');
		} else {
			$('leftmenu').removeClass('col-md-1 active').addClass('col-md-2');
			$('main').removeClass('col-md-11').addClass('col-md-9');
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
>>>>>>> refs/remotes/origin/main
