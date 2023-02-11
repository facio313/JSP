<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<title>INY &mdash; I Need You</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Free-Template.co" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/ftco-32x32.png">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom-bs.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- layout CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<!-- board CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<!-- pattern CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/pattern.css" />
<!-- pattern CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/components.css" />

</head>

<body id="top">
	<!--  <div id="overlayer"></div>
    <div class="site-wrap"> -->

	<!-- HOME -->
	<section class="section-hero overlay inner-page bg-image"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/hero_1.jpg');"
		id="home-section">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1 class="text-white font-weight-bold">상세보기</h1>
					<div class="custom-breadcrumbs">
						<a href="#">Community</a> <span class="mx-2 slash">/</span> <span
							class="text-white"><strong>Detail Board</strong></span>
					</div>
					<div class="custom-breadcrumbs"></div>
				</div>
			</div>
		</div>
	</section>

	<!-- 여기에 작성 -->
	<div id="sri_section" class=" layout_full ">
		<div id="sri_wrap">
			<div id="content">
				<div class="company_honest_qna">
					<div class="contents_container detail_wrap">
						<a href="${pageContext.request.contextPath }/board/boardTotal"
							class="btn_back_list"
							onmousedown="DETAILPAGE.Detail.gaEvent('qst_detail', 'resume_total')">전체
							게시글</a>

						<!-- 게시글 보기 -->
						<div class="post_view_wrap">
							<!-- 게시글 상단 -->
							<div class="post_top">
								<h1 class="qna_subject">${board.boardTitle }</h1>

								<!-- 내가 쓴 글이라면 하단의 div태그를 띄우고 아니라면 상단의 div 태그를 띄운다. -->

								<!-- <div class="post_btns">
										<button type="button" class="btns btnSizeXS colorGrayReverse" onclick="window.login()">신고</button>
									</div> -->
								<div class="post_btns">

									<c:url value="/board/boardUpdate" var="viewURL">
										<c:param name="what" value="${board.boardNo }" />
									</c:url>
									<a
										href="${viewURL}"
										class="btns btnSizeXS colorBlueReverse">수정</a>

									<!-- <button type="button toolTipWrap"
										class="btns  btnSizeXS colorGrayReverse"
										onclick="DETAILPAGE.Detail.myQnaContentsDelete('66118', 'qust')">삭제</button> -->

										<form action="${pageContext.request.contextPath}/board/boardDelete"
											method="post" class="btns  btnSizeXS colorGrayReverse">
											<input type="hidden" name="boardNo" value="${board.boardNo }"/>
												<button type="submit">삭제</button>
										</form>



									<!-- <div class="toolTip top_center" style="display: none;">
										<span class="tail"></span>
										<div class="toolTipCont">
											회원님들 참고해주세요~<br> 댓글이 등록된 이후에는 작성한<br> 글을 삭제하실 수
											없습니다!
										</div>
										<button type="button" class="btnClose delete_tool_tip_close">
											<span class="blind">닫기</span>
										</button>
									</div> -->

								</div>
							</div>
							<!-- // 게시글 상단 -->

							<!-- 게시글 정보 -->
							<div class="post_infos">
								<div class="post_profile">
									<div class="profile_pic_wrap"
										onmousedown="DETAILPAGE.Detail.gaEvent('qst_detail', 'profile')">
										<a href="#" target="_blank"><div
												class="profile_pic profile1"></div></a>
									</div>
									<a href="#" target="_blank"> <span class="nickname">${board.memId }</span></a>
									<span class="post_date">${board.boardDate } 작성</span>
								</div>
								<div class="post_data_wrap">
									<span class="qna_info qna_like likeTotalCount">8</span> <span
										class="qna_info qna_reply">9</span>
								</div>
							</div>

							<!-- // 게시글 정보 -->

							<!-- 게시글 내용 -->
							<div class="post_cont">
								<div>${board.boardContent }</div>
							</div>
							<!-- // 게시글 내용 -->

							<!-- 게시글 이모티콘 -->
							<ul class="post_emoticon">
								<li>
									<button type="button" class="like "
										onclick="DETAILPAGE.Detail.likeBtnClick(this, '8703', 'qust', 'like')">
										<span class="sympathy_result">좋아요<br> <strong>${board.boardLike }</strong></span>
									</button>
								</li>
								<li>
									<button type="button" class="fun "
										onclick="DETAILPAGE.Detail.likeBtnClick(this, '8703', 'qust', 'fun')">
										<span class="sympathy_result">재밌어요<br> <strong>${board.boardFun }</strong></span>
									</button>
								</li>
								<li>
									<button type="button" class="help "
										onclick="DETAILPAGE.Detail.likeBtnClick(this, '8703', 'qust', 'help')">
										<span class="sympathy_result">도움돼요<br> <strong>${board.boardHelp }</strong></span>
									</button>
								</li>
								<li>
									<button type="button" class="cheer "
										onclick="DETAILPAGE.Detail.likeBtnClick(this, '8703', 'qust', 'cheer')">
										<span class="sympathy_result">힘내요<br> <strong>${board.boardCheer }</strong></span>
									</button>
								</li>
							</ul>
							<!-- // 게시글 이모티콘 -->
						</div>
						<!-- // 게시글 보기 -->


						<!-- 댓글 등록 -->
						<div class="comment_input_wrap" onclick="window.login();">
							<div class="comment_input img_add">
								<textarea class="scrollbar"
									placeholder="“나도 이런 고민했었지, 라떼는 말이야~” 위 고민과 같은 경험이 있거나, 알고 계신 정보가 있다면 조언 부탁드려요!"
									disabled="">
									</textarea>
							</div>
							<div class="comment_input_bot">
								<div class="image_add_wrap">
									<button type="button" class="btn_image_add"
										onclick="window.login();">이미지첨부</button>
									*최대 1개 ( <em>jpg, png, gif</em>만 가능 )
								</div>
								<span class="comment_count"> <em>0</em>/1000자
								</span>
							</div>
							<button type="button" class="btnSizeL comment_submit"
								onclick="window.login();">댓글 등록</button>
						</div>


						<!-- 댓글 정렬 -->
						<div class="comment_lists_wrap" id="qna_answer_box">
							<div class="comment_lists_sort">
								<div class="inpSel">
									<select id="replySort" name="replySort" title="댓글 정렬 선택">
										<option value="last" selected="">최신 댓글순</option>
										<option value="like">인기 댓글순</option>
									</select>
								</div>
							</div>

							<div class="list_answer paywall">
								<ul class="comment_lists">

									<!-- 삭제된 댓글 -->
									<!-- <li>
											<div class="comment_view delete">
												<span class="comment_txt"> 댓글이 삭제되었습니다 </span>
											</div>

											<div class="comment_reply_wrap list_reply">
												<div id="list_reply_785062"></div>
											</div>

										</li> -->

									<li>
										<div class="wrap_comment ">
											<div class="comment_view">
												<span class="comment_txt">난 면접볼때 함수 머쓸줄아냐하는데 순간 뻥지던데
													ㅎ 이해가안됐음 함수를다룰줄아냐도 아니고 어떤함수를쓰냐기에 </span>
												<div class="comment_data_wrap">
													<button type="button" class="comment_data comment_like "
														onclick="window.login()">9</button>
													<button type="button" class="comment_data comment_reply "
														onclick="window.login();">
														대댓글달기 <strong>1</strong>
													</button>
												</div>
												<div class="comment_info">


													<span class="comment_from"> <span class="nickname">닉네임
													</span>님이 2021.07.28 작성
													</span>
													<div class="profile_pic_wrap">
														<a href="#" target="_blank">
															<div class="profile_pic profile1">
																<svg>
																		<use xlink:href="#"></use>
																	</svg>
															</div>
														</a>
													</div>
												</div>
											</div>
										</div>

										<button type="button" class="btn_comment_etc">수정 및 삭제</button>
										<div class="comment_modify_wrap">
											<button class="btn_comment_mnd comment_report"
												onmousedown="window.login()">신고</button>
											<button class="btn_comment_mnd comment_report"
												onmousedown="window.login()">사용자 신고</button>
										</div> <!-- 대댓글 -->

										<div class="comment_reply_wrap list_reply">
											<div id="list_reply_762068">
												<div class="comment_view ">
													<span class="comment_txt"> 엑셀에서 중요한 건 데이터를 취합하고 정리하는
														능력이지만, 이건 수치적으로 알 수 있는 질문이 아니기 때문에.... 어떤 함수 써봤는지 물어보게
														되더라고요... 이상 함수 뭐 쓸 줄 아냐고 물어본 1인... </span>

													<div class="comment_data_wrap">
														<button type="button" class="comment_data comment_like "
															onclick="window.login()">5</button>
													</div>

													<div class="comment_info">
														<span class="comment_from"> <span class="nickname"
															data-reg_mem_idx="14571806"> 닉네임 </span> 님이 2022.02.22 작성
														</span>
														<div class="profile_pic_wrap">
															<a href="#" target="_blank">
																<div class="profile_pic profile1">
																	<svg>
																			<use xlink:href="#"></use>
																		</svg>
																</div>
															</a>
														</div>
													</div>

													<button type="button" class="btn_comment_etc">수정 및
														삭제</button>
													<div class="comment_modify_wrap">
														<button class="btn_comment_mnd"
															onmousedown="window.login()">신고</button>
														<button class="btn_comment_mnd"
															onmousedown="window.login()">사용자 신고</button>
													</div>
												</div>
											</div>
										</div> <!-- // 대댓글 --> <!-- 대댓글/답글 입력 -->
										<div class="comment_reply_input">
											<div class="comment_write">
												<input type="text" name="reply_contents_762068"
													id="reply_contents_762068" value="" class=""
													placeholder="답변에 댓글을 입력해 보세요.">
											</div>
											<button type="button" class="btn_post  comment_reply_submit"
												data-qust_idx="8703" data-call_mem_idx=""
												data-uper_anwr_idx="762068" onclick="window.login();">
												등록</button>
										</div> <!-- //대댓글/답글 입력 -->
									</li>

									<div class="add_list_answer_contents"></div>
								</ul>


								<!-- 댓글 더 있을 경우 -->
								<!-- <input type="hidden" name="answer_more_page" value="2"
										id="answer_more_page">
									<button class="btn_comments answer_more" data-qust_idx="8703"
										data-reply_sort=""
										onmousedown="DETAILPAGE.Detail.gaEvent('qst_detail', 'more_a')">
										<span>댓글 더보기</span>
									</button> -->

							</div>
						</div>


					</div>

				</div>
			</div>
		</div>

	</div>

	<!-- SCRIPTS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/stickyfill.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>