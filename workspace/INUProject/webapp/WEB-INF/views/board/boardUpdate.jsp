<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<head>
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/quill.snow.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">

<style>
.qna_write_wrap .qna_write_selection {padding: 0 0 22px;}
.ck-editor__editable { height: 400px; }
.ck-content { font-size: 15px; }
</style>
</head>

<body id="top">
	<div id="overlayer"></div>
<!-- 작성 -->
	<section class="site-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-lg-12">
					<form:form enctype="multipart/form-data" class="p-4 p-md-5 border rounded" method="post" modelAttribute="board">
						<div class="qna_write_wrap">
							<div class="qna_write_selection">
								<span class="qna_category_tit">카테고리</span>
								<div class="box_qna_category">
									<div class="inpSel">
										<select id="replySort" name="replySort" title="글 선택">
											<option value="전체글" selected="selected">전체글</option>
											<option value="신입">신입</option>
											<option value="취준">취준</option>
											<option value="채용공고">채용공고</option>
											<option value="자소서">자소서</option>
											<option value="면접">면접</option>
											<option value="Q&amp;A">Q&amp;A</option>
										</select>
									</div>
								</div>
							</div>
						</div>

						<form:input type="hidden" path="boardNo"/>
						<div class="form-group">
							<label for="job-title"></label>
							<form:input class="form-control" id="job-title" path="boardTitle" placeholder="제목을 입력해주세요" />
						</div>

						<div class="form-group">
							<label for="job-description"></label>
							<form:textarea path="boardContent" class="form-control" id="editor"></form:textarea>
						</div>

						<div class="form-group">
							<label for="company-website-tw d-block">이미지를 첨부하려면 클릭하세요</label><br>
							<label class="btn btn-primary btn-md btn-file">이미지첨부
							<input type="file"></label>
						</div>

						<div class="row align-items-center mb-5">
							<div class="col-lg-4 ml-auto">
								<div class="row">
									<div class="col-6">
										<button type="submit" class="btn btn-block btn-primary btn-md">게시글등록</button>
									</div>
									<div class="col-6">
										<a href="${pageContext.request.contextPath }/board/boardTotal" class="btn btn-block btn-primary btn-md">취소</a>
									</div>
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>

<!-- SCRIPTS -->
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>
  ClassicEditor.create( document.querySelector( '#editor' ), {
	/* removePlugins: [ 'Heading' ], */
    language: "ko"
  } );
</script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stickyfill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/quill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>