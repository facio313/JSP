<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form modelAttribute="activity" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="job-title">주요활동일련번호</label>
		<form:input path="actSn" type="text" cssClass="form-control" />
		<form:errors path="actSn" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">일반회원아이디</label>
		<form:input path="memId" type="text" cssClass="form-control" />
		<form:errors path="memId" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">주요활동명</label>
		<form:input path="actName" type="text" cssClass="form-control" />
		<form:errors path="actName" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">주요활동종류</label>
		<form:input path="actCategory" type="text" cssClass="form-control" />
		<form:errors path="actCategory" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">주요활동기관</label>
		<form:input path="actInstitution" type="text" cssClass="form-control" />
		<form:errors path="actInstitution" element="span"
			cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">주요활동기간</label>
		<form:input path="actPeriod" type="text" cssClass="form-control" />
		<form:errors path="actPeriod" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">주요활동 작성날짜</label>
		<form:input path="actInsertDate" type="date" cssClass="form-control" />
		<form:errors path="actInsertDate" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">주요활동 삭제날짜</label>
		<form:input path="actDeleteDate" type="date" cssClass="form-control" />
		<form:errors path="actDeleteDate" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">첨부파일아이디</label>
		<form:input path="attId" type="number" cssClass="form-control" />
		<form:errors path="attId" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<input type="submit" value="저장" /> 
		<input type="reset" value="취소" />		
	</div>
</form:form>