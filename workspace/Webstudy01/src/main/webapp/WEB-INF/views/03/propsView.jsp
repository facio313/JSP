<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<h4>properties 파일 뷰어</h4>
<!-- <img src="../../resources/images/cat1.jpg"> -->
<table border="1px">
	<thead>
		<tr>
			<th>key</th>
			<th>value</th>
		</tr>
	</thead>
	<tbody id="my_tbody">
		
	</tbody>
</table>
<script type="text/javascript">
	$.ajax({
// 		url : "", // 이게 사라지면 호출한 서블릿(자기 자신)으로 다시 보냄(http://localhost/Webstudy01/03/props/propsView.do)
// 		method : "", // 생략되면 get
// 		data : {}, // 데이터를 가져올 목적이라면 보낼 게 없으니 생략 오케이
		dataType : "json", // html은 ui 포함, json은 순수 데이터, xml
		success : function(resp) {
			console.log(resp);
			console.log(resp[0].key);
        	var html = "";
       		for (var i = 0; i < resp.length; i++) {
       			console.log(resp[i]);
      			html += "<tr>";
            	html += "<td>" + resp[i].key +"</td>";
            	html += "<td>" + resp[i].value +"</td>";
            	html += "</tr>";
        	}
       		
        	var obj = document.querySelector("#my_tbody");
        	obj.innerHTML = html;
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