<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>03/sampleForm.jsp</title>
</head>
<body>
<h4> 입력 양식 </h4>
<form action="sampleProcess.jsp" method="post" enctype="multipart/form-data">
	<input type="text" name="param1" placeholder="param1">
	<input type="text" name="param2" placeholder="param2">
	<input type="text" name="param2" placeholder="param2">
	<input type="file" name="file1"  placeholder="file1"> <!-- file 보낼 시 get은 사용할 수 없게 됨 -> query String으로 다 보낼 수 없좌놔 -->
	<input type="submit" value="SUBMIT">
</form>
</body>
</html>