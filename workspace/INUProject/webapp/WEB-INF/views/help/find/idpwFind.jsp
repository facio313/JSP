<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Custom styles for this template -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom-bs.css">

<style>
body {
    background-color:rgb(234, 237, 242);
}
h1{
	font-size: 32px;
	font-weight: bold;
	letter-spacing: -2px;
	line-height: 38px;
}

.ipBtn{
    width: 250px;
    height: 70px;
    font-size: 20px;
    font-weight: 1000;
}
}
</style>


<div id="" style="display:flex; justify-content : center;">
	<div id="" style="width:1250px;">
		<div class="" style="padding: 0 0 50px; border-bottom: 1px solid black; margin-top: 36px;">
			<h1>아이디/비밀번호 찾기</h1>
		</div>
		<!-- help_find -->
		<div class="">
			<div class="">
				<p style="padding: 25px 0px 0px 15px;">가입한 아이디와 비밀번호를 잊으셨습니까?
				</p>
			</div>
               	<div>
                   	<div class="row">
                       	<div class="col-lg-6 mb-5">
                       		<div class="p-4 border rounded" style="height: 210px">
                           		<h2 class="mb-5" style="text-align: center;">일반회원</h2>
	                           	<div class="row form-group" style="text-align: center;">
		                           	<div class="col-md-12">
		                               	<input type="button" value="아이디 찾기" onclick="location.href='<c:url value = "/help/find/seekerFindId"/>'" class="btn px-5 btn-primary text-white ipBtn" style="margin: 0px 20px 0px 0px;">
		                               	<input type="button" value="비밀번호 찾기" onclick="location.href='<c:url value = "/help/find/seekerFindPw"/>'" class="btn px-5 btn-primary text-white ipBtn">
		                           	</div>
	                           	</div>
                           	</div>
                       	</div>
                       	<div class="col-lg-6">
                       		<div class="p-4 border rounded" style="height: 210px">
                           		<h2 class="mb-5" style="text-align: center;">기업회원</h2>
               
                           		<div class="row form-group" style="text-align: center;">
                           			<div class="col-md-12">
                               			<input type="submit" value="아이디 찾기" onclick="location.href='<c:url value = "/help/find/incruiterFindId"/>'" class="btn px-5 btn-primary text-white ipBtn" style="margin: 0px 20px 0px 0px;">
                               			<input type="submit" value="비밀번호 찾기" onclick="location.href='<c:url value = "/help/find/incruiterFindPw"/>'" class="btn px-5 btn-primary text-white ipBtn">
                           			</div>
                           		</div>
                       		</div>
                       	</div>
               		</div>
              		</div>
			<div style="margin: 3rem 0px 10rem 0px;">
				<a href="<c:url value='/login'/>" class="" title="로그인 바로가기">로그인</a>
				|
				<a href="<c:url value='/join/seeker'/>" class="" title="회원가입 바로가기">회원가입</a>
				|
				<a href="<c:url value='/help'/>" class="" title="자주 묻는 질문 바로가기">자주 묻는 질문</a>
				<p>위 방법으로 계정을 찾을수 없다면, 고객센터로 직접 <a href="<c:url value='/ask'/>">문의</a> 주시기 바랍니다.</p>
			</div>
		</div>
	</div>
</div>
