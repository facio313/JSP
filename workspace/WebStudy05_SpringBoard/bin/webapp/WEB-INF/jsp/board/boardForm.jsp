<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script
	src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<form:form modelAttribute="board" enctype="multipart/form-data" method="post">
	<!-- 보여주는 controller에서 빈 BoardVO나 원래의 BoardVO가 필요함(@ModelAttribute) -->
	<table class="table table-hover table-bordered">
		<tr>
			<th>제목</th>
			<td><form:input cssClass="form-control" required="true" path="boTitle" />
				<form:errors path="boTitle" element="span" cssClass="text-danger" />
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<form:input cssClass="form-control" required="true" path="boWriter" />
				<form:errors path="boWriter" element="span" cssClass="text-danger" />
			</td>
		</tr>
		<tr>
			<th>아이피</th>
			<td>
				<input class="form-control" name="boIp" type="text" readonly value="${pageContext.request.remoteAddr }" />
				<form:errors path="boIp" element="span" cssClass="text-danger" />
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<form:input cssClass="form-control" path="boMail" />
				<form:errors path="boMail" element="span" cssClass="text-danger" />
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="boPass" class="form-control"/>
				<form:errors path="boPass" element="span" cssClass="text-danger" />
			</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<input type="file" name="boFiles" />
				<input type="file" name="boFiles" />
				<input type="file" name="boFiles" />
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<form:textarea cssClass="form-control" path="boContent" />
				<form:errors path="boContent" element="span" cssClass="text-danger" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input class="btn btn-success" type="submit" value="저장" />
				<button  type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath }/board/boardList.do'">목록</button>
			</td>
		</tr>
	</table>
</form:form>
<script>
	CKEDITOR.replace('boContent', {
		filebrowserUploadUrl: '${pageContext.request.contextPath}/board/boardImage.do?command=QuickUpload&type=Files'
	});
</script>