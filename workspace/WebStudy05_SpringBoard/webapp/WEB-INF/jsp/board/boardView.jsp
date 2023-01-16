<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table class="table table-hover table-bordered">
	<tr>
		<th>글번호</th>
		<td>${board.boNo}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${board.boTitle}</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${board.boWriter}</td>
	</tr>
	<tr>
		<th>아이피 주소</th>
		<td>${board.boIp}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${board.boMail}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${board.boContent}</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${board.boDate}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${board.boHit}</td>
	</tr>
	<c:if test="${not empty board.attachList}">
	<tr>
		<th>
			첨부파일
		</th>
		<td>
			<table class="table table-hover table-bordered">
				<thead>
					<th>파일번호</th>
					<th>파일이름</th>
					<th>파일형식</th>
					<th>파일크기</th>
					<th>다운로드 횟수</th>
				</thead>
				<c:forEach items="${board.attachList}" var="attach">
				<tbody>
						<td>${attach.attNo}</td>
						<td>${attach.attFilename}</td>
						<td>${attach.attMime}</td>
						<td>${attach.attFilesize}</td>
						<td>${attach.attDownload}</td>
				</tbody>
				</c:forEach>
			</table>
		</td>
	</tr>
	</c:if>
	<tr>
		<td>
			<button type="button" class="btn btn-primary" onclick="location.href='${viewURL}'">수정</button>
			<button type="button" class="btn btn-danger" onclick="location.href='${viewURL}'">삭제</button>
			<c:url value="/board/boardList.do" var="viewURL"/>
			<button type="button" class="btn btn-default" onclick="location.href='${viewURL}'">목록</button>
		</td>
	</tr>
</table>