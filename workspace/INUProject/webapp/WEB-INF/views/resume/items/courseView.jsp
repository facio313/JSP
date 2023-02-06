<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="table table-bordered">
	<tr>
		<th>교육이수일련번호</th>
		<td>${course.courseSn}</td>
	</tr>
	<tr>
		<th>일반회원아이디</th>
		<td>${course.memId}</td>
	</tr>
	<tr>
		<th>교육명</th>
		<td>${course.courseName}</td>
	</tr>
	<tr>
		<th>교육종류</th>
		<td>${course.courseCategory}</td>
	</tr>
	<tr>
		<th>교육기관</th>
		<td>${course.courseInstitution}</td>
	</tr>
	<tr>
		<th>교육기간</th>
		<td>${course.coursePeriod}</td>
	</tr>
	<tr>
		<th>교육이수 작성날짜</th>
		<td>${course.courseInsertDate}</td>
	</tr>
	<tr>
		<th>교육이수 삭제날짜</th>
		<td>${course.courseDeleteDate}</td>
	</tr>
	<tr>
		<th>첨부파일아이디</th>
		<td>${course.attId}</td>
	</tr>
</table>