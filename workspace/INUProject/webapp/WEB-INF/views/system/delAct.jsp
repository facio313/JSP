<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

var cnt = ${cnt};
if(cnt == 1){
	alert("정상적으로 처리되었습니다.")
	location.href="<c:url value='/systemManagement/acceptManagement'/>";
}else{
	history.back();
	//history.go(-1);  같은의미
}
</script>

</head>
<body>

</body>
</html>