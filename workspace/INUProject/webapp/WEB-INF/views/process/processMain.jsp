<%--
* [[개정이력(Modification Information)]]
* 수정일             수정자            수정내용
* ----------  ---------  -----------------
* 2023. 2. 15.      최경수            최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/help.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/layout.css">

<section class="section-hero home-section overlay inner-page bg-image"
	style="background-image: url('<%=request.getContextPath()%>/resources/images/hero_1.jpg');"
	id="home-section">
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<h1 class="text-white font-weight-bold">채용과정</h1>
				<div class="custom-breadcrumbs">
					<a href="#">My Page</a>
					<span class="mx-2 slash">/</span> 
					<span class="text-white">
						<strong>My Process</strong>
					</span>
				</div>
			</div>
		</div>
	</div>
</section>
  
<div class="top shadow-sm" style="height: 70px;">
	<h1>채용과정</h1>
</div>
<div class="bottom">
	${processList}
	<table>
		<thead>
			<tr>
				<th>제약사항</th>
				<th>세부공고아이디</th>
				<th>분류코드</th>
				<th>각 세부 공고의 각 과정 순번</th>
				<th>시작날짜</th>
				<th>종료날짜</th>
				<th>온라인, 대면 등</th>
				<th>기준만점</th>
				<th>각 과정별 점수 입증 관련 문서 업로드하는 첨부파일 아이디</th>
				<th>과정삭제날짜</th>
				<th>과정추가날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${processList}" var="process">
				<tr>
					<td>${process.processLimit}</td>
					<td>${process.daNo}</td>
					<td>${process.processCodeId}</td>
					<td>${process.processSn}</td>
					<td>${process.processStartDate}</td>
					<td>${process.processEndDate}</td>
					<td>${process.processWay}</td>
					<td>${process.processScore}</td>
					<td>${process.tblId}</td>
					<td>${process.processDeleteDate}</td>
					<td>${process.processInsertDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>



<div id="sri_section" class="  has_banner">
	<div id="sri_wrap">
      	<div id="content">
			<div class="wrap_help">
      			<!-- 리스트 영역 -->
				<div class="wrap_list_help">
              		<h2 class="tit_list_help">
         				<strong></strong> 공고 목록
                    </h2>
      				<!-- 도움말 리스트 -->
      				<ul class="list_help">
      					<c:choose>
		      				<c:when test="${not empty list}">
			      				<c:forEach items="${list}" var="anno">
			                        <li>
			                  			<dl>
			                      			<dt>
			                          			<button type="button" class="btn_close">
			                          				<span class="question">${anno.annoTitle }</span>
			                          			</button>
			                      			</dt>
			                      			<dd class="answer">
			                      				<c:forEach items="${anno.detailList}" var="detail">
				                      				<a href="${pageContext.request.contextPath}/process/form?daNo=${detail.daNo}">${detail.daNo}추가</a>
				                      				<a href="${pageContext.request.contextPath}/process/edit?daNo=${detail.daNo}">${detail.daNo}수정</a>
			                      				</c:forEach>
								      		</dd>	
			                      			<dd class="date1">시작일 : ${anno.annoDate }</dd>
			                      			<dd class="date2">종료일 : ${anno.annoStartdate }</dd>
			                      			<dd class="view">등록일 : ${anno.annoEnddate }</dd>
			                  			</dl>
			                  			<button type="button" class="close btn_close">접기<span></span></button>
			              			</li>
			      				</c:forEach>
		      				</c:when>
		      				<c:otherwise>
		      					<li>
		      						<dl>
		      							<dt>공고글 없음</dt>
		      							<dd>올라온 공고글이 없습니다.</dd>
		      						</dl>
		      					</li>
		      				</c:otherwise>
	      				</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	var $list = jQuery('.list_help'),
	  $li = jQuery('> li', $list);
	
	$list.on('click', '.btn_close', function () {
	  var $this = jQuery(this).closest('li');
	  if ($this.hasClass('select')) {
	      $this.removeClass('select');
	  } else {
	      $li.removeClass('select');
	      $this.addClass('select');
	  }
	});
</script>