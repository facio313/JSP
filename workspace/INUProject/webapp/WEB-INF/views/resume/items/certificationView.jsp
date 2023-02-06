<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="table table-bordered">
	<tr>
		<th>자격증일련번호</th>
		<td>${certification.certSn}</td>
	</tr>
	<tr>
		<th>일반회원아이디</th>
		<td>${certification.memId}</td>
	</tr>
	<tr>
		<th>자격번호</th>
		<td>${certification.certNo}</td>
	</tr>
	<tr>
		<th>자격증명</th>
		<td>${certification.certName}</td>
	</tr>
	<tr>
		<th>발급일</th>
		<td>${certification.certDate}</td>
	</tr>
	<tr>
		<th>시행부처</th>
		<td>${certification.certInstitution}</td>
	</tr>
	<tr>
		<th>자격증 작성날짜</th>
		<td>${certification.certInsertDate}</td>
	</tr>
	<tr>
		<th>자격증 삭제날짜</th>
		<td>${certification.certDeleteDate}</td>
	</tr>
	<tr>
		<th>첨부파일아이디</th>
		<td>${certification.attId}</td>
	</tr>
</table>