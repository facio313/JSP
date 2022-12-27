<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includee/preScript.jsp"/>
</head>
<body>
<select name="member">
	<option value>멤버 선택</option>
</select>
<div id="disp"></div>
<script>
	let disp = $("#disp");
	let memberSelect = $('[name="member"]').on("change", function(event){
		let code = $(this).val(); // this는 event target과 같음
<%-- 		location.href = "<%= request.getContextPath() %>/bts/" + code; --%>
		$.ajax({
			url : "<%= request.getContextPath() %>/bts/" + code,
			dataType : "html",
			success : function(resp) {
				disp.html("");
				disp.html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
// 	 전체 bts 멤버 옵션 값
	$.ajax({
		url : "<%= request.getContextPath() %>/bts",
		dataType : "json", // or xml
		success : function(resp) {
			let options = [];
			$.each(resp.bts, function(code, values){ // 키값과, 배열
				let option = $("<option>").val(code).text(values[0]);
				options.push(option);			
			});
			memberSelect.append(options);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});

	
</script>
<jsp:include page="/includee/postScript.jsp"/>
</body>
</html>