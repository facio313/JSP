<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="Refresh" content="5;url=https://www.naver.com"> responseHeader를 설정하는 또 다른 방법 -->
<title>05/autoRequest.jsp</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<h4>Refresh 헤더 활용</h4>
<%--
// refresh -> 현재 화면에 lock을 검(lock이 풀리기 전에는 새로운 걸 볼 수 없음?)
// 리뉴얼 사이트에 자주 쓰임
// 단점 : 화면 전체가 다시 그려짐(동기라)
	response.setIntHeader("Refresh", 1);
--%>
<pre>
	서버의 갱신 데이터 확보(동기 요청 구조)
	1. Refresh response header
	2. meta tag
	3. reload
</pre>
<h4>현재 서버의 시간 : <span id="timeArea"></span></h4>
<!-- <input type="text" placeholder="기록필드"> -->

<button class="controlBtn" data-control-type="START">시작</button>
<button class="controlBtn" data-control-type="STOP">멈춤</button>

<input type="radio" name="dataType" data-data-type="json" checked>JSON
<input type="radio" name="dataType" data-data-type="text">PLAIN <!-- 아무 것도 선택 안 된 것까지 케이스 3개 -->

<input type="radio" name="locale" value="ko" checked>한국어
<input type="radio" name="locale" value="en">영어
<input type="radio" name="locale" value="jp">일어

<script>
// 	setTimeout(() => {
// 		location.reload();
// 	}, 1000);
	let timeArea = $("#timeArea");
	
	let startBtn = $("[data-control-type=START]");
	let stopBtn = $("[data-control-type=STOP]");
	
	let radioBtns = $("[type=radio]");
	let dataTypes = radioBtns.filter("[name=dataType]");
	let locales = radioBtns.filter("[name=locale]");
	
	let sendRequest = function(){ // 자바스크립트에서는 함수도 객체여서 변수에 담아 쓸 수 있음!
		
		let dataType = dataTypes.filter(":checked").data("dataType");
		let locale = locales.filter(":checked").val();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/05/getServerTime1",
			data : {
				locale : locale
			},
			dataType : dataType,
			// 응답데이터가 json이라 Refresh response header를 사용해야 하는데 얘는 화면에 lock을 걸어야 함. 
			// 하지만 ajax는 비동기 요청이라 사용 못함. 
			//얘가 동작 안 하는 걸 확인하고 대안을 찾아야 함 => 비동기를 1초마다 발생시켜야 됨. timeout(초 후 끝), interval(이거 사용)
			success : function(resp) {
				timeArea.html(resp.now);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
	
	let jobId = setInterval(sendRequest, 1000);

	startBtn.on("click", jobId);
	stopBtn.on("click", function(){
		clear(jobId);
	})
	
	
</script>
</body>
</html>