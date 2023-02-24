<%--
* [[개정이력(Modification Information)]]
* 수정일             수정자            수정내용
* ----------  ---------  -----------------
* 2023. 2. 20.      최경수            최초작성
* 2023. 2. 22.      최경수            틀 잡기
* 2023. 2. 23.      최경수            내용 채우기
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link href="<%=request.getContextPath()%>/resources/cks/processView.css" rel="stylesheet"/>

<!-- pageContext에 있을 것 같은데!!!!!! -->
<input id="daNo" type="text" value="${anno.detailList[0].daNo}" hidden>

<div style="margin-top: 70px; padding-left: 50px; padding-right: 50px;">
	<ul class="responsive-table" style="margin-bottom: 50px; padding-left: 50px; padding-right: 50px;">
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

<c:set var="detail" value="${anno.detailList[0]}"/>

<ul class="responsive-table" style="margin-bottom: 100px; padding-left: 50px; padding-right: 50px;">
<!--   <li class="table-header" style="top:50%; left: 50%; width: 50%; height: 60px; padding: 10px; font-weight: 600; font-size: 25px;"> -->
<!--     <div>진행 현황 모아보기</div> -->
<!--   </li> -->
  <li class="table-row" style="height: 35vh; padding: 0px; box-shadow: 0 0 0 0;">
	<div style="padding-left: 50px; padding-right: 50px; width: 100%; height: 100px;">
		<div style="position: relative; width: 88%; height: 50%; padding: 50px; margin: auto;">
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
		</div>
	  	<div class="card-container">
			<div class="card-contain">
			
				<c:forEach items="${detail.processList}" var="process" varStatus="status">
					<c:set var="start" value="${fn:substring(process.processStartDate, 0, 10)}"/>
		  			<c:set var="sd" value="${fn:replace(start, '-', '')}"/>
		  			<c:set var="end" value="${fn:substring(process.processEndDate, 0, 10)}"/>
		  			<c:set var="ed" value="${fn:replace(end, '-', '')}"/>
					<span class="data-card <c:if test="${sd le now and now le ed}">hovered</c:if>" id="show${status.count}">
						<h3>${process.processCodeName}</h3>
						<h4 style="margin-top: 10px; margin-bottom: 0px;">${fn:substring(process.processStartDate, 0, 10)}</h4>
						<h4>${fn:substring(process.processEndDate, 0, 10)}</h4>
						<p>여기 적을 만한 게 뭐가 있지</p>
						<span class="link-text">내용 보기</span>
					</span>	
				</c:forEach>
			</div>
	  	</div>
	</div>
  </li>
</ul>

<ul class="responsive-table" style="margin-bottom: 100px; padding-left: 50px; padding-right: 50px; width: 100%;">
	<li class="table-row" style="height: 100%; padding: 0px; box-shadow: 0 0 0 0; width: 100%;">
		<div id="disp" style="width: 100%;">
			<c:forEach items="${detail.processList}" var="process" varStatus="status">
				<c:set var="start" value="${fn:substring(process.processStartDate, 0, 10)}"/>
	  			<c:set var="sd" value="${fn:replace(start, '-', '')}"/>
	  			<c:set var="end" value="${fn:substring(process.processEndDate, 0, 10)}"/>
	  			<c:set var="ed" value="${fn:replace(end, '-', '')}"/>
				<div id="disp${status.count }" style="display: <c:choose><c:when test="${sd le now and now le ed}"></c:when><c:otherwise>none</c:otherwise></c:choose>; width: 100%;">
 					<ul id="${process.processCodeId}" class="responsive-table itemUl" style="margin-bottom: 100px; padding-left: 50px; width: 100%;">
					<!-- ajax -->
					</ul>
				</div>
			</c:forEach>
		</div>
	</li>
</ul>

