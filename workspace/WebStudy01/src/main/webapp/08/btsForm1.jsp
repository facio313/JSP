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

<script>
	let list = $('[name="member"]');

// 	 전체 bts 멤버 옵션 값
	$.ajax({
		url : "<%= request.getContextPath() %>/bts",
		dataType : "json", // or xml
		success : function(resp) {
// 			console.log(resp.bts); // server side에서 attribute name으로 결정됨

// 			멤버 관련 스트링을 담을 변수 선언 memList
			var members = "";
			
// 			거기다 옵션 관련 넣기
			for (member in resp.bts){
				members += "<option value=" + member + ">" + resp.bts[member][0] + "</option>";
			}
			k
// 			select에 넣기
			list.html(list.html() + members);
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