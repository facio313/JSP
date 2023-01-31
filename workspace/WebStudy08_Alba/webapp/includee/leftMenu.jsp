<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>    

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

  <nav id="sidebarMenu" class="col-md-2 col-lg-2 d-md-block bg-transparentt sidebar collapse">
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