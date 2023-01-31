<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="8kb"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
		<meta name="generator" content="Hugo 0.88.1">
		<meta name="theme-color" content="#7952b3">

		<title>INU : Thank You Very Match!</title>

		<tiles:insertAttribute  name="preScript"/>
		

		
		
		<c:if test="${not empty message }">
			<script>
				alert("${message}");
			</script>
		</c:if>
		
		<style>
			body {
				background-image: url("<%=request.getContextPath()%>/resources/background/1.jpg");
 				background-size: cover;
			}
			.bd-placeholder-img {
				font-size: 1.125rem;
				text-anchor: middle;
				-webkit-user-select: none;
				-moz-user-select: none;
				user-select: none;
			}
			
			@media ( min-width : 768px) {
				.bd-placeholder-img-lg {
					font-size: 3.5rem;
				}
			}
		</style>
		
		<!-- Custom styles for this template -->
		<link href="<%=request.getContextPath()%>/resources/css/dashboard.css" rel="stylesheet">
		
	</head>
	<body class="d-flex flex-column vh-100">
		<tiles:insertAttribute  name="headerMenu"/>
	
		<div class="container-fluid">
			<div class="row">
				<tiles:insertAttribute name="leftMenu"/>
				<main class="col-md-7 ms-sm-auto col-lg-10 px-md-4">
					<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<!-- Main Content Area start -->
						
					<tiles:insertAttribute  name="content"/>
						
					<!-- Main Content Area end -->
					</div>
				</main>
			</div>
		</div>
	
		<footer class="footer mt-auto py-3 bg-dark col-md-9 ms-sm-auto col-lg-10">
			<tiles:insertAttribute  name="footer"/>
		</footer>
		
		<tiles:insertAttribute  name="postScript"/>
	</body>
</html>
