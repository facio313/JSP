<%--
* [[개정이력(Modification Information)]]
* 수정일             수정자            수정내용
* ----------  ---------  -----------------
* 2023. 2. 20.      최경수            최초작성
* 2023. 2. 22.      최경수            틀 잡기
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link href="<%=request.getContextPath()%>/resources/cks/processView.css" rel="stylesheet"/>

<div style="margin-top: 70px; padding-left: 50px; padding-right: 50px;">
	<ul class="responsive-table" style="margin-bottom: 100px; padding-left: 50px; padding-right: 50px;">
	  <li class="table-header">
	    <div class="col col-5">${anno.annoTitle}</div>
	  </li>
	  <li class="table-row">
	    <div class="col col-9">
	    	<table class="table table-border">
				<tr>
					<th>법인명</th>
					<td colspan="2">${anno.company.cmpName}</td>
					<th>회사대표자성명</th>
					<td colspan="2">${anno.company.cmpRepName}</td>
					<th>회사주요사업명</th>
					<td colspan="2">${anno.company.cmpMbName}</td>
				</tr>
				<tr>
					<th>근무환경</th>
					<td colspan="2">${anno.annoWorkenv}</td>
					<th>수습기간</th>
					<td colspan="2">${anno.annoProbation}</td>
					<th>연봉급여</th>
					<td colspan="2">${anno.annoSalary}</td>
				</tr>
				<tr>
					<th>공고시작날짜</th>
					<td colspan="2">${anno.annoStartdate}</td>
					<th>공고종료날짜</th>
					<td colspan="2">${anno.annoEnddate}</td>
					<th>기본주소</th>
					<td colspan="2">${anno.company.cmpAddr1} ${anno.company.cmpAddr2}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="8">${anno.annoContent}</td>
				</tr>
	    	</table>
	    </div>
   	    <div>
	    	<img src="${pageContext.request.contextPath}/resources/images/hero_1.jpg" style="width:100%; height: 100%;"/>
	    </div>
	  </li>
	</ul>
</div>

<ul class="responsive-table" style="margin-bottom: 100px; padding-left: 50px; padding-right: 50px;">
  <li class="table-header" style="width: 50%; height: 60px; padding: 10px; font-weight: 600; font-size: 25px;">
    <div>진행 현황 모아보기</div>
  </li>
  <li class="table-row">
  
	<div style="margin-top: 70px; padding-left: 50px; padding-right: 50px; width: 100%; height: 200px; box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);">
		<c:set var="detail" value="${anno.detailList[0]}"/>
		<div style="position: relative; width: 94%; height: 50%; padding: 50px; margin: auto;">
			<div class="pline-container">
			  	<div class="pline">
			    	<div class="percent"></div>
			  	</div>
			  	<div class="steps">
			  		<c:forEach items="${detail.processList}" var="process" varStatus="status">
			  			<c:set var="start" value="${fn:substring(process.processStartDate, 0, 10)}"/>
			  			<c:set var="sd" value="${fn:replace(start, '-', '')}"/>
			  			<c:set var="end" value="${fn:substring(process.processEndDate, 0, 10)}"/>
			  			<c:set var="ed" value="${fn:replace(end, '-', '')}"/>
			    		<div class="step <c:if test="${sd le now and now le ed or ed lt now}">selected</c:if> <c:if test="${ed lt now }">completed</c:if>" id="${status.index}"></div>
			    	</c:forEach>
			  	</div>
		  	</div>						  	
		  	
		  	<div class="process-container">
				<c:forEach items="${detail.processList}" var="process" >
			  		<div class="process">
			  			<h5>${process.processCodeName}</h5>
			  			<h6 style="font-size: 10px;">${process.processStartDate}</h6>
			  			<h6 style="font-size: 10px;">${process.processEndDate}</h6>
			  		</div>
				</c:forEach>
		  	</div>
		</div>
	</div>

  </li>
