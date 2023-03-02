<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">

<style>
.pf {
 	font-size: 24px; 
}
.radiuss{
	border : 1px solid #eaedf4;
	border-radius: 12px;
	padding: 80px 99px 100px 99px;
}
.table1 {
  	width: 100%;
  	height: 180px;
 	border-top: 1px solid #eaedf4;
  	border-collapse: collapse;
}
.table2 {
  	width: 100%;
  	height: 600px;
 	border-top: 1px solid #eaedf4;
  	border-collapse: collapse;
}
th{
	background: #f7f7f7;
	border-bottom: 1px solid #eaedf4;
  	padding: 10px;
  	width: 155px;
} 
td {
  	border-bottom: 1px solid #eaedf4;
  	padding: 20px;
}
</style>


<section class="site-section">
	<div class="container" >
		<div class="radiuss">
			<form:form modelAttribute="incruiter" name="acc" action='${pageContext.request.contextPath }/systemManagement/acceptManagement/updateAcceptInc' method="post">
				<div style="display: flex; letter-spacing: -2px; line-height: 24px; align-items: center;">
					<span style="font-size: 40px;">총괄 신청</span>
					<input type="hidden" name="cmpId" value="${incruiter.companyVO.cmpId }"/>
					<input type="hidden" id="memEmail" value="${incruiter.incruiterVO.memEmail }"/>
				</div>
				<hr style="background-color: #5c667b; height: 2px;">
				<p class="pf">신청자</p>
				<table class="table1">
					<tr>
				    	<th scope="row">아이디</th>
				    	<td style="width:425.81px">${incruiter.memId }</td>
				    	<th scope="row">신청일자</th>
				    	<td>${incruiter.incruiterVO.memDate }</td>
				  	</tr>
				  	<tr>
				    	<th scope="row">성명</th>
				    	<td>${incruiter.memName }</td>
				    	<th scope="row">부서</th>
				    	<td>인사계</td>
				  	</tr>
				  	<tr>
					    <th scope="row">이메일</th>
					    <td>${incruiter.incruiterVO.memEmail }</td>
					    <th scope="row">연락처</th>
					    <td>${incruiter.incruiterVO.memTel }</td>
				  	</tr>
		  		</table>
			  	<br>
			  	<p class="pf">회사 정보</p>
				<table class="table2">
				  	<tr>
					    <th scope="row">회사명</th>
					    <td>${incruiter.companyVO.cmpName }</td>
					    <th scope="row">법인등록번호</th>
					    <td>${incruiter.companyVO.cmpNo }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">대표자</th>
					    <td>${incruiter.companyVO.cmpRepName }</td>
					    <th scope="row">사업자등록번호</th>
					    <td>${incruiter.companyVO.cmpBsnsNo }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">설립일자</th>
					    <td>${incruiter.companyVO.cmpEstblDate }</td>
					    <th scope="row">종업원 수</th>
					    <td>${incruiter.companyVO.cmpEmpNo }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">회사 기본주소</th>
					    <td colspan="3">${incruiter.companyVO.cmpAddr1 }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">회사 상세주소</th>
					    <td colspan="3">${incruiter.companyVO.cmpAddr2 }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">회사우편번호</th>
					    <td>${incruiter.companyVO.cmpZip }</td>
					    <th scope="row">회사전화번호</th>
					    <td>${incruiter.companyVO.cmpPhone }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">회사이메일</th>
					    <td>${incruiter.companyVO.cmpEmail }</td>
					    <th scope="row">홈페이지</th>
					    <td>${incruiter.companyVO.cmpUrl }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">회사형태</th>
					    <td>${incruiter.companyVO.cmpSmenp }</td>
					    <th scope="row">주요사업</th>
					    <td>${incruiter.companyVO.cmpMbName }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">회사소개</th>
					    <td colspan="3">${incruiter.companyVO.cmpContent }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">첨부파일</th>
					    <td colspan="3"><a href="${pageContext.request.contextPath}/컨트롤러?fileName=${incruiter.fileName}">${incruiter.fileName}</a></td>
				  	</tr>
				</table>
				<div class="row align-items-center mb-5">
					<div class="col-lg-4 ml-auto">
						<div class="row">
							<div class="col-4" style="padding: 10px 3px 10px 3px;">
								<input type="button" class="btn btn-block btn-primary btn-md" id="acceptBtn" value="승인" />
							</div>
							<div class="col-4" style="padding: 10px 3px 10px 3px;">
								<input type="button" class="btn btn-block btn-primary btn-md" id="mail-Check-Btn"  value="반려" />
							</div>
							<div class="col-4" style="padding: 10px 3px 10px 3px;">
								<input type="button" 
									onclick="location.href='<c:url value="/systemManagement/acceptManagement/appliIncruiterList"/>'" 
									class="btn btn-block btn-primary btn-md" id="mail-Check-Btn"
									value="목록으로" />
							</div>
						</div>
					</div>
				</div>
			</form:form>
			<form:form action="${pageContext.request.contextPath }/systemManagement/deleteAppli" name="frm" method="post">
				<input type="hidden" name="memId" value="${incruiter.memId }"/>
				<input type="hidden" name="cmpId" value="${incruiter.companyVO.cmpId }"/>
			</form:form>
		</div>
	</div>
</section>

<div class="col-6">
	<select id="singleSel" class="form-select">
	  	<option selected value>파일선택</option>
	 	<c:forEach items="${files }" var="filename">	<!-- 파일리스트 -->
	 		<option>${filename }</option>
	 	</c:forEach>
	</select>
</div>
<div class="col-2">
	<a class="btn btn-primary downloadBtn" href="<c:url value='/systemManagement/single'/>">single download</a>
</div>


<script>
	$('#mail-Check-Btn').click(function(){
		const email = $('#memEmail').val();
		console.log('완성된 이메일 : ' + email);
		var flag = confirm("한번 반려된 데이터는 복구불가합니다.\n반려하시겠습니까?") 
		if(!flag){
			return;
		}
		$.ajax({
			type : 'get',
			url : '<c:url value="/returnMail?email="/>'+email,
			success : function(data){
				console.log("data : " + data);
				alert('성공적으로 반려되었습니다.');
				document.frm.submit(); //전자정부에서 많이씀
			}
		});
	});
	
	$('#acceptBtn').click(function(){
		const email = $('#memEmail').val();
		console.log('완성된 이메일 : ' + email);
		var flag = confirm("승인하시겠습니까?") 
		if(!flag){
			return;
		}
		$.ajax({
			type : 'get',
			url : '<c:url value="/acceptMail?email="/>'+email,
			success : function(data){
				console.log("data : " + data);
				alert('성공적으로 승인되었습니다.');
				document.acc.submit(); //전자정부에서 많이씀
			}
		});
	});
	
	
	$(".downloadBtn").on("click", function(event){	//버튼 클릭시
		// this : a tag (HTMLAnchorElement)
		
		event.preventDefault();
		
		singleFileDownload.call(this); //싱글다운 함수 실행
		
		return false;
	});

	function singleFileDownload(){	//싱글 다운 합수 
		// this(click event target) : a tag (HTMLAnchorElement)
		
		let file = $('#singleSel').val();	//data-target의 값 , ?는 해당값이 존재하는지 확인
		if(! file.length ) return;
		
		let href = this.href;	
		console.log(href);
		let hiddenA = document.createElement("a");
		console.log(hiddenA);
		hiddenA.href = `${href}?what=${file}`;
		hiddenA.click();
		hiddenA.remove();
	} 
	
</script>


















