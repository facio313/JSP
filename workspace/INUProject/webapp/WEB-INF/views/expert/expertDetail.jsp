<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 1.      허근주      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	<!-- 바디 영역 -->
   

<div class="site-wrap" >

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->
    


   

    <section class="pb-0 portfolio-single"  id="next-section" style="padding-top: 100px;">

      <div class="container" style="background-color: white;">
        <div class="row align-items-center mb-5">
          <div class="col-lg-8 mb-4 mb-lg-0">
            <div class="d-flex align-items-center">
              <div class="border p-2 d-inline-block mr-3 rounded">
                <img src="<%=request.getContextPath() %>/resources/images/우기1.jfif" alt="Image" style="max-width:70px;" >
              </div>
              <div>
                <h2>Product Designer</h2>
                <div>
                  <span class="ml-0 mr-2 mb-2"><span class="icon-briefcase mr-2"></span>Puma</span>
                  <span class="m-2"><span class="icon-room mr-2"></span>New York City</span>
                  <span class="m-2"><span class="icon-clock-o mr-2"></span><span class="text-primary">Full Time</span></span>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="row">
              <div class="col-6">
                <a href="#" class="btn btn-block btn-light btn-md"><span class="icon-heart-o mr-2 text-danger"></span>Save Job</a>
              </div>
              <div class="col-6">
                <a href="#" class="btn btn-block btn-primary btn-md">Apply Now</a>
              </div>
            </div>
          </div>
        </div>
        <div class="row mb-5 mt-5">

          <div class="col-lg-8">
            <h2>상세설명</h2>
            <figure>
              <a href="resources/images/sq_img_6.jpg" data-fancybox="gallery"><img src="<%=request.getContextPath() %>/resources/images/우기1.jfif" alt="Image" class="img-fluid"></a>
            </figure>
            <h2>판매자 정보</h2>
            <figure>
              <a href="resources/images/sq_img_2.jpg" data-fancybox="gallery"><img src="<%=request.getContextPath() %>/resources/images/우기1.jfif" alt="Image" class="img-fluid"></a>
            </figure>
            <h2>상품정보 제공 고시</h2>
            <figure>
              <a href="resources/images/sq_img_7.jpg" data-fancybox="gallery"><img src="<%=request.getContextPath() %>/resources/images/우기1.jfif" alt="Image" class="img-fluid"></a>
            </figure>
            <figure class="mb-0">
              <a href="resources/images/sq_img_8.jpg" data-fancybox="gallery"><img src="<%=request.getContextPath() %>/resources/images/우기1.jfif" alt="Image" class="img-fluid"></a>
            </figure>
            
          </div>

          <div class="col-lg-4 ml-auto h-100 jm-sticky-top" style="top: 150px;">
           

            <div class="mb-4">
              <h3 class="mb-4 h4 border-bottom">가격</h3>
              
              <p class="mb-0">찜</p>
            </div>

            <div class="row mb-4">

              <div class="col-sm-12 col-md-12 mb-4 col-lg-12">
                <strong class="d-block text-black">기본 정보</strong>
                Google, Inc.
              </div>
              <div class="col-sm-12 col-md-12 mb-4 col-lg-12">
                <strong class="d-block text-black">방식</strong>
                Design, Front-End and Back-End (WordPress)
              </div>
              <div class="col-sm-12 col-md-12 mb-4 col-lg-12">
                <strong class="d-block text-black">유효기간</strong>
                2019
              </div>
              <div class="col-sm-12 col-md-12 mb-4 col-lg-12">
                <strong class="d-block text-black mb-3">구매</strong>
                <a href="<%=request.getContextPath() %>/expert/pay" class="btn btn-outline-primary border-width-2">구매하기</a>
              </div>
            </div>

            <div class="block__87154 mb-0">
                
                <blockquote>
                  <p>여러분과 함께하고 싶습니다</p>
                </blockquote>
                <div class="block__91147 d-flex align-items-center">
                  <figure class="mr-4"><img src="<%=request.getContextPath() %>/resources/images/우기1.jfif" alt="Image" class="img-fluid"></figure>
                  <div>
                    <h3>Chris Peter</h3>
                    <span class="position">Web Designer</span>
                  </div>
                </div>
              </div>

          </div>
        </div>

          

        
      </div>
    </section>



    <section class="site-section bg-light">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center" data-aos="fade">
            <a href="<%=request.getContextPath() %>/expert/review"><h2 class="section-title mb-3">후기</h2></a>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6">
            <div class="block__87154 bg-white rounded">
              <blockquote>
                <p>
                 너무 좋은 상담시간이였습니다.
                </p>
              </blockquote>
              <div class="block__91147 d-flex align-items-center">
                <figure class="mr-4">
                  <img
                    src="<%=request.getContextPath() %>/resources/images/아이유1.jfif"
                    alt="Image"
                    class="img-fluid"
                  />
                </figure>
                <div>
                  <h3>아이유</h3>
                  <span class="position">가수</span>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="block__87154 bg-white rounded">
              <blockquote>
                <p>
                  유익한 시간 정보 감사합니다.
                </p>
              </blockquote>
              <div class="block__91147 d-flex align-items-center">
                <figure class="mr-4">
                  <img
                    src="<%=request.getContextPath() %>/resources/images/아이유2.jfif"
                    alt="Image"
                    class="img-fluid"
                  />
                </figure>
                <div>
                  <h3>아이유
                  </h3>
                  <span class="position">가수</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class=" py-3 site-section mb-5">
      <div class="container">
        <div class="row">
          <div class="col-md-4 text-center">
            <a href="#" class="btn btn-md btn-outline-primary border-width-2 d-block">Previous Project</a>
          </div>
          <div class="col-md-4 text-center">
            <a href="#" class="btn btn-md btn-primary border-width-2 d-block">All Projects</a>
          </div>
          <div class="col-md-4 text-center">
            <a href="#" class="btn btn-md btn-outline-primary border-width-2 d-block">Next Project</a>
          </div>
        </div>
      </div>
    </section>
    
  </div> 
 

