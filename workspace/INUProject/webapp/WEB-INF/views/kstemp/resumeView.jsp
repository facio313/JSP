<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<table class="table table-bordered">
<tr>
	<th>이력서제목</th>
	<td>${resume.resumeTitle}</td>
</tr>

<tr>
	<th>이력서이름</th>
	<td>${resume.resumeName}</td>
</tr>
<tr>
	<th>이력서성별</th>
	<td>${resume.resumeGender}</td>
</tr>
<tr>
	<th>이력서기본주소</th>
	<td>${resume.resumeAddr1}</td>
</tr>
<tr>
	<th>이력서이메일</th>
	<td>${resume.resumeEmail}</td>
</tr>
<tr>
	<th>이력서전화번호</th>
	<td>${resume.resumeTel}</td>
</tr>
<tr>
	<th>작성날짜</th>
	<td>${resume.resumeInsertDate}</td>
</tr>
</table>

<!-- 학력 -->
<c:choose>
	<c:when test="${not empty resume.eduList}">
		<div class="form-group">
			<label for="job-title">학력</label>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th></th>
						<th>학교명</th>
						<th>전공분류</th>
						<th>전공</th>
						<th>입학일</th>
						<th>졸업일</th>
						<th>상태</th>
						<th>학점</th>
						<th>기준학점</th>
						<th>작성날짜</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="eduBody">
<%-- 					<c:forEach items="${resume.eduList}" var="education"> --%>
<!-- 						<tr> -->
<%-- 							<td>${education.eduName}</td> --%>
<%-- 							<td>${education.eduDepartment}</td> --%>
<%-- 							<td>${education.eduMajor}</td> --%>
<%-- 							<td>${education.eduEntered}</td> --%>
<%-- 							<td>${education.eduGraduated}</td> --%>
<%-- 							<td>${education.eduStatus}</td> --%>
<%-- 							<td>${education.eduScore}</td> --%>
<%-- 							<td>${education.eduStandard}</td> --%>
<%-- 							<td>${education.eduInsertDate}</td> --%>
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="11" id="eduFoot">
							<button type="button" class="btn btn-primary" id="eduBtn">새로 추가하기</button>
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">기존 학력 추가하기</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</c:when>
</c:choose>

<!-- 학력모달 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">기존 학력 추가하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
        	<thead>
        		<tr>
        			<th>번호</th>
        			<th>학교명</th>
        			<th>전공분류</th>
        			<th>전공</th>
        			<th>상태</th>
        			<th>학점</th>
        			<th>기준학점</th>
        			<th>체크</th>
        		</tr>
        	</thead>
        	<tbody id="eduModalBody">
        	
        	</tbody>
        </table>
      </div>
      <div id="eduModalDiv">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="">닫기</button>
        <button type="button" class="btn btn-primary" id="eduModalBtn">추가</button>
      </div>
    </div>
  </div>
</div>


<!-- 학력 관리 -->
<script>
let eduBtn = $("#eduBtn");
let eduBody = $("#eduBody");
let eduFoot = $("#eduFoot");

let makeTrTag1 = function(index, edu) {
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/education/" + edu.eduSn)
				.html(edu.eduName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(edu.eduDepartment)
				, $("<td>").html(edu.eduMajor)
				, $("<td>").html(edu.eduEntered.substr(0, 7))
				, $("<td>").html(edu.eduGraduated.substr(0, 7))
				, $("<td>").html(edu.eduStatus)
				, $("<td>").html(edu.eduScore)
				, $("<td>").html(edu.eduStandard)
				, $("<td>").html(edu.eduInsertDate)
				, $("<td>").append($("<button>").addClass("btn btn-danger").addClass("eduRemoveBtn").val(edu.eduSn).html("삭제"))
			);
}

let eduModalBody = $("#eduModalBody");

let makeModalTag1 = function(index, edu) {
	let eduIndex = "edu" + (index + 1);
	let modalATag1 =$("<a>")
				.attr("href", "${pageContext.request.contextPath}/education/" + edu.eduSn)
				.html(edu.eduName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(modalATag1)
				, $("<td>").html(edu.eduDepartment)
				, $("<td>").html(edu.eduMajor)
				, $("<td>").html(edu.eduStatus)
				, $("<td>").html(edu.eduScore)
				, $("<td>").html(edu.eduStandard)
				, $("<td>").append($("<input>").attr("type", "checkBox").attr("id", eduIndex).attr("name", "itemList.resumeItemSn").val(edu.eduSn))
			)
}

