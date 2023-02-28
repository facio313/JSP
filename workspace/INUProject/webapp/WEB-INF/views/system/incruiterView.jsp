<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/help.css">

<style>
.qna_write_wrap .qna_write_selection {padding: 0 0 22px;}
.help_find .type2 .inp_find {width: 708px;}
.help_find li.col_type .inp_find {width: 254px;}
.help_find .type2 .wrap_input {width: 750px;}
.btn_basic2.type03 {border: 1px solid #8f8f8f;color: #fff;background-color: #9c9c9c;}
.btn_basic2 {display: inline-block;height: 40px;font-size: 15px;line-height: normal;vertical-align: top;}
.q_num {display: block;padding-bottom: 15px;color: #045738;font-size: 26px;font-weight: bold;letter-spacing: 0;line-height: 18px;}
.form-group {margin-bottom: 3rem;margin-top: -15px;}
#qna {height: 40px;width: 40px;border-radius: 50px;margin: auto;display: block;margin-top: 20px;}
.help_find .cont_find {
	border : 1px solid #eaedf4;
	border-radius: 12px;
}
.help_find li.col_type .wrap_lab:first-child {
     width: 200px;
}
.help_find li.col_type .wrap_lab {
     width: 200px; 
}
.help_find li.col_type .wrap_input {
     width: 488px; 
}
.help_find .type2 .wrap_lab {
     width: 200px; 
}
.help_find .type2 .wrap_input {
     width: 1100px;
}

.pf {
 	font-size: 24px; 
}

.help_find .lab_find {
/* 	font-size: 20px; */
}
.help_find .inp_find {
/* 	font-size: 20px; */
}
.help_find .wrap_lab {
    padding: 26px 0 0 20px;
}
</style>






<section class="site-section">

	<div class="container" >
		<div class="row mb-5">
			<div class="col-lg-12">

				<div class="help_find help_contact wrap_help">
					<div class="cont_find">
						<form:form modelAttribute="incruiter" name="acc" action='${pageContext.request.contextPath }/systemManagement/acceptManagement/updateAcceptInc' method="post">
							<div class="qna_write_wrap">
								<div class="qna_write_selection">
									<span class="qna_category_tit" style="font-size: 40px;">총괄 신청서</span>
									<input type="hidden" name="cmpId" value="${incruiter.companyVO.cmpId }"/>
									<input type="hidden" id="memEmail" value="${incruiter.incruiterVO.memEmail }"/>
								</div>
							</div>
							<hr style="background-color: #5c667b; height: 2px;">
							<fieldset>
								<legend class="blind">제휴문의 입력 폼</legend>
								<p class="pf">신청자</p>
								<ul class="list_find type2">
									<li class="col_type">
										<div class="wrap_lab">
											<label for="subTitle" class="lab_find">아이디</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.memId }</span>
											</span>
										</div>
										<div class="wrap_lab">
											<label for="department" class="lab_find">신청일자</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.incruiterVO.memDate }</span>
											</span>
										</div>
									</li>
									<li class="col_type">
										<div class="wrap_lab">
											<label for="subTitle" class="lab_find">성명</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.memName }</span>
											</span>
										</div>
										<div class="wrap_lab">
											<label for="department" class="lab_find">부서</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">인사계</span>
											</span>
										</div>
									</li>

									<li class="col_type">
										<div class="wrap_lab">
											<label for="incumName" class="lab_find">이메일</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.incruiterVO.memEmail }</span>
											</span>
										</div>
										<div class="wrap_lab">
											<label for="cmdName" class="lab_find">연락처</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.incruiterVO.memTel }</span>
											</span>
										</div>
									</li>
								</ul>
								<br>
								<p class="pf">회사 정보</p>
								<ul class="list_find type2">
									<li class="col_type">
										<div class="wrap_lab">
											<label for="incumTitle" class="lab_find">회사명</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpName }</span>
											</span>
										</div>
										<div class="wrap_lab">
											<label for="incumTitle" class="lab_find">법인등록번호</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpNo }</span>
											</span>
										</div>
									</li>
									<li class="col_type">
										<div class="wrap_lab">
											<label for="incumTitle" class="lab_find">대표자</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpRepName }</span>
											</span>
										</div>
										<div class="wrap_lab">
											<label for="incumTitle" class="lab_find">사업자등록번호</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpBsnsNo }</span>
											</span>
										</div>
									</li>
									<li class="col_type">
										<div class="wrap_lab">
											<label for="incumTitle" class="lab_find">설립일자</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpEstblDate }</span>
											</span>
										</div>
										<div class="wrap_lab">
											<label for="incumTitle" class="lab_find">종업원 수</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpEmpNo }</span>
											</span>
										</div>
									</li>

									<li>
										<div class="wrap_lab">
											<label for="topTitle" class="lab_find">회사기본주소</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpAddr1 }</span>
											</span>
										</div>
									</li>
									<li>
										<div class="wrap_lab">
											<label for="topTitle" class="lab_find">회사상세주소</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpAddr2 }</span>
											</span>
										</div>
									</li>
									
									<li class="col_type">
										<div class="wrap_lab">
											<label for="topTitle" class="lab_find">회사우편번호</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpZip }</span>
											</span>
										</div>
										<div class="wrap_lab">
											<label for="topTitle" class="lab_find">회사전화번호</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpPhone }</span>
											</span>
										</div>
									</li>
									<li class="col_type">
										<div class="wrap_lab">
											<label for="topTitle" class="lab_find">회사이메일</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpEmail }</span>
											</span>
										</div>
										<div class="wrap_lab">
											<label for="topTitle" class="lab_find">홈페이지</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpUrl }</span>
											</span>
										</div>
									</li>
									<li class="col_type">
										<div class="wrap_lab">
											<label for="topTitle" class="lab_find">회사형태</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpSmenp }</span>
											</span>
										</div>
										<div class="wrap_lab">
											<label for="topTitle" class="lab_find">주요사업</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpMbName }</span>
											</span>
										</div>
									</li>

									<li>
										<div class="wrap_lab">
											<label for="topTitle" class="lab_find">회사소개</label>
										</div>
										<div class="wrap_input">
											<span>
												<span class="inp_find">${incruiter.companyVO.cmpContent }</span>
											</span>
										</div>
									</li>


									<li>
										<div class="wrap_lab" style="width: 150px;">
											<label for="help_upload" class="lab_find">첨부파일</label>
										</div>
										<div class="wrap_input">
											<div class="wrap_file">
												업로드된 파일 띄우기
											</div>
										</div>
									</li>
								</ul>

								<div class="row align-items-center mb-5">
									<div class="col-lg-4 ml-auto">
										<div class="row">
											<div class="col-4">
												<input type="button" class="btn btn-block btn-primary btn-md" id="acceptBtn" value="승인" />
											</div>
											<div class="col-4">
												<input type="button" class="btn btn-block btn-primary btn-md" id="mail-Check-Btn"  value="반려" />
											</div>
											<div class="col-4">
												<input type="button" 
													onclick="location.href='<c:url value="/systemManagement/acceptManagement/appliIncruiterList"/>'" 
													class="btn btn-block btn-primary btn-md" id="mail-Check-Btn"
													value="목록으로" />
											</div>
										</div>
									</div>
								</div>
							</fieldset>
						</form:form>
						<form:form action="${pageContext.request.contextPath }/systemManagement/deleteAppli" name="frm" method="post">
							<input type="hidden" name="memId" value="${incruiter.memId }"/>
							<input type="hidden" name="cmpId" value="${incruiter.companyVO.cmpId }"/>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

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
</script>


















