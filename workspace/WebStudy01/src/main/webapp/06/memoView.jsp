<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includee/preScript.jsp"/>
<script src="<%= request.getContextPath() %>/resources/js/custom.js"></script>
</head>
<body>
<h4>Restful 기반의 메모 관리</h4>
<form name="memoForm" action="${pageContext.request.contextPath}/memo" method="post">
<!-- 	<input type="hidden" name="_method" value="put">  put이고, 서버 사이드에 필터가 있어야 함 -->
	<input type="text" name="writer" placeholder="작성자"><br/>
	<input type="date" name="date" placeholder="작성일"><br/>
	<textarea name="content"></textarea><br/>
	<input id="formButton" type="submit" value="등록">
</form>
<table class="table-bordered">
	<thead>
		<tr>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody id="listBody">
		
	</tbody>
</table>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">세부 내용</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
     <form name="updateForm" action="${pageContext.request.contextPath}/memo">
      <div class="modal-body">
      		<input id="mcode" type="number" name="code" readonly/><br/>
      		<input id="mwriter" type="text" name="writer"/><br/>
      		<input id="mdate" type="date" name="date"/><br/>
      		<textarea id="mcontent" name="content"></textarea>
      </div>
      <div class="modal-footer">
        <button id="update" type="submit" class="btn btn-primary"data-bs-dismiss="modal">수정</button>
        <button id="delete" type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</button>
      </div>
     </form>
    </div>
  </div>
</div>

<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">삭제하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
     <form name="deleteForm" action="${pageContext.request.contextPath}/memo">
      <div class="modal-body">
      		<input id="dcode" type="number" name="code" readonly/><br/>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">정말 삭제하시겠습니까?</button>
      </div>
     </form>
    </div>
  </div>
</div>

<script type="text/javascript">

	//===================등록하기
// 	$('[name="memoForm"]');
	let memoForm = $(document.memoForm).on('submit', function(event){ // 여기서 받아 놓은 건 jquery 객체, 밑에 건 일반 객체
// 	$(document.memoForm).on('submit', function(event){
// 		this ==	event.target != $(this)
event.preventDefault(); // 이게 있다면 re(		1urn false가 필요 없긴 함. 그냥 관행적으로 적어줌
		
		let url = this.action;
		let method = this.method;
// 		let data = $(this).serialize(); // writer=작성자&data=작성일&content=내용 (QueryString을 만들어준다)
		let data = $(this).serializeObject();
// 		let memoForm = this; // 여기서 받아 놓은 건 일반 객체, 위에는 jquery 객체
		// 위에 것들을 미리 만들어주는 플러그인이 있음 = ajaxform
		console.log(this);
		console.log(data);
		
		$.ajax({
			url : url,
			method : method,
			contentType : "application/json; charset=UTF-8", // request content-type
			data : JSON.stringify(data), // 파라미터는 원래 객체의 형태를 나타낼 수 없음. QueryString으로 serialize됨
			dataType : "json", // request의 Accept, response content-type
			success : function(resp) {
				makeListBody(resp.memoList);
				memoForm[0].reset(); // jquery 객체는 배열처럼 사용됨
// 				memoForm.reset(); // 일반 객체용
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		return false; // 이걸 밑에 줘버렸을 때 중간에 에러가 떠버리면 동기 요청이 발생함
	});

	let mcode = $("#mcode");
	let mwriter = $("#mwriter");
	let mdate = $("#mdate");
	let mcontent = $("#mcontent");
	
	//===================보여주기
//    EDD(Event Driven Development)
   $("#exampleModal").on("show.bs.modal",function(event){
//       this==event.target(모달그자체/이벤트그자체)
      let memo = $(event.relatedTarget).data("memo"); // modal을 오픈할 때 사용한 클릭 대상, tr
//       $(this).find(".modal-body").html(memo.content);
     mcode.val(memo.code);
     mwriter.val(memo.writer);
     mdate.val(memo.date);
     mcontent.html(memo.content);
   }).on("hidden.bs.modal", function(event){
      $(event.target).find("modal-body").empty();
   });
   
	let listBody = $("#listBody");
	let makeListBody = function(memoList){
		listBody.empty();
		let trTags = [];
		if(makeListBody.length>0){
	      //data-bs-toggle="modal" data-bs-target="#exampleModal"
			$.each(memoList, function(index, memo){ //인덱스와 한건의 메모를 값으로 받아온다
				let tr = $("<tr>").append(
					$("<td>").html(memo.writer), //메모라는 원형 데이터(매개변수에있는거)      
					$("<td>").html(this.date)      
				).attr({
					"data-bs-toggle":"modal",
					"data-bs-target":"#exampleModal"
				}).data("memo",memo);
				trTags.push(tr);
			});
		} else {
			let tr = $("<tr>").html(
			$("<td>")
				.attr("colspan","2")
				.html("작성된 메모가 없습니다")
			);
		trTags.push(tr);
		}
		listBody.append(trTags);
	}
   
	function get(location){
		$.ajax({
		   url : location,
		   method : "get", //post -새로운 메모를 작성하겠다, put->메모를 수정하겠다, 
		   dataType : "json",
		   success : function(resp) {
		      //json데이터로 제대로 넘어올 시에 보여줘야하는 것
		      makeListBody(resp.memoList);
		   },
		   error : function(jqXHR, status, error) {
		      console.log(jqXHR);
		      console.log(status);
		      console.log(error);
		   }
		});
	}
	
	get("${pageContext.request.contextPath}/memo");
	
	//===================수정하기
	let updateForm = $(document.updateForm).on('submit', function(event){
		event.preventDefault();
		
		let url = this.action;
		let data = $(this).serializeObject();
		
		$.ajax({
			url : url,
			method : "put",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(data),
			dataType : "json",
			success : function(resp) {
				// 자동이 안 되면 수동으로!!!!
				get(resp.location);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
		
	});
	
	//===================삭제하기
	$("#deleteModal").on("show.bs.modal",function(event){
	    $("#dcode").val(mcode.val());
	}).on("hidden.bs.modal", function(event){
	   $(event.target).find("modal-body").empty();
	});
	
	let deleteForm = $(document.deleteForm).on('submit', function(event){
		event.preventDefault();
		
		let url = this.action; //memo/2
		let data = $(this).serializeObject();
		
		$.ajax({
			url : url,
			method : "delete",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(data),
			dataType : "json",
			success : function(resp) {
				get(resp.location);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
		
	});


</script>
<jsp:include page="/includee/postScript.jsp"/>
</body>
</html>