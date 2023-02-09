<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/quill.snow.css">
  <script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>

  <!-- MAIN CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
  <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">

<style>
.qna_write_wrap .qna_write_selection {
	padding: 0 0 22px;
}
</style>
</head>

<bo id="top">
  <div id="overlayer"></div>

  <!-- HOME -->
  <section class="section-hero overlay inner-page bg-image"
    style="background-image: url('${pageContext.request.contextPath}/resources/images/hero_1.jpg');" id="home-section">
    <div class="container">
      <div class="row">
        <div class="col-md-7">
          <h1 class="text-white font-weight-bold">작성하기</h1>
          <div class="custom-breadcrumbs">
            <a href="#">Community</a> <span class="mx-2 slash">/</span> <span class="text-white"><strong>Write
                Interview</strong></span>
          </div>
          <div class="custom-breadcrumbs"></div>
        </div>
      </div>
    </div>
  </section>

  <section class="site-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-lg-12">
					<form enctype="multipart/form-data"
						class="p-4 p-md-5 border rounded" method="post">
						<div class="qna_write_wrap">
							<div class="qna_write_selection">
								<span class="qna_category_tit">카테고리</span>
								<div class="box_qna_category">
									<button type="button" class="btn_category_select">전체</button>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="job-title">직무명</label>
							<input class="form-control" id="job-title" name="jobName" placeholder="직무명을 입력해주세요" />
						</div>

						<div class="form-group">
							<label for="job-title">부서명</label>
							<input class="form-control" id="job-title" name="department" placeholder="부서명을 입력해주세요" />
						</div>


						<div class="form-group">
							<label for="job-title">작성자</label>
							<input class="form-control" id="job-title" name="incumName" placeholder="작성자를 입력해주세요" />
						</div>

						<div class="form-group">
							<label for="job-title">제목</label>
							<input class="form-control" id="job-title" name="incumTitle" placeholder="제목을 입력해주세요" />
						</div>

						<div class="form-group">
							<label for="job-title">서브제목</label>
							<input class="form-control" id="job-title" name="subTitle" placeholder="서브제목을 입력해주세요" />
						</div>

						<div class="form-group">
						<label for="job-description"></label>
						<textarea rows="20" cols="30" name=incumContent class="editor form-control" id="editor-1"></textarea>
						</div>

						<div class="form-group">
							<label for="company-website-tw d-block">이미지를 첨부하려면 클릭하세요</label><br>
							<label class="btn btn-primary btn-md btn-file">이미지첨부<input
								type="file"></label>
						</div>
						<div class="row align-items-center mb-5">

							<div class="col-lg-4 ml-auto">
								<div class="row">
									<div class="col-6">
										<button type="submit" class="btn btn-block btn-primary btn-md">게시글
											등록</button>
									</div>
									<div class="col-6">
										<a href="${pageContext.request.contextPath }/board/totalBoard"
											class="btn btn-block btn-primary btn-md">취소</a>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</section>

<!-- 저장경로 변경해야함! -->
<script>
CKED ITOR.replace('incumContent', {
	filebrowserUploadUrl: '${pageContext.request.contextPath}/board/boardImage.do?command=QuickUpload&type=Files&responseType=json'
	});
</script>


  <!-- SCRIPTS -->
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