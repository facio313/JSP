<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="table table-bordered">
	<tr>
		<th>수상내역일련번호</th>
		<td>${award.awardSn}</td>
	</tr>
	<tr>
		<th>일반회원아이디</th>
		<td>${award.memId}</td>
	</tr>
	<tr>
		<th>수상대회명</th>
		<td>${award.awardCompetition}</td>
	</tr>
	<tr>
		<th>수상명</th>
		<td>${award.awardName}</td>
	</tr>
	<tr>
		<th>수상대회종류</th>
		<td>${award.awardCategory}</td>
	</tr>
	<tr>
		<th>수상날짜</th>
		<td>${award.awardDate}</td>
	</tr>
	<tr>
		<th>수상기관</th>
		<td>${award.awardInstitution}</td>
	</tr>
	<tr>
		<th>수상내역 작성날짜</th>
		<td>${award.awardInsertDate}</td>
	</tr>
	<tr>
		<th>수상내역 삭제날짜</th>
		<td>${award.awardDeleteDate}</td>
	</tr>
	<tr>
		<th>첨부파일아이디</th>
		<td>${award.attId}</td>
	</tr>
</table>