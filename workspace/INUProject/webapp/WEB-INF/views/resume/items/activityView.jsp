<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="table table-bordered">
	<tr>
		<th>주요활동일련번호</th>
		<td>${activity.actSn}</td>
	</tr>
	<tr>
		<th>일반회원아이디</th>
		<td>${activity.memId}</td>
	</tr>
	<tr>
		<th>주요활동명</th>
		<td>${activity.actName}</td>
	</tr>
	<tr>
		<th>주요활동종류</th>
		<td>${activity.actCategory}</td>
	</tr>
	<tr>
		<th>주요활동기관</th>
		<td>${activity.actInstitution}</td>
	</tr>
	<tr>
		<th>주요활동기간</th>
		<td>${activity.actPeriod}</td>
	</tr>
	<tr>
		<th>주요활동 작성날짜</th>
		<td>${activity.actInsertDate}</td>
	</tr>
	<tr>
		<th>주요활동 삭제날짜</th>
		<td>${activity.actDeleteDate}</td>
	</tr>
	<tr>
		<th>첨부파일아이디</th>
		<td>${activity.attId}</td>
	</tr>
	<a href="${pageContext.request.contextPath}/activity/updateForm?actSn=${activity.actSn}"><button class="primary">수정하기</button></a>
</table>