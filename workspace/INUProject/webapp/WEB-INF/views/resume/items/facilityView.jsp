<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="table table-bordered">
	<tr>
		<th>기능일련번호</th>
		<td>${facility.facilitySn}</td>
	</tr>
	<tr>
		<th>일반회원아이디</th>
		<td>${facility.memId}</td>
	</tr>
	<tr>
		<th>기능명</th>
		<td>${facility.facilityName}</td>
	</tr>
	<tr>
		<th>기능종류</th>
		<td>${facility.facilityCategory}</td>
	</tr>
	<tr>
		<th>수준</th>
		<td>${facility.facilityLevel}</td>
	</tr>
	<tr>
		<th>취득일</th>
		<td>${facility.facilityGetdate}</td>
	</tr>
	<tr>
		<th>훈련기간</th>
		<td>${facility.facilityPeriod}</td>
	</tr>
	<tr>
		<th>기능 작성날짜</th>
		<td>${facility.facilityInsertDate}</td>
	</tr>
	<tr>
		<th>기능 삭제 날짜</th>
		<td>${facility.facilityDeleteDate}</td>
	</tr>
	<tr>
		<th>첨부파일아이디</th>
		<td>${facility.attId}</td>
	</tr>
</table>