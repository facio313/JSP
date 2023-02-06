<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>INY &mdash; I Need You</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/quill.snow.css" />

  <!-- MAIN CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
  <!-- boardLayout CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <!-- board CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/totalBoard.css" />
  <!-- boardLayout CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/interview2.css" />
</head>

<body id="top">
  <!-- HOME -->
  <section class="section-hero overlay inner-page bg-image" style="background-image: url('${pageContext.request.contextPath}/resources/images/hero_1.jpg');"
    id="home-section">
    <div class="container">
      <div class="row">
        <div class="col-md-7">
          <h1 class="text-white font-weight-bold">홈</h1>
          <div class="custom-breadcrumbs">
            <a href="#">Community</a> <span class="mx-2 slash">/</span> <span
              class="text-white"><strong>Home</strong></span>
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
          <input type="hidden" name="qna_action" value="index" id="qna_action">
          <input type="hidden" name="keyword" value="" id="keyword">
          <input type="hidden" name="csn" value="" id="csn">
          <div class="contents_container">

            <div class="wrap_area_left">
              <div class="wrap_story_panel">
                <div class="qna_search">
                  <h3 class="title">
                    <a href="#" class="link_go">실시간 전체글 <span class="count">52,473</span>개</a>
                  </h3>

                  <!-- 검색 시작 -->
                  <div class="search_form">
                    <div class="box_search">
                      <div class="input_keyword">
                        <input type="text" name="input_keyword" id="input_keyword" value=""
                          placeholder="다른 사람들은 어떤 이야기를 할까?" class="inpTypo" title="키워드, 기업명 입력">
                        <button type="button" class="spr btn_search">
                          <svg class="icon_search">
                            <use xlink:href="#svg_my_8"></use>
                          </svg>
                        </button>
                      </div>
                      <div class="auto_complete_keyword">
                        <div class="wrap_scroll">
                          <div class="scrollbar disable" style="height: 0px;">
                            <div class="track" style="height: 0px;">
                              <div class="thumb">
                                <div class="end"></div>
                              </div>
                            </div>
                          </div>
                          <div class="viewport">
                            <div class="overview" style="top: 0px;">
                              <ul style="display:block">
                              </ul>
                              <p class="no_result" style="display:block">자동완성 검색어가 없습니다</p>
                            </div>
                          </div>
                        </div>
                        <div class="util">
                          <button class="btn_close">닫기</button>
                        </div>
                      </div>
                    </div>
                    <div class="" style="display:none">
                      <svg xmlns="http://www.w3.org/2000/svg">
                        <symbol id="svg_my_8" viewBox="0 0 24 24">
                          <path fill="currentColor"
                            d="M7 0c3.866 0 7 3.134 7 7 0 1.756-.647 3.36-1.714 4.59l.068.056 3.394 3.395c.195.195.195.511 0 .707-.174.173-.443.193-.638.058l-.07-.058-3.394-3.394-.056-.068C10.36 13.353 8.756 14 7 14c-3.866 0-7-3.134-7-7s3.134-7 7-7zm0 1C3.686 1 1 3.686 1 7s2.686 6 6 6 6-2.686 6-6-2.686-6-6-6z"
                            transform="translate(-1125 -399) translate(447 335) translate(678 64) translate(4 4)">
                          </path>
                        </symbol>
                      </svg>
                    </div>
                  </div>
                </div>

                <!-- 인기글 -->
                <div class="wrap_section wrap_best_story">
                  <div class="section_inner">
                    <div class="wrap_title">
                      <h4 class="title">
                        <a href="#" class="link_go" onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_qst_more')">
                          <b class="hot">HOT</b> 이번주 전체 인기 글 🔥
                        </a>
                      </h4>
                      <a href="#" class="link_more"
                        onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_qst_more')">더보기</a>
                    </div>

                    <ul class="list_story">
                      <li>
                        <a href="#" class="link" onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_qst')">
                          <span class="txt_subject">이력서 90군데를 넣었다.,</span>
                        </a>
                        <div class="util">
                          <span class="reply">6</span>
                          <span class="views">1,176</span>
                        </div>
                      </li>
                      <li>
                        <a href="#" class="link" onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_qst')">
                          <span class="txt_subject">중소 회계업무 입사 1년째인데 원래 이런건가요 이게 맞나요...?ㅠㅠ</span>
                        </a>
                        <div class="util">
                          <span class="reply">3</span>
                          <span class="views">559</span>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>


                <div class="wrap_section wrap_community_topic">
                  <div class="wrap_title">
                    <h3 class="main_tit">
                      주제별 커뮤니티
                    </h3>
                  </div>

                  <div class="wrap_slide_category">
                    <div class="bx-wrapper" style="max-width: 1374px;">
                      <div class="bx-viewport" aria-live="polite"
                        style="width: 100%; overflow: hidden; position: relative; height: 50px;">
                        <ul class="list_category js-category"
                          style="width: 11215%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                          <li aria-hidden="false"
                            style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
                            <a class="item_cate selected" href="#"
                              onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_tag')">
                              전체글
                            </a>
                          </li>
                          <li aria-hidden="false"
                            style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
                            <a class="item_cate" href="#" onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_tag')">
                              신입 </a>
                          </li>
                          <li aria-hidden="false"
                            style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
                            <a class="item_cate" href="#" onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_tag')">
                              취준 </a>
                          </li>
                          <li aria-hidden="false"
                            style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
                            <a class="item_cate" href="#" onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_tag')">
                              채용공고 </a>
                          </li>
                          <li aria-hidden="false"
                            style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
                            <a class="item_cate" href="#" onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_tag')">
                              자소서 </a>
                          </li>
                          <li aria-hidden="false"
                            style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
                            <a class="item_cate" href="#" onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_tag')">
                              면접 </a>
                          </li>
                          <li aria-hidden="true"
                            style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
                            <a class="item_cate" href="#" onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_tag')">
                              Q&amp;A </a>
                          </li>
                          <li aria-hidden="true"
                            style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
                            <a class="item_cate" href="#" onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_tag')">
                              커리어 </a>
                          </li>
                          <li aria-hidden="true"
                            style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
                            <a class="item_cate" href="#" onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_tag')">
                              이직 </a>
                          </li>
                          <li aria-hidden="true"
                            style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
                            <a class="item_cate" href="#" onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_tag')">
                              퇴사 </a>
                          </li>
                          <li aria-hidden="true"
                            style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
                            <a class="item_cate" href="#" onmousedown="SEARCH.Main.gaEvent('main_qst', 'hot_tag')">
                              잡담 </a>
                          </li>
                        </ul>
                      </div>
                      <div class="bx-controls bx-has-controls-direction">
                        <div class="bx-controls-direction"><button type="button" class="bx-prev disabled"><span
                              class="blind">이전</span></button><button type="button" class="bx-next"><span
                              class="blind">다음</span></button>
                        </div>
                      </div>
                    </div>
                  </div>


                  <div class="community_list">
                    <div class="section_inner">
                      <div class="wrap_title">
                        <h4 class="title">
                          <a href="#" class="link_go" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_1')">전체글</a>
                        </h4>
                        <a href="#" class="link_more" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_1')">더보기</a>
                      </div>

                      <ul class="list_story">
                        <li>
                          <a href="#" class="link" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_1')">
                            <span class="txt_subject">만 33세 여자 아 나이가 많은가 .</span>
                          </a>
                          <div class="util">
                            <span class="reply">14</span>
                          </div>
                        </li>
                      </ul>
                    </div>

                    <div class="section_inner">
                      <div class="wrap_title">
                        <h4 class="title">
                          <a href="#" class="link_go" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_2')">신입</a>
                        </h4>
                        <a href="#" class="link_more" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_2')">더보기</a>
                      </div>

                      <ul class="list_story">
                        <li>
                          <a href="/zf_user/company-review-qst-and-ans/detail-page?qust_idx=66362" class="link"
                            onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_2')">
                            <span class="txt_subject">근로계약서 미작성 신고가능한가요?</span>
                          </a>
                          <div class="util">
                            <span class="reply">0</span>
                          </div>
                        </li>
                      </ul>
                    </div>

                    <div class="section_inner">
                      <div class="wrap_title">
                        <h4 class="title">
                          <a href="#" class="link_go" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_3')">취준</a>
                        </h4>
                        <a href="#" class="link_more" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_3')">더보기</a>
                      </div>
                      <ul class="list_story">
                        <li>
                          <a href="#" class="link" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_3')">
                            <span class="txt_subject">경기권 대학/전문대 교직원 스펙</span>
                          </a>
                          <div class="util">
                            <span class="reply">0</span>
                          </div>
                        </li>
                      </ul>
                    </div>

                    <div class="section_inner">
                      <div class="wrap_title">
                        <h4 class="title">
                          <a href="#" class="link_go" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_4')">채용공고</a>
                        </h4>
                        <a href="#" class="link_more" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_4')">더보기</a>
                      </div>
                      <ul class="list_story">
                        <li>
                          <a href="#" class="link" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_4')">
                            <span class="txt_subject">대두식품</span>
                          </a>
                          <div class="util">
                            <span class="reply">3</span>
                          </div>
                        </li>
                      </ul>
                    </div>

                    <div class="section_inner">
                      <div class="wrap_title">
                        <h4 class="title">
                          <a href="#" class="link_go" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_5')">자소서</a>
                        </h4>
                        <a hhref="#" class="link_more" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_5')">더보기</a>
                      </div>
                      <ul class="list_story">
                        <li>
                          <a href="#" class="link" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_5')">
                            <span class="txt_subject">입사지원서에서 기존의 레이아웃의 범위를 넘지 않는 선이 뭔가요??ㅠ</span>
                          </a>
                          <div class="util">
                            <span class="reply">0</span>
                          </div>
                        </li>

                      </ul>
                    </div>

                    <div class="section_inner">
                      <div class="wrap_title">
                        <h4 class="title">
                          <a href="#" class="link_go" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_6')">면접</a>
                        </h4>
                        <a href="#" class="link_more" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_6')">더보기</a>
                      </div>
                      <ul class="list_story">
                        <li>
                          <a href="#" class="link" onmousedown="SEARCH.Main.gaEvent('main_qst', 'topic_6')">
                            <span class="txt_subject">법무법인 대륜 수원지사 면접 보신분들 있나요 ?</span>
                          </a>
                          <div class="util">
                            <span class="reply">0</span>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>

                </div>
              </div>

              <!-- 공지사항 -->
              <div class="wrap_section manager_voice">
                <div class="main_tit">운영자 확성기</div>
                <div class="wrap_megaphone">
                  <div class="wrap_box_notice">
                    <div class="wrap_box_notice" style="max-width: 100%;">
                      <div class="bx-viewport" aria-live="polite"
                        style="width: 100%; overflow: hidden; position: relative; height: 301px;">
                        <ul class="box_notice"
                          style="width: 2215%; position: relative; transition-duration: 0s; transform: translate3d(-600px, 0px, 0px);">
                          <li class="box_el notice bx-clone"
                            style="float: left; list-style: none; position: relative; width: 300px;" aria-hidden="true">
                            <div class="tit_category">공지</div>
                            <div class="tit">[커뮤니티 이용 규칙]</div>
                            <p class="txt">커뮤니티는 다양한 주제로 여러 사용자가 소통할 수 있는 공간입니다.
                              사용자의 원활한 서비스 이용을 위해 아래의 커뮤니티 이용 기준을 제정하여 운영하고 있습니다.

                              아래의 기준에 해당하면 운영자에 의해 게시물이 삭제될 수 있고,
                              해당 내용을 지속해서 반복하는 사용자에게는 일정한 제재가 이루어질 수 있습니다.

                              : 타인의 명의를 도용한 게시물 및 댓글
                              : 내용 중 욕설, 음란성 내용이 포함된 게시물 및 댓글
                              : 상업적 광고의 성격이 포함된 게시물, 사이트 홍보나 구인·구직 게시물, 도배 의도성 게시물 및 댓글
                              : html, script 등을 사용한 게시물 중 서비스의 장애를 일으키는 게시물 및 댓글
                              : 다른 사용자의 게시물에 대한 직접적인 욕설과 인신공격 등 타인의 권리를 침해하는 내용을 포함한 게시물 및 댓글
                              : 전기통신 관계 법령 및 형사 관계 법령에 따른 국가기관 등의 삭제 등 요구가 있는 게시물 및 댓글
                              : 그 외 기타 커뮤니티의 주제나 목적에 맞지 않는 게시물이라고 판단되는 경우

                              올바르고 재미있는 커뮤니티가 될 수 있도록 진담이도 노력하겠습니다!
                              많은 이용 부탁드립니다 :-)</p>
                            <a href="/zf_user/company-review-qst-and-ans/detail-page?qust_idx=24214" class="go"
                              onmousedown="SEARCH.Main.gaEvent('main_qst', 'notice_card')">자세히 보기</a>
                          </li>
                          <li class="box_el worry"
                            style="float: left; list-style: none; position: relative; width: 300px;" aria-hidden="true">
                            <div class="tit_category">운영자 고민</div>
                            <div class="tit">현직자 조언 필요하죠? #프로전문가에게 답변 받자!</div>
                            <p class="txt">안녕하세요! 사람인 입니다 : )여러분의 질문에 명쾌한 해답을 줄&nbsp;현직 프로 전문가 3人을 소개합니다!1️⃣ 𝐏𝐑𝐎
                              𝐌𝐙팀장 이드래곤조언이
                              필요하신가용?알.잘.딱.깔.센! 현직 팀장님이 조언해 드려용!MZ팀장 이드래곤 바로가기👇http://saram.in/s/LeeDragon2️⃣ 𝐏𝐑𝐎 루키
                              메이커최고의 루키가 되고
                              싶나요?루키 메이커님과 이야기해 보세요!p.s 취뽀는 너굴맨만 믿으라구~ʕ•̫͡•ʔฅ루키 메이커 바로가기👇http://saram.in/s/Rookie3️⃣
                              𝐏𝐑𝐎 9년차 직장인
                              박네넵일하면서 답변하는 중!여러분의 질문을 기다립니다9년차 직장인 박네넵 바로가기👇http://saram.in/s/ParkYesYes𝐓𝐈𝐏. #프로전문가
                              해시태그를 넣으면 현직자
                              답변을 받을 수 있어요!사람인은 항상 여러분의&nbsp;성공적인 취업과 이직을 응원합니다🙏프로전문가 한눈에
                              확인하기👇http://saram.in/s/ProExpert</p>
                            <a href="/zf_user/company-review-qst-and-ans/detail-page?qust_idx=62086" class="go"
                              onmousedown="SEARCH.Main.gaEvent('main_qst', 'notice_card')">자세히 보기</a>
                          </li>
                          <li class="box_el notice"
                            style="float: left; list-style: none; position: relative; width: 300px;"
                            aria-hidden="false">
                            <div class="tit_category">공지</div>
                            <div class="tit">[커뮤니티 이용 규칙]</div>
                            <p class="txt">커뮤니티는 다양한 주제로 여러 사용자가 소통할 수 있는 공간입니다.
                              사용자의 원활한 서비스 이용을 위해 아래의 커뮤니티 이용 기준을 제정하여 운영하고 있습니다.

                              아래의 기준에 해당하면 운영자에 의해 게시물이 삭제될 수 있고,
                              해당 내용을 지속해서 반복하는 사용자에게는 일정한 제재가 이루어질 수 있습니다.

                              : 타인의 명의를 도용한 게시물 및 댓글
                              : 내용 중 욕설, 음란성 내용이 포함된 게시물 및 댓글
                              : 상업적 광고의 성격이 포함된 게시물, 사이트 홍보나 구인·구직 게시물, 도배 의도성 게시물 및 댓글
                              : html, script 등을 사용한 게시물 중 서비스의 장애를 일으키는 게시물 및 댓글
                              : 다른 사용자의 게시물에 대한 직접적인 욕설과 인신공격 등 타인의 권리를 침해하는 내용을 포함한 게시물 및 댓글
                              : 전기통신 관계 법령 및 형사 관계 법령에 따른 국가기관 등의 삭제 등 요구가 있는 게시물 및 댓글
                              : 그 외 기타 커뮤니티의 주제나 목적에 맞지 않는 게시물이라고 판단되는 경우

                              올바르고 재미있는 커뮤니티가 될 수 있도록 진담이도 노력하겠습니다!
                              많은 이용 부탁드립니다 :-)</p>
                            <a href="/zf_user/company-review-qst-and-ans/detail-page?qust_idx=24214" class="go"
                              onmousedown="SEARCH.Main.gaEvent('main_qst', 'notice_card')">자세히 보기</a>
                          </li>
                          <li class="box_el worry bx-clone"
                            style="float: left; list-style: none; position: relative; width: 300px;" aria-hidden="true">
                            <div class="tit_category">운영자 고민</div>
                            <div class="tit">현직자 조언 필요하죠? #프로전문가에게 답변 받자!</div>
                            <p class="txt">안녕하세요! 사람인 입니다 : )여러분의 질문에 명쾌한 해답을 줄&nbsp;현직 프로 전문가 3人을 소개합니다!1️⃣ 𝐏𝐑𝐎
                              𝐌𝐙팀장 이드래곤조언이
                              필요하신가용?알.잘.딱.깔.센! 현직 팀장님이 조언해 드려용!MZ팀장 이드래곤 바로가기👇http://saram.in/s/LeeDragon2️⃣ 𝐏𝐑𝐎 루키
                              메이커최고의 루키가 되고
                              싶나요?루키 메이커님과 이야기해 보세요!p.s 취뽀는 너굴맨만 믿으라구~ʕ•̫͡•ʔฅ루키 메이커 바로가기👇http://saram.in/s/Rookie3️⃣
                              𝐏𝐑𝐎 9년차 직장인
                              박네넵일하면서 답변하는 중!여러분의 질문을 기다립니다9년차 직장인 박네넵 바로가기👇http://saram.in/s/ParkYesYes𝐓𝐈𝐏. #프로전문가
                              해시태그를 넣으면 현직자
                              답변을 받을 수 있어요!사람인은 항상 여러분의&nbsp;성공적인 취업과 이직을 응원합니다🙏프로전문가 한눈에
                              확인하기👇http://saram.in/s/ProExpert</p>
                            <a href="/zf_user/company-review-qst-and-ans/detail-page?qust_idx=62086" class="go"
                              onmousedown="SEARCH.Main.gaEvent('main_qst', 'notice_card')">자세히 보기</a>
                          </li>
                        </ul>
                      </div>
                      <div class="bx-controls bx-has-controls-auto bx-has-pager">
                        <div class="bx-controls-auto">
                          <div class="bx-controls-auto-item"><button type="button" class="bx-start"><span
                                class="blind">재생</span></button></div>
                        </div>
                        <div class="bx-pager bx-default-pager">
                          <div class="bx-pager-item"><a href="" data-slide-index="0" class="bx-pager-link">1</a></div>
                          <div class="bx-pager-item"><a href="" data-slide-index="1" class="bx-pager-link active">2</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
            </div>


          </div>
        </div>
        <script>
          (function ($) {

            getCategoryQuestionList();

            // 자동완성 스크롤바
            $('.wrap_scroll').tinyscrollbar();

            // 운영자 확성기 - 공지
            $('.box_notice').bxSlider({
              auto: true,
              controls: false,
              autoControls: true,
              pager: true,
              startText: '<span class="blind">재생</span>',
              stopText: '<span class="blind">멈춤</span>',
              autoControlsCombine: true,
              wrapperClass: "wrap_box_notice",
              touchEnabled: (navigator.maxTouchPoints > 0)
            });

            // 운영자 확성기 이달의 답변 전문가
            $('.company_honest_qna .list_monthly_expert [class^="month"] .link').on('mouseenter', function () {
              $('.company_honest_qna .list_monthly_expert [class^="month"] .link.this_month').removeClass('active');
            });
            $('.company_honest_qna .list_monthly_expert [class^="month"] .link').on('mouseleave', function () {
              $('.company_honest_qna .list_monthly_expert [class^="month"] .link.this_month').addClass('active');
            });

            // 이번주 전체 인기 글
            $('.list_best_story').bxSlider({
              mode: 'vertical',
              auto: false,
              moveSlides: 5,
              maxSlides: 5,
              minSlides: 5,
              controls: true,
              autoControls: false,
              pager: false,
              infiniteLoop: false,
              hideControlOnEnd: true,
              prevText: '<span class="blind">이전</span>',
              nextText: '<span class="blind">다음</span>',
              wrapperClass: "wrap_best_story",
              touchEnabled: (navigator.maxTouchPoints > 0)
            });
            // 붐업! 나의 글
            $('.slide_left').bxSlider({
              auto: false,
              controls: false,
              autoControls: false,
              pager: false,
              speed: 100,
              prevText: '<span class="blind">이전</span>',
              nextText: '<span class="blind">다음</span>',
              wrapperClass: "wrap_slide_left",
              touchEnabled: (navigator.maxTouchPoints > 0)
            });

            function sliderDisableCheck() {
              if ($('.wrap_slide_category .bx-next').hasClass('disabled')) {
                $('.wrap_slide_category').addClass('category_end');
              } else {
                $('.wrap_slide_category').removeClass('category_end');
              }
            }
            $('.js-category').bxSlider({
              mode: 'horizontal',
              slideWidth: 114,
              moveSlides: 3,
              maxSlides: 35,
              minSlides: 5,
              slideMargin: 12,
              controls: true,
              pager: false,
              infiniteLoop: false,
              hideControlOnEnd: true,
              prevText: '<span class="blind">이전</span>',
              nextText: '<span class="blind">다음</span>',
              touchEnabled: (navigator.maxTouchPoints > 0),
              onSliderLoad: function () {
                sliderDisableCheck();
                $(this).removeClass('visible_hidden');
              },
              onSlideAfter: function () {
                sliderDisableCheck();
              }
            });

            function getCategoryQuestionList() {
              $.ajax({
                url: '/zf_user/company-review-qst-and-ans/get-category-question-list',
                type: "get",
                data: {},
                dataType: 'json',
                success: function (response) {
                  $('.community_list').html(response.innerHTML);
                }
              });
            }
          })(jQuery);
        </script>
        <script>
          var searchCodes = null;
          var params = null;
        </script>
        <script src="/js/company-review-qst-and-ans/Main.js?v=20230202163408" type="text/javascript"></script>
      </div>
    </div>
  </div>
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

	<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>
