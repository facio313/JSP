<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includee/preScript.jsp"/>
</head>
<style>
	li {
		width: 1000px;
		height: 40px;
	}
</style>
<body>
// resource 안 images 폴더
<h4>src : /resources/images</h4>
<ul class="list-group" id="srcUL">
	<li data-content-type="image/jpg" class="list-group-item active">cat1.jpg</li>
	<li data-content-type="image/jpg" class="list-group-item">cat2.jpg</li>
<button id="copyBtn">COPY</button>
</ul>

// destImgs 폴터
<h4>dest : /destImgs</h4>
<ul id="destUL">
	
</ul>

1단계 ul태그 완성하기
2단계 li태그가 들어갔다라면, 특정 li태그를 선택했을 때 active라는 클래스를 toggling할 수 있어야 함
3단계 copyBtn 클릭 시 event 처리 필요
4단계 source파일과 destination 넘겨야 함
5단계 요청을 받은 서버 사이드에서 복사를 해야 함
<script>
// li의 active 클래스로 선택된 거 받아오기 select는 안 됨
// 파일 선택이 되게 하기
// li 태그를 눌렀을 때 active 되게 하고
	var liClick = function() {
		$("#srcUL li").on("click", function() {
			$(this).attr("active");
		});
	}

// 	$(document).on("click", "#copyBtn", function(event){
// 		$.ajax({
<%-- 			url : "<%= request.getContextPath() %>/browsing/fileManager", // 최소한 세 개의 파라미터가 있어야 복사 가능 --%>
// 			method : "post",
// 			data : {
// 				srcFile : "/resources/images/cat1.jpg", // 라는 구체적인 파일 하나를 선택했을 때 상황. 어떤 li 태그를 선택했는가에 따라 달라짐
// 				destFolder : "/destImgs", // 위치값만 저장
// 				command : "COPY" // 총 세 개의 파라미터 / 조금 있다가 파라미터 확장하려고 함
// 			},
// 			dataType : "json",
// 			success : function(resp) {
// 				getList();
// 			},
// 			error : function(jqXHR, status, error) {
// 				console.log(jqXHR);
// 				console.log(status);
// 				console.log(error);
// 			}
// 		});
// 	});
	
// 	함수의 파라미터로 타겟을 넘겨주고 서블릿에서 잘 오는지 확인하기
	var h4s = document.querySelectorAll("h4");
	var srcs = h4s[0].innerHTML.split(" : ");
	var dests = h4s[1].innerHTML.split(" : ");
	var src = srcs[1];
	var dest = dests[1];
	
	var srcUL = $("#srcUL");
	var destUL = $("#destUL");
	function getList(src, dest) {
		var list = "";
		var destList = "";
		
		$.ajax({
			url : "<%= request.getContextPath() %>/browsing/getFileList",
			data : {
				target : src + "1",
				dest : dest
			},
			dataType : "json",
			success : function(resp) {
				console.log(resp);
				$.each(resp.files, function(key, value){
					list += "<li data-content-type='" + value + "' class='list-group-item'>" + key + "</li>";
				});
				srcUL.html(list);
				if (resp.destFile != null){
					$.each(resp.dest, function(key, value){
						destList += "<li>" + key + "</li>";
					})
				} else {
					destList = "파일이 없습니다.";
				}
				destUL.html(destList);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
	
	getList(src, dest);
	
</script>
<jsp:include page="/includee/postScript.jsp"/>
</body>
</html>