// 공통 모듈로 뺄 수 있을 듯?
let dataList = function() {
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/ajax?resumeSn=${resume.resumeSn}",
// 		url : "${pageContext.request.contextPath}/resume/${resumeSn}",
		method : "get",
		dataType : "json",
		success : function(resp) {
			eduBody.empty();
			let dataList = resp.resume.eduList;
			let trTags = [];
			if (dataList) {
				$.each(dataList, function(index, edu) {
					trTags.push(makeTrTag1(index, edu));
					$("#eduForm").remove();
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "10")
							.html("학력을 아직 등록하지 않았습니다.")
				);	
				trTags.push(tr);
			}
			eduBody.html(trTags);
			
			eduModalBody.empty();
			let eduModalList = resp.exclude.eduList;
			let trModalTags = [];
			if (eduModalList) {
				$.each(eduModalList, function(index, edu) {
					trModalTags.push(makeModalTag1(index, edu));
					$("#eduModalForm").remove();
				});
			} else {
				let eduModalTr = $("<tr>").html(
					$("<td>").attr("colspan", "7").html("이력서에 존재하지 않는 학력 항목이 없습니다.")
				);
				trModalTags.push(eduModalTr);
			}
			eduModalBody.html(trModalTags);
			$(".eduRemoveBtn").on("click", function() {
				eduRemove(this);
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

dataList();

function eduRemove(button) { // this 바꿔주기!
	console.log(button);
	let eduRemoveItem = $(button).val();
	
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/${resumeSn}/itemRemove",
		method : "post",
		data : {
			"resumeItemSn" : eduRemoveItem						
		},
		dataType : "json",
		success : function(resp) {
			dataList();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
// let eduRemoveBtn = $(".eduRemoveBtn").on("click", function() {
// 	console.log("하이");
// 	let eduRemoveItem = $(this).val();
	
// 	$.ajax({
// 		url : "${pageContext.request.contextPath}/resume/${resumeSn}/itemRemove",
// 		method : "post",
// 		data : {
// 			"resumeItemSn" : eduRemoveItem						
// 		},
// 		dataType : "json",
// 		success : function(resp) {
// 			dataList();
// 		},
// 		error : function(jqXHR, status, error) {
// 			console.log(jqXHR);
// 			console.log(status);
// 			console.log(error);
// 		}
// 	});
// });

eduBtn.on("click", function() {
	eduBody.append(
		$("<tr>").attr("id", "eduTr").append(
			$("<td>").css("width", "50")
			, $("<td>").append($("<input>").attr("name", "eduName").attr("type", "text").css("width", "140"))
			, $("<td>").append($("<input>").attr("name", "eduDepartment").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "eduMajor").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "eduEntered").attr("type", "date").css("width", "100"))
			, $("<td>").append($("<input>").attr("name", "eduGraduated").attr("type", "date").css("width", "100"))
			, $("<td>").append($("<input>").attr("name", "eduStatus").attr("type", "text").css("width", "60"))
			, $("<td>").append($("<input>").attr("name", "eduScore").attr("type", "number").attr("step", "0.01").css("width", "60"))
			, $("<td>").append($("<input>").attr("name", "eduStandard").attr("type", "number").attr("step", "0.01").css("width", "60"))
			, $("<td>").append($("<button>").attr("id", "eduSub").addClass("btn btn-primary").html("저장"))
			, $("<td>").append($("<button>").attr("id", "eduDelete").addClass("btn btn-danger").html("취소"))
		)
	)
	
	$(this).parent().hide();
	
	eduFoot.append(
		$("<form>").attr("method", "post").attr("encType", "multipart/form-data").attr("id", "eduForm").append(
			$("<input>").attr("name", "eduName").attr("type", "text")
			, $("<input>").attr("name", "eduDepartment").attr("type", "text")
			, $("<input>").attr("name", "eduMajor").attr("type", "text")
			, $("<input>").attr("name", "eduEntered").attr("type", "date")
			, $("<input>").attr("name", "eduGraduated").attr("type", "date")
			, $("<input>").attr("name", "eduStatus").attr("type", "text")
			, $("<input>").attr("name", "eduScore").attr("type", "number").attr("step", "0.01")
			, $("<input>").attr("name", "eduStandard").attr("type", "number").attr("step", "0.01")
			, $("<input>").attr("name", "memId").attr("type", "text")
		)
	)
	
	let eduForm = $("#eduForm").on("submit", function(event) {
		event.preventDefault();
		
		let method = this.method;
		let queryString = $(this).serialize();
		
		$.ajax({
// 			url : "${pageContext.request.contextPath}/resume/insert",
			method : method,
			data :queryString,
			dataType : "json",
			success : function(resp) {
				dataList();
				$("#eduBtn").parent().show();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	$("#eduSub").on("click", function() {
		$("form > input[name=eduName]").val($("td > input[name=eduName]").val());
		$("form > input[name=eduDepartment]").val($("td > input[name=eduDepartment]").val());
		$("form > input[name=eduMajor]").val($("td > input[name=eduMajor]").val());
		$("form > input[name=eduEntered]").val($("td > input[name=eduEntered]").val());
		$("form > input[name=eduGraduated]").val($("td > input[name=eduGraduated]").val());
		$("form > input[name=eduStatus]").val($("td > input[name=eduStatus]").val());
		$("form > input[name=eduScore]").val($("td > input[name=eduScore]").val());
		$("form > input[name=eduStandard]").val($("td > input[name=eduStandard]").val());
		$("form > input[name=memId]").val("${resume.memId}");
		
		eduForm.submit();
	});
	
	$("#eduDelete").on("click", function() {
		$("#eduTr").remove();
		$("#eduBtn").parent().show();
		$("#eduForm").remove();
	});
	
});

let eduModalBtn = $("#eduModalBtn").on("click", function() {
// 	let checkBox = eduModalBody.find("input[type=checkBox]:not(:checked)");
// 	for (let i = 0; i < checkBox.length; i++) {
// 		checkBox[i].remove();		
// 	}
	let checkBox = eduModalBody.find("input[type=checkBox]:checked");
	let eduModalDiv = $("#eduModalDiv");
	let eduInputTags = "";
	for (let i = 0; i < checkBox.length; i++) {
		eduInputTags += '<input name="itemList[' + i + '].resumeSn" value="${resumeSn}" />';
		eduInputTags += '<input name="itemList[' + i + '].resumeItemSn" value="' + checkBox[i].value + '" />'; 
// 		eduInputTags += '<input name="resumeSn" value="${resumeSn}" />';
// 		eduInputTags += '<input name="resumeItemSn" value="' + checkBox[i].value + '" />'; 
	}
	
	let makeEduForm = '<form:form modelAttirbute="resume" id="eduModalForm"></form:form>'
	eduModalDiv.html(makeEduForm);
	$("#eduModalForm").html(eduInputTags);
	
	let eduModalForm = $("#eduModalForm").submit(function(event) {
		event.preventDefault();
		
		let queryString = $("#eduModalForm").serialize();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/resume/${resumeSn}/item",
			method : "post",
			data : queryString,
			dataType : "json",
			success : function(resp) {
				console.log(resp);
				dataList();
				$("button[data-bs-dismiss=modal]").trigger("click");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	});
	
	eduModalForm.submit();
});

</script>

<!-- 경력 -->
<c:choose>
	<c:when test="${not empty resume.careerList}">
		<div class="form-group">
			<label for="job-title">경력</label>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>업종</th>
						<th>직장명</th>
						<th>직무</th>
						<th>직급</th>
						<th>입사일</th>
						<th>퇴사일</th>
						<th>연봉</th>
						<th>연차</th>
						<th>경력 작성날짜</th>
					</tr>
				</thead>
				<tbody id="careerBody">
					<c:forEach items="${resume.careerList}" var="career">
						<tr>
							<td>${career.careerCategory}</td>
							<td>${career.careerCompany}</td>
							<td>${career.careerTask}</td>
							<td>${career.careerClass}</td>
							<td>${career.careerJoin}</td>
							<td>${career.careerResign}</td>
							<td>${career.careerSalary}</td>
							<td>${career.careerAnnual}</td>
							<td>${career.careerInsertDate}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr colspan="9">
						<td><button id="careerBtn">+</button></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</c:when>
</c:choose>

<!-- 자격증 -->
<c:choose>
	<c:when test="${not empty resume.certList}">
		<div class="form-group">
			<label for="job-title">자격증</label>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>자격번호</th>
						<th>자격증명</th>
						<th>발급일</th>
						<th>시행부처</th>
						<th>자격증 작성날짜</th>
					</tr>
				</thead>
				<tbody id="certbody">
					<c:forEach items="${resume.certList}" var="certification">
						<tr>
							<td>${certification.certSn}</td>
							<td>${certification.memId}</td>
							<td>${certification.certNo}</td>
							<td>${certification.certName}</td>
							<td>${certification.certDate}</td>
							<td>${certification.certInstitution}</td>
							<td>${certification.certInsertDate}</td>
							<td>${certification.certDeleteDate}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr colspan="9">
						<td><button id="certBtn">+</button></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</c:when>
</c:choose>

<!-- 기능 -->
<c:choose>
	<c:when test="${not empty resume.facilityList}">
		<div class="form-group">
			<label for="job-title">기능</label>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>기능명</th>
						<th>기능종류</th>
						<th>수준</th>
						<th>취득일</th>
						<th>훈련기간</th>
						<th>기능 작성날짜</th>
					</tr>
				</thead>
				<tbody id="facBody">
					<c:forEach items="${resume.facilityList}" var="facility">
						<tr>
							<td>${facility.facilityName}</td>
							<td>${facility.facilityCategory}</td>
							<td>${facility.facilityLevel}</td>
							<td>${facility.facilityGetdate}</td>
							<td>${facility.facilityPeriod}</td>
							<td>${facility.facilityInsertDate}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr colspan="9">
						<td><button id="facBtn">+</button></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</c:when>
</c:choose>

<!-- 주요활동 -->
<c:choose>
	<c:when test="${not empty resume.activityList}">
		<div class="form-group">
			<label for="job-title">주요활동</label>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>주요활동명</th>
						<th>주요활동종류</th>
						<th>주요활동기관</th>
						<th>주요활동기간</th>
						<th>주요활동 작성날짜</th>
					</tr>
				</thead>
				<tbody id="actBody">
					<c:forEach items="${resume.activityList}" var="activity">
						<tr>
							<td>${activity.actName}</td>
							<td>${activity.actCategory}</td>
							<td>${activity.actInstitution}</td>
							<td>${activity.actPeriod}</td>
							<td>${activity.actInsertDate}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr colspan="9">
						<td><button id="actBtn">+</button></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</c:when>
</c:choose>

<!-- 교육이수 -->
<c:choose>
	<c:when test="${not empty resume.courseList}">
		<div class="form-group">
			<label for="job-title">교육이수</label>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>교육명</th>
						<th>교육종류</th>
						<th>교육기관</th>
						<th>교육기간</th>
						<th>교육이수 작성날짜</th>
					</tr>
				</thead>
				<tbody id="courseBody">
					<c:forEach items="${resume.courseList}" var="course">
						<tr>
							<td>${course.courseName}</td>
							<td>${course.courseCategory}</td>
							<td>${course.courseInstitution}</td>
							<td>${course.coursePeriod}</td>
							<td>${course.courseInsertDate}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr colspan="9">
						<td><button id="courseBtn">+</button></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</c:when>
</c:choose>

<!-- 수상내역 -->
<c:choose>
	<c:when test="${not empty resume.awardList}">
		<div class="form-group">
			<label for="job-title">수상내역</label>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>수상대회명</th>
						<th>수상명</th>
						<th>수상대회종류</th>
						<th>수상날짜</th>
						<th>수상기관</th>
						<th>수상내역 작성날짜</th>
					</tr>
				</thead>
				<tbody id="awardbody">
					<c:forEach items="${resume.awardList}" var="award">
						<tr>
							<td>${award.awardCompetition}</td>
							<td>${award.awardName}</td>
							<td>${award.awardCategory}</td>
							<td>${award.awardDate}</td>
							<td>${award.awardInstitution}</td>
							<td>${award.awardInsertDate}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr colspan="9">
						<td><button id="awardBtn">+</button></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</c:when>
</c:choose>



<a href="${pageContext.request.contextPath}/resume"><button class="btn btn-primary">목록</button></a>
<a href="${pageContext.request.contextPath}/resume/update?actSn=${resume.resumeSn}"><button class="btn btn-secondary">수정하기</button></a>
<form:form modelAttribute="resume" action="${pageContext.request.contextPath}/resume/delete" method="post" style="display: inline-block;">
	<input name="resumeSn" value="${resume.resumeSn}" hidden/>
	<button type="submit" class="btn btn-danger">삭제하기</button>
</form:form>