<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

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
			<li class="nav-item"><a class="nav-link active" href="#">메뉴1</a></li>
			<li class="nav-item"><a class="nav-link active" href="#">메뉴2</a></li>
			<li class="nav-item"><a class="nav-link active" href="#">메뉴3</a></li>
			<li class="nav-item"><a class="nav-link active" href="#">메뉴4</a></li>
			<li class="nav-item"><a class="nav-link active" href="#">메뉴5</a></li>
        </ul>
      </div>
    </nav>