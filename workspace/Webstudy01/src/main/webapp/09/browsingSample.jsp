<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>09/browsingSample.jsp</title>
<jsp:include page="/includee/preScript.jsp" />
<script>
	//셀렉터로 골라놓은 제이쿼리 함수
	$.fn.generateFileList=function(){
		let target = this.data("target");
		let ulTag = this;
		$.ajax({
			url : "<%=request.getContextPath()%>/browsing/getFileList",
			data : {
				target : target
			},
			dataType : "json",
			success : function(resp) {
				let liTags = [];
				$.each(resp.files, function(index, wrapper){
					//files는 배열이 되었기 때문에 index를 받고 아규먼트 한개 한개를 가지고 와야함
					let li = $("<li>").addClass("list-group-item")
										.data("contentType",wrapper.contentType)
										.html(wrapper.name);
					liTags.push(li)
				});
				ulTag.html(liTags);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		return this;
	}
</script>
</head>
<body>
<div class="row">
	<div class="col">
		<h4>src : /resources/images</h4>
		<ul class="list-group" id="srcUL" data-target="/resources/images">
			<li data-content-type="image/jpeg" class="list-group-item active">cat1.jpg</li>
		</ul>
	</div>
	<div class="col">
		<input type="radio" name="command" value="COPY" checked />COPY
		<input type="radio" name="command" value="MOVE" />MOVE
		
		<button id="controlBtn" class="btn btn-primary">실행</button>
	</div>
	<div class="col">
		<h4>dest : /destImgs</h4>
		<ul class="list-group" id="destUL" data-target="/destImgs">
		
		</ul>
	</div>
</div>
<script type="text/javascript">
//1단계 : li 태그에 들어가는 내용들을 넣을 수 있어야한다.
//2단계 : 액티브 클래스를 토글링 할 수 있어야하는 UI를 만들기
//3단계 : 카피 btn을 눌렀을 떄 복사가 가능한 이벤트
//4단계 : 소스파일과 destFile넘겨야함
//5단계 : 이 걸 넘겨서 복사해야함
//6단계 : 의사코드로 만들어서 작업해야한다
	let srcUL = $("#srcUL").generateFileList().on("click", "li", function(event){ // select하는 와중에는 아무 것도 없음
// 		alert("1번 방식");
		$(this).siblings("li").removeClass("active"); // 형제 노드를 찾아옴
		$(this).addClass("active");
	});
// 	$("#srcUL>li").on("click", function(){ // 처음부터 ul태그 안에 li가 존재한다고 보는 것, 근데 처음에 없으면?! 그럼 아무 것도 안 걸림 // 동적이벤트에 이런 식으로 바인딩하면 망함
// 		alert("2번 방식");
// 	});
	let destUL = $("#destUL").generateFileList();
	$(document).on("click", "#controlBtn", function(event){
		let command = $('input[name="command"]:checked').val();
		console.log(command);
		let fileName = srcUL.find("li.active").text();
		if (!fileName) return false;
		
		let srcFile = srcUL.data("target") + "/" + fileName; 
		let data = {
			srcFile : srcFile,
			destFolder : destUL.data("target"),
			command : command
		}
		$.post("<%= request.getContextPath() %>/browsing/fileManager", data, function(resp){
			if (resp.result) {
				destUL.generateFileList();
				srcUL.generateFileList();
			} else {
				alert("파일 관리 실패");
			}
		}, "json");
		
// 		$.ajax({
<%-- 			url : "<%= request.getContextPath() %>/browsing/fileManager", // request.getContextPath() 자동으로 만들어주는 함수 만들어보기 --%>
// 			method : "post",
// 			data : {
// 				srcFile : srcFile,
// 				destFolder : destUL.data("target"),
// 				command : "COPY"
// 			},
// 			dataType : "json",
// 			success : function(resp) {
					
// 			},
// 			error : function(jqXHR, status, error) {
// 				console.log(jqXHR);
// 				console.log(status);
// 				console.log(error);
// 			}
// 		});
	});
</script>
<jsp:include page="/includee/postScript.jsp" />
</body>
</html>