</ul>


<script>
	$('th').css({"color":"white", "background-color":"#95A5A6"});
</script>

<script>
$(".step").on("click", function(event){
	let steps = $(this);
	let last = $(".steps").find("div:last-child").attr("id");
	let howMuch = 100 / last;
	
	
	let id = $(this).attr("id");
// 	let percent = $(".percent");
	let percent = $(event.target).parents(".pline-container").children(".pline").children(".percent");
	let thisMuch = howMuch * id;
	
	//초기화
	for (let i = 0; i < steps.length; i++) {
		$("#" + i).removeClass("selected").removeClass("completed");
		percent.css("width", thisMuch + "%");
	}
	
	//다시
	for (let i = 0; i < steps.length; i++) {
		$("#" + i).addClass("selected").addClass("completed");
		if (id == i) {
			return;
		}
	}
	
	percent.css("width", thisMuch+"%");	
});


let stepss = $(".steps");
for (let i = 0; i < stepss.length; i++) {
	let lastOne = $(stepss[i]).find("div:last-child").attr("id");
	let howMuchIs = 100 / lastOne;
	let nowProcess = $(stepss[i]).children(".step").filter(".completed").next(".selected").not(".completed");
	let percentLine = $(stepss[i]).parent(".pline-container").children(".pline").children(".percent");
	percentLine.css("width", (howMuchIs * nowProcess.attr("id")) + "%");
}
</script>













<!-- <ul class="responsive-table" style="margin-bottom: 100px; padding-left: 50px; padding-right: 50px;"> -->
<!--   <li class="table-header" style="width: 50%; height: 60px; padding: 10px; font-weight: 600; font-size: 25px;"> -->
<!--     <div>진행 현황 모아보기</div> -->
<!--   </li> -->
<!--   <li class="table-row"> -->
  
<!-- 	<div style="margin-top: 70px; padding-left: 50px; padding-right: 50px; width: 100%; height: 200px; box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);"> -->
<%-- 		<c:set var="detail" value="${anno.detailList[0]}"/> --%>
<!-- 		<div style="position: relative; width: 94%; height: 50%; padding: 50px; margin: auto;"> -->
<!-- 			<div class="pline-container"> -->
<!-- 			  	<div class="pline"> -->
<!-- 			    	<div class="percent"></div> -->
<!-- 			  	</div> -->
<!-- 			  	<div class="steps"> -->
<%-- 			  		<c:forEach items="${detail.processList}" var="process" varStatus="status"> --%>
<%-- 			  			<c:set var="start" value="${fn:substring(process.processStartDate, 0, 10)}"/> --%>
<%-- 			  			<c:set var="sd" value="${fn:replace(start, '-', '')}"/> --%>
<%-- 			  			<c:set var="end" value="${fn:substring(process.processEndDate, 0, 10)}"/> --%>
<%-- 			  			<c:set var="ed" value="${fn:replace(end, '-', '')}"/> --%>
<%-- 			    		<div class="step <c:if test="${sd le now and now le ed or ed lt now}">selected</c:if> <c:if test="${ed lt now }">completed</c:if>" id="${status.index}"></div> --%>
<%-- 			    	</c:forEach> --%>
<!-- 			  	</div> -->
<!-- 		  	</div>						  	 -->
		  	
<!-- 		  	<div class="process-container"> -->
<%-- 				<c:forEach items="${detail.processList}" var="process" > --%>
<!-- 			  		<div class="process"> -->
<%-- 			  			<h5>${process.processCodeName}</h5> --%>
<%-- 			  			<h6 style="font-size: 10px;">${process.processStartDate}</h6> --%>
<%-- 			  			<h6 style="font-size: 10px;">${process.processEndDate}</h6> --%>
<!-- 			  		</div> -->
<%-- 				</c:forEach> --%>
<!-- 		  	</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!--   </li> -->
<!-- </ul> -->