<!-- 모달 추가하기 -->
<div class="modal fade" id="itemModal" tabindex="-1" aria-labelledby="itemModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="itemModalLabel">기존 항목 추가하기</h1>
      </div>
      <div class="modal-body">
      
        <table class="table table-bordered">
        	<thead>
        		<tr style="text-align: center;">
        			<th></th>
        			<th>항목명</th>
        			<th>상세</th>
        			<th>기준점수</th>
        			<th></th>
        		</tr>
        	</thead>
        	<tbody id="itemModalBody">
        	<!-- ajax -->
        	</tbody>
        </table>
      </div>
      <div id="itemModalDiv">
      <!-- ajax -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="itemModalBtn" style="width: 30%;">저장</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 30%;">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 모달 추가하기 -->

<script>
const daNo = $("#daNo").val();

/* 채용과정 선형 진행도 최신화 */
let stepss = $(".steps");
for (let i = 0; i < stepss.length; i++) {
	let lastOne = $(stepss[i]).find("div:last-child").attr("id");
	let howMuchIs = 100 / lastOne;
	let nowProcess = $(stepss[i]).children(".step").filter(".completed").next(".selected").not(".completed");
	let percentLine = $(stepss[i]).parent(".pline-container").children(".pline").children(".percent");
	percentLine.css("width", (howMuchIs * nowProcess.attr("id")) + "%");
}

let originAdd = $(".originAdd");
let itemUl = $(".itemUl");
let header = $(".header:first");
let footer = $(".footer:first");
let itemModalBody = $("#itemModalBody");

/* 항목 목록에 들어가는 항목 만드는 태그 */
let makeLiTag = function(index, item) {
	return $("<li>").addClass("table-row").css({"height":"100%", "padding":"0px", "width":"100%", "padding-top":"10px", "padding-bottom":"10px", "padding-left":"50px"}).append(
				$("<table>").css("width", "100%").append(
					$("<tr>").append(
						$("<td>").addClass("col-1").html(index + 1)
						, $("<td>").addClass("col-2 itemCodeName").html(item.itemCodeName)
						, $("<td>").addClass("col-7 itemAsk").html(item.itemAsk)
						, $("<td>").addClass("col-1").html("기준점수")
						, $("<td>").addClass("col-1 itemBtn").append(
							$("<button>").addClass("btn btn-secondary itemUpdateBtn").val(item.processCodeId).attr("name", item.itemCodeId).css({"width":"100%", "margin-bottom":"5px"}).html("수정")
							, $("<button>").addClass("btn btn-danger itemRemoveBtn").val(item.itemCodeId).css("width", "100%").html("삭제")
						)
					)
				)
			);
}

/* 항목 목록에서 헤더 만드는 태그 */
let makeHeaderTag = function() {
	return $("<li>").addClass("table-header").addClass("header").css({"padding":"10px", "font-size":"20px", "width":"100%", "font-weight":"500", "padding-left":"50px", "box-shadow":"0px 0px 9px 0px rgb(0 0 0 / 10%)"}).append(
				$("<table>").css({"width":"100%", "padding-left":"50px", "padding-right":"50px"}).append(
					$("<tr>").append(
						$("<th>").addClass("col-1")
						, $("<th>").addClass("col-2").html("항목명")
						, $("<th>").addClass("col-7").css("text-align", "center").html("상세")
						, $("<th>").addClass("col-1").html("점수")
						, $("<th>").addClass("col-1")
					)
				)
			);	
}

/* 항목 목록에서 새로운 추가, 기존 항목 추가 버튼 만드는 태그 */
let makeFooterTag = function(process) {
	return $("<li>").addClass("table-row").addClass("footer").css({"height":"100%", "padding":"0px", "width":"100%", "padding-top":"10px", "padding-bottom":"10px", "padding-left":"50px", "padding-right":"50px", "box-shadow":"0px 0px 9px 0px rgb(0 0 0 / 10%)"}).append(
				$("<table>").css({"width":"100%"}).append(
					$("<tr>").append(
						$("<td>").css({"position":"relative", "text-align":"center"}).append(
							$("<button>").addClass("btn btn-primary newAdd").css({"width":"15%", "margin-right":"3%"}).attr("data-bs-toggle", "modal").attr("data-bs-target", "#itemModal").val(process.processCodeId).html("새 항목 추가하기")
							, $("<button>").addClass("btn btn-primary originAdd").css({"width":"15%"}).html("기존항목에서 추가하기")
// 							, $("<button>").addClass("btn btn-primary newAdd").css({"width":"20%"}).data("bs-toggle", "modal").data("bs-target", "#itemModal").html("기존항목에서 추가하기")
						)
					)
				)
			);
}

