<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>
<script>
// 	$(document).on("ready", function(){});
// 	$(document).ready(funtion(){});
	$(function(){ // 위의 두 개와 같은 것
		let resultArea = $("#resultArea");
	// 	$("[name]") //네임을 갖고 있는 애
		$("form[name]").on("submit", function(event){ // form 중에 name을 갖고 있는 애
			event.preventDefault();
			console.log($(this)); // 배열의 형태! 찾으면 length 1이상 아니면 0..
			console.log(this); // raw한 html 데이터
			console.log($(this)[0]);
			console.log($(this).get(0)); // 맨 위에꺼 빼고 다 똑같음
			
			let url = this.action;
			let method = this.method;
			let data = $(this).serialize();
			console.log(data);
			
			$.ajax({
				url : url,
				method : method,
				data : data,
				dataType : "html",
				success : function(resp) {
// 					$('#resultArea').html(resp); // 이렇게 하면 요청할 때마다 문서 전체를 찾아서 느려지게 됨
					resultArea.html(resp); // 위에 한 번만 실행되게 해놓은 다음에 만들어야 함
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
			
			return false; // 콜백함수의 고유 액션(요청)이 중단됨
		}); 
	});
</script>
</head>
<body>
<form name="facForm" action="<%= request.getContextPath() %>/02/factorial.do">
	<input type="number" name="number" />
	<input type="submit" value="전송" /> <!--  click(target : button) - submit(target : form) -->
	<input type="reset" value="취소" /> <!-- click(target : button) - reset(target : form) -->
	<input type="button" value="걍버튼" /> <!-- click(target : button) -->
</form>
<div id="resultArea">

</div>
</body>
</html>