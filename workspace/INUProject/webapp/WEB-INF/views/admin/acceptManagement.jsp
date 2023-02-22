<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/pattern.css" />  
<style>
  .wrap_community_topic .section_inner {
    width: 49%;
  }
  .company_honest_qna .contents_container {
    width: 95%;
}
</style>
    

<div id="sri_section" class="layout_full">
	<div id="sri_wrap">
		<div id="content">
			<div class="company_honest_qna">
				<div class="contents_container">
					<div class="wrap_story_panel">
						<div class="wrap_section wrap_community_topic" style="margin-top: 36px;">
							<div class="wrap_title">
								<h3 class="main_tit">주제별 승인관리</h3>
							</div>
							<div class="wrap_slide_category">
								<div class="bx-wrapper" style="max-width: 1374px">
									<div class="bx-viewport" aria-live="polite" style=" width: 100%; overflow: hidden; position: relative; height: 50px;">
										<ul class="list_category js-category" style=" width: 11215%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                        					<li aria-hidden="false" style=" float: left; list-style: none; position: relative; width: 235px; margin-right: 12px;">
                          						<a class="item_cate selected" href="<c:url value='/systemManagement/acceptManagement/acceptGeneralIncruiterList'/>">
													기업총괄회원 승인대기목록
												</a>
											</li>
											<li aria-hidden="true" style=" float: left; list-style: none; position: relative; width: 235px; margin-right: 12px;">
												<a class="item_cate" href="">
													기업등록 승인대기목록
												</a>
											</li>
											<li aria-hidden="true" style=" float: left; list-style: none; position: relative; width: 235px; margin-right: 12px;">
												<a class="item_cate" href="">
													전문가 승인대기목록
												</a>
											</li>
											<li aria-hidden="true" style=" float: left; list-style: none; position: relative; width: 235px; margin-right: 12px;">
												<a class="item_cate" href="">
													상품 승인대기목록
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
                			<div class="community_list">
                  				<div class="section_inner">
                    				<div class="wrap_title">
                      					<h4 class="title">
                        					<a href="<c:url value='/systemManagement/acceptManagement/acceptGeneralIncruiterList'/>" class="link_go">
                        						기업총괄회원 승인대기목록
                        					</a>
                      					</h4>
                      					<a href="<c:url value='/systemManagement/acceptManagement/acceptGeneralIncruiterList'/>" class="link_more">
                      						더보기
                      					</a>
                    				</div>
                    				<ul class="list_story">
                      					<li>
                        					<a href="" class="link" >
                          						<span class="txt_subject">2월달에 10일까지 일하고 관뒀는데 급여</span>
                        					</a>
                      					</li>
                      					<li>
                        					<a href="" class="link">
                          						<span class="txt_subject">40중반에 퇴사했습니다. 제대로된 직장에 가려면 당장 뭘준비하는게 좋을까요?</span>
                        					</a>
                      					</li>
                      					<li>
                        					<a href="" class="link">
                          						<span class="txt_subject">제 스펙으로 대기업 생산직종에 들어갈수있을까요?</span>
                        					</a>
                      					</li>
                      					<li>
                        					<a href="" class="link">
                          						<span class="txt_subject">혹시 세미어패럴 이란 회사 아시는분요~</span>
                        					</a>
                      					</li>
                    				</ul>
                  				</div>
                  				<div class="section_inner">
                    				<div class="wrap_title">
                      					<h4 class="title">
                        					<a href="" class="link_go">
                        						기업등록 승인대기목록
                        					</a>
                      					</h4>
                      					<a href="" class="link_more">
                      						더보기
                    					</a>
                    				</div>
                    				<ul class="list_story">
                      					<li>
                        					<a href="" class="link">
                          						<span class="txt_subject">이것도 파견직 인가요?</span>
                        					</a>
                      					</li>
                      					<li>
                        					<a href="" class="link">
                          						<span class="txt_subject">이런경우에는 어떻게 해야하나요??</span>
                        					</a>
                      					</li>
                      					<li>
                        					<a href="" class="link">
                          						<span class="txt_subject">근로계약서 작성 후 출근 하루만 퇴사 고민</span>
                        					</a>
                      					</li>
                      					<li>
                        					<a href="" class="link">
                          						<span class="txt_subject">퇴사할때 뭐라고 말씀드리는게 좋을까요?</span>
                        					</a>
                      					</li>
                    				</ul>
                  				</div>
                  				<div class="section_inner">
                    				<div class="wrap_title">
                      					<h4 class="title">
                        					<a href="" class="link_go">
                        						전문가 승인대기목록
                        					</a>
                      					</h4>
                      					<a href="" class="link_more">
                      						더보기
                      					</a>
                    				</div>
                    				<ul class="list_story">
                      					<li>
                        					<a href="" class="link">
                          						<span class="txt_subject">취업이 이렇게 힘든가요?</span>
                        					</a>
                      					</li>
                      					<li>
                        					<a href="" class="link">
                          						<span class="txt_subject">자동차 에어컨 부품 조립</span>
                        					</a>
                      					</li>
                      					<li>
                        					<a href="" class="link">
                          						<span class="txt_subject">인테리어 설계 분야 쪽 고민입니다.</span>
                        					</a>
                      					</li>
                      					<li>
                        					<a href=""class="link">
                          						<span class="txt_subject">포지션매치 괜찮은가요?</span>
                        					</a>
                      					</li>
                    				</ul>
                  				</div>
                  				<div class="section_inner">
                    				<div class="wrap_title">
                      					<h4 class="title">
                        					<a href="" class="link_go">
                        						상품 승인대기목록
                       						</a>
                      					</h4>
                      					<a href="" class="link_more">
                      						더보기
                      					</a>
                    				</div>
                    				<ul class="list_story">
                      					<li>
                        					<a href="" class="link">
                          						<span class="txt_subject">광주 케이플러스손해사정 채용공고</span>
                        					</a>
                      					</li>
                      					<li>
                        					<a href="" class="link">
                          						<span class="txt_subject">해커스교육그룹</span>
                        					</a>
                      					</li>
                      					<li>
                        					<a href="" class="link">
                          						<span class="txt_subject">이진스 라는 회사 어떤곳인가요?</span>
                        					</a>
                      					</li>
                      					<li>
                        					<a href="" class="link">
                          						<span class="txt_subject">케이플러스손해사정 채용공고</span>
                        					</a>
                      					</li>
                    				</ul>
                  				</div>
                			</div>
              			</div>
           			</div>
        		</div>
      		</div>
    	</div>
  	</div>
</div>