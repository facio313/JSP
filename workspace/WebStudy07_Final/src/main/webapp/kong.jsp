<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includee/preScript.jsp" flush="false"/>
</head>
<body>
<div id="disp"></div>

<script>
let url = "http://apis.data.go.kr/1160100/service/GetCorpBasicInfoService/getCorpOutline?pageNo=1&numOfRows=1&resultType=xml&serviceKey=";
let key = "JTpWDYFZS7u8AmLXQMOhVuqZlifrhgH3cRVd3TFMS%2F5nbdB6vETWKc89Z2GaffqsdMfGRXULro%2F5tiq7SVWdzg%3D%3D";

$.ajax({
	url : url + key,
	method : "get",
	dataType : "xml",
	success : function(resp) {
		console.log(resp);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
});
</script>

</body>
</html>