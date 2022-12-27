<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="Refresh" content="5;url=https://www.naver.com"> responseHeader를 설정하는 또 다른 방법 -->
<title>05/autoRequest.jsp</title>
<style>
	.disabled {
		display: none;
	}
</style>
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
<button class="controlBtn disabled" data-control-type="STOP">멈춤</button>

<input type="radio" name="dataType" data-data-type="json">JSON
<input type="radio" name="dataType" data-data-type="text">PLAIN <!-- 아무 것도 선택 안 된 것까지 케이스 3개 -->

<input type="radio" name="locale" value="<%= Locale.KOREAN.toLanguageTag() %>" checked>한국어
<input type="radio" name="locale" value="<%= Locale.ENGLISH.toLanguageTag() %>">영어
<input type="radio" name="locale" value="<%= Locale.JAPANESE.toLanguageTag() %>">일어

<script>
// 	setTimeout(() => {
// 		location.reload();
// 	}, 1000);
	let timeArea = $("#timeArea"); 
	let dataTypes = $('[name="dataType"]');
	let locales = $('[name="locale"]');
	
	let successes = {
		json:function(resp){
			timeArea.html(resp.now);

		},
		text:function(plain){
			timeArea.html(plain);

		}
	}
	
	let sendRequest = function(){ // 자바스크립트에서는 함수도 객체여서 변수에 담아 쓸 수 있음!
//		2단계 : dataType 라디오 버튼의선택 조건에 따라 비동기 요청 헤더(Accept) 설정.
// 		--> dataType에 따라 success함수의 형태가 달라짐
		let dataType = dataTypes.filter(":checked").data('dataType');
		if (!dataType) { // 없거나 undefined거나 0
			dataType = "json";
			dataTypes.filter('[data-data-type="json"]').prop("checked", true);
		}
		
//	 	3단계 : locale 라디오 버튼의 선택 값에 따라 비동기 요청의 locale 파라미터 결정됨
		let locale = locales.filter(":checked").val();
		let data = {}
		if (locale) {
			data.locale=locale;
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/05/getServerTime",
			data : data,
			dataType : dataType,
			// 응답데이터가 json이라 Refresh response header를 사용해야 하는데 얘는 화면에 lock을 걸어야 함. 
			// 하지만 ajax는 비동기 요청이라 사용 못함. 
			//얘가 동작 안 하는 걸 확인하고 대안을 찾아야 함 => 비동기를 1초마다 발생시켜야 됨. timeout(초 후 끝), interval(이거 사용)
			success : successes[dataType], // 연상배열 구조
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
	}
	
// 	1단계 : 컨트롤 버튼에 대한 클릭 이벤트 처리
	let controlBtns = $(".controlBtn").on("click", function(){
// 		$(this).prop("disabled", true);
		controlBtns.toggleClass("disabled");
		let controlType = $(this).data("controlType");
		if (controlType == "START"){
// 	컨트롤 버튼 타입이 START이면
// 	시계 작동
			let jobId = setInterval(sendRequest, 1000);
			timeArea.data("jobId", jobId);
		} else {
// 	컨트롤 버튼 타입이 STOP이면
// 	시계 멈춤
			let jobId = timeArea.data("jobId");
			if (jobId){ // jobId가 있다는 뜻
				clearInterval(jobId);
				timeArea.data("jobId", null);
			}
		}
	});
	

</script>
</body>
</html>