<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="<c:url value='/login/loginProcess.do'/>">
		<ul>
			<li>
				<input type="text" name="memId" placeholder="아이디" id="id"/>
			</li>
			<li>
				<input type="password" name="memPass" placeholder="비밀번호" />
				<input type="submit" value="로그인" />
			</li>
		</ul>
	</form>
</body>
<script type="text/javascript">
var no = ${no};

function no() {
// 	if (${no} == "no") {
	console.log(no);
	document.querySelector("#id").value = "${memId}";
	alert("비밀번호 입력 오류");
// 	}
}

no();


</script>
</html>