/* 모달 : 목록 태그 만들기 */
let makeModalTag = function(index, item) {
	let itemIndex = "item" + (index + 1);
	return $("<tr>").append(
			$("<td>").addClass("col-1").css("text-align", "center").html(index)
			, $("<td>").addClass("col-2").html(item.itemCodeName)
			, $("<td>").addClass("col-7").append(
				$("<input>").attr("name", "itemAsk").attr("type", "text").attr("size", "50").attr("placeholder", item.itemCodeName+"에 대해 작성할 질문을 적으세요.")	.addClass("itemAsk").css("border", "none")	
			)
			, $("<td>").addClass("col-1").html("0")
			, $("<td>").addClass("col-1").css("text-align", "center").append($("<input>").attr("type", "checkBox").attr("id", itemIndex).attr("name", "itemList.itemCodeId").val(item.itemCodeId))
		);
}

/* 목록 띄우기 */
let $itemList = function() {
	$.ajax({
		url : "${pageContext.request.contextPath}/process/${anno.annoNo}/${anno.detailList[0].daNo}",
		method : "get",
		dataType : "json",
		success : function(resp) {
			itemUl.empty();
			let processList = resp.anno.detailList[0].processList;
			
 			let liTag = [];
			$.each(processList, function(index, process) { // 채용과정 개수만큼 돌기(8번)
				liTag.push(makeHeaderTag());
				let itemList = process.itemList;
				$.each(itemList, function(idx, item) { // 채용과정 항목수만큼 돌기(26번)
					if (process.processCodeId == item.processCodeId) {
						liTag.push(makeLiTag(idx, item));
					}
				});
				liTag.push(makeFooterTag(process));
				$("#PRC0"+(index+1)).append(liTag);
				liTag = [];
			});
			
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	}).done(function(data, textStatus, xhr){
		// 항목 목록에서 삭제 버튼 클릭 시, 해당 항목 지우기
		$(".itemRemoveBtn").on("click", function() {
			itemRemove(this);
		});
		// 모달 : '기존 항목 추가'버튼 클릭 시, 목록 띄우기
		$(".newAdd").on("click", function() {
			modalList(this);
		});
		// 모달 : '저장' 버튼 클릭 시, 항목 테이블에 입력
		$("#itemModalBtn").on("click", function(event) {
			insertOriginItem(event);
		});
		// 항목 목록에서 수정 버튼 클릭 시, 폼 만들어지고 저장 클릭 시 update 후 목록 다시 불러오기
		$(".itemUpdateBtn").on("click", function() {
			updateOriginItem(this);
		});
		
	});

}

$itemList();

/* 모달 : '추가되지 않은' 항목 목록 */
function modalList(button) {
	let clickFrom = $(button).val();
	$.ajax({
		url : "${pageContext.request.contextPath}/process/notAdded?daNo="+daNo,
		method : "get",
		dataType : "json",
		success : function(notAddedList) {
			itemModalBody.empty();
			let itemList = [];
			let idx = 0;
			$.each(notAddedList, function(index, item) {
				if (clickFrom == item.processCodeId) {
					idx++;
					itemList.push(makeModalTag(idx, item));
				}
			});
			itemModalBody.append(itemList);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* 항목 목록에서 지우기 */
function itemRemove(button) { // button = this
	let removeItem = $(button).val();
	let item = {
		"daNo" : daNo
		, "itemCodeId" : removeItem			
	}
	$.ajax({
		url : "${pageContext.request.contextPath}/process/item",
		method : "delete",
		contentType: "application/json; charset=utf-8",
		data : JSON.stringify(item),
		success : function() {
			$itemList();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

let itemModalDiv = $("#itemModalDiv");

// let makeModalForm = function() {
// 	return 	$("<form>").attr("method", "post").attr("encType", "multipart/form-data").attr("id", "itemModalForm").append(
// 				$("<input>").attr("name", "daNo").attr("type", "text")
// 				, $("<input>").attr("name", "itemCodeId").attr("type", "text")
// 				, $("<input>").attr("name", "itemAsk").attr("type", "text")
// 	);
// }

/* 모달 밑에 form태그 붙이고 ajax실행해서 insert하기 */
function insertOriginItem(event) {
	let checkBox = itemModalBody.find("input[type=checkBox]:checked");
	let inputTags = "";
	for (let i = 0; i < checkBox.length; i++) {
		inputTags += '<input name="itemList[' + i + '].daNo" value="${daNo}" />';
		inputTags += '<input name="itemList[' + i + '].itemCodeId" value="' + checkBox[i].value + '" />'; // dom객체
		inputTags += '<input name="itemList[' + i + '].itemAsk" value="' + $(checkBox.get(i)).parents("tr").find(".itemAsk").val() + '" />'; // jquery객체
		
	}
	
	let makeItemForm = '<form:form modelAttribute="process" id="itemModalForm"></form:form>';
	itemModalDiv.html(makeItemForm);
	$("#itemModalForm").html(inputTags);
	
	let itemModalForm = $("#itemModalForm").submit(function(event) {
		event.preventDefault();
		
		//serialize안 쓰고 어떻게 해? 일일이 json으로 바꿔? 아니면 js 객체?
		let itemList = $("#itemModalForm").serialize();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/process/item/origin",
			method : "post",
			data : itemList,
			success : function() {
				$itemList();
				$("button[data-bs-dismiss=modal]").trigger("click");
				$("#itemModalDiv").empty();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	});
	
	itemModalForm.submit();
}

function updateOriginItem(button) {
	let processCodeId = $(button).val();
	let itemCodeId = $(button).attr("name");
	let ctd = $(button).parents("tr").find(".itemCodeName");
	let atd = $(button).parents("tr").find(".itemAsk");
	let btd = $(button).parents("tr").find(".itemBtn");
	
	let ctdv = ctd.html();
	let atdv = atd.html();
	
	ctd.empty();
	atd.empty();
	btd.empty();
	////////////////////////////////
	console.log(processCodeId);
	$.ajax({
		url : "${pageContext.request.contextPath}/process/notAdded?daNo="+daNo,
		method : "get",
		dataType : "json",
		success : function(notAddedList) {
			let selectTags = "";
			
			selectTags += '<select class="form-control">';
			selectTags += '<option value="' + itemCodeId +'" selected>' + ctdv + '</option>';
			$.each(notAddedList, function(index, item) {
				if (processCodeId == item.processCodeId){
					selectTags += '<option value="' + item.itemCodeId + '">' + item.itemCodeName + '</option>'
				}
			});
			selectTags += "</select>";
			console.log(selectTags);
			ctd.html(selectTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	////////////////////////////////
// 	ctd.html('<input type="text" name="icn" value="' + ctdv +'">');
	atd.html('<input type="text" name="ia" value="' + atdv +'">');
	let btn = '<button class="btn btn-primary itemSaveBtn" style="width: 100%; margin-bottom: 5px;">저장</button><button class="btn btn-danger itemCancelBtn" style="width: 100%;">취소</button>'
	btd.html(btn);
	
	$(".itemSaveBtn").on("click", function() {
		console.log($(this).parents("tr").find(".itemCodeName"));
		console.log($(this).parents("tr").find(".itemAsk"));
	});
	$(".itemCancelBtn").on("click", function() {
		$itemList();
	});
}


/* 각 카드 누르면 카드에 맞는 항목들 보여주기 */
$("span.data-card").on("click", function() {
	// .card-contain이 갖고 있는 모든 span을 조사해서 만약 hovered가 있으면 없애주고
	let spans = $(this).parent().children("span");
	for (let i = 0; i < spans.length; i++) {
		$(spans[i]).removeClass("hovered");
	}
	
	// 선택한 애는 넣어주기
	$(this).addClass("hovered");
	
	// 라디오버튼 체크할 거 값 가져오기
	let id = $(this).attr("id").substring(4);
	$("#disp"+id).show();
	
	let udisp = $("#disp").children().not("#disp"+id);
	for (let i = 0; i < udisp.length; i++) {
		udisp[i].style.display = "none";
	}
	
});



</script>

