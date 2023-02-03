<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* ${date}      양서연      최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/quill.snow.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

<!-- NAVBAR -->
<header class="site-navbar mt-3">
  <div class="container-fluid">
<!--     <div class="row align-items-center"> -->
<!--       <div class="site-logo col-6"><a href="index.html">필터쓰</a></div> -->
<!-- 			<h1 class="text-white font-weight-bold">필터쓰</h1> -->
<!--     </div> -->

  </div>
</header>

<!-- HOME -->
<section class="section-hero home-section overlay inner-page bg-image" style="background-image: url('resources/images/hero_1.jpg')" id="home-section">

 <div class="container">
   <div class="row align-items-center justify-content-center">
     <div class="col-md-12">
       <div class="mb-5 text-center">
         <h1 class="text-white font-weight-bold">JOB FILTER</h1>
         <p>조건 걸어서 검색해보자</p>
       </div>
       <form method="post" class="search-jobs-form">
         <div class="row mb-5">
           <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
             <select class="selectpicker" data-style="btn-white btn-lg" data-width="100%" data-live-search="true" title="Select Region">
               <option>Anywhere</option>
               <option>San Francisco</option>
               <option>Palo Alto</option>
               <option>New York</option>
               <option>Manhattan</option>
               <option>Ontario</option>
               <option>Toronto</option>
               <option>Kansas</option>
               <option>Mountain View</option>
             </select>
           </div>
           <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
             <select class="selectpicker" data-style="btn-white btn-lg" data-width="100%" data-live-search="true" title="Select Job Type">
               <option>Part Time</option>
               <option>Full Time</option>
             </select>
           </div>
           <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
             <input type="text" class="form-control form-control-lg" placeholder="Job title, Company...">
           </div>
           <div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
             <button type="submit" class="btn btn-primary btn-lg btn-block text-white btn-search">Search Job</button>
           </div>
         </div>
             <div>
			  <button class="btn btn-outline-dark" type="button" style="width: 200px; margin-right: 30px">Button</button>
			  <button class="btn btn-outline-dark" type="button" style="width: 200px; margin-right: 30px">Button</button>
			  <button class="btn btn-outline-dark" type="button" style="width: 200px; margin-right: 30px">Button</button>
			</div>
		   <div style="background-color: white; margin-top: 30px">dddd</div>
		   <div style="background-color: white;">dddd</div>
		   <div style="background-color: white;">dddd</div>
		   <div style="background-color: white;">dddd</div>
		   <div style="background-color: white;">dddd</div>
		   <div style="background-color: white;">dddd</div>
		   <div style="background-color: white;">dddd</div>
		   <div style="background-color: white;">dddd</div>
		   <div style="background-color: white;">dddd</div>
		   
         <div class="row" style="margin-top: 20px">
           <div class="col-md-12 popular-keywords">
             <h3>Trending Keywords:</h3>
             <ul class="keywords list-unstyled m-0 p-0">
               <li><a href="#" class="">UI Designer</a></li>
               <li><a href="#" class="">Python</a></li>
               <li><a href="#" class="">Developer</a></li>
             </ul>
           </div>
         </div>
       </form>
     </div>
   </div>
   
 </div>
 <a href="#next" class="scroll-button smoothscroll">
   <span class=" icon-keyboard_arrow_down"></span>
 </a>
</section>

<section class="site-section" id="next" style="background-color: white">
        <ul class="job-listings mb-5">
          
          <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center"  style="margin: 10px;" >
            <a href="${pageContext.request.contextPath}/announcement/1"></a>
            <div class="job-listing-logo">
              <img src="resources/images/job_logo_1.jpg" alt="Image" class="img-fluid">
            </div>

            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
              <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <h2>모집 공고 제목</h2>
                <strong>기업명</strong>
                <div>업종</div>
                <div>지역</div>
                <div>급여</div>
              </div>
              <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
                <span class="icon-room"></span>기업명<br>
<!--                 <span class="icon-room"></span> 별점<br> -->
<!--                 <span class="icon-room"></span> 지역<br> -->
<!--                 <span class="icon-room"></span> 급여<br> -->
              </div>
              <div class="job-listing-meta" >
                <span class="badge badge-danger">오늘 마감</span>
              </div>
            </div>
          </li>
          <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center" style="margin: 10px;" >
            <a href="${pageContext.request.contextPath}/announcement/1"></a>
            <div class="job-listing-logo">
              <img src="resources/images/job_logo_1.jpg" alt="Image" class="img-fluid">
            </div>

            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
              <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <h2>모집 공고 제목</h2>
                <strong>기업명</strong>
                <div>업종</div>
              </div>
              <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
                <span class="icon-room"></span> 지역<br>
                <span class="icon-room"></span> 별점<br>
                <span class="icon-room"></span> 급여<br>
              </div>
              <div class="job-listing-meta">
                <span class="badge badge-danger">D-7</span>
              </div>
            </div>
          </li>
          <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center"  style="margin: 10px;" >
            <a href="${pageContext.request.contextPath}/announcement/1"></a>
            <div class="job-listing-logo">
              <img src="resources/images/job_logo_1.jpg" alt="Image" class="img-fluid">
            </div>

            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
              <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <h2>모집 공고 제목</h2>
                <strong>기업명</strong>
                <div>월급 줄거고</div>
                <div>재택할거임</div>
                <div>신입모집</div>
              </div>
              <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
                <span class="icon-room"></span> 지역<br>
                <span class="icon-room"></span> 진행 날짜<br>
                <span class="icon-room"></span> 진행 날짜<br>
                <span class="icon-room"></span> 진행 날짜<br>
                <span class="icon-room"></span> 연봉
              </div>
              <div class="job-listing-meta">
                <span class="badge badge-success">D-7</span>
              </div>
            </div>
          </li>
          <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center"  style="margin: 10px;" >
            <a href="${pageContext.request.contextPath}/announcement/1"></a>
            <div class="job-listing-logo">
              <img src="resources/images/job_logo_1.jpg" alt="Image" class="img-fluid">
            </div>

            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
              <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <h2>모집 공고 제목</h2>
                <strong>기업명</strong>
                <div>월급 줄거고</div>
                <div>재택할거임</div>
                <div>신입모집</div>
              </div>
              <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
                <span class="icon-room"></span> 지역<br>
                <span class="icon-room"></span> 진행 날짜<br>
                <span class="icon-room"></span> 진행 날짜<br>
                <span class="icon-room"></span> 진행 날짜<br>
                <span class="icon-room"></span> 연봉
              </div>
              <div class="job-listing-meta">
                <span class="badge badge-success">D-7</span>
              </div>
            </div>
          </li>
          <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center"  style="margin: 10px;" >
            <a href="${pageContext.request.contextPath}/announcement/1"></a>
            <div class="job-listing-logo">
              <img src="resources/images/job_logo_1.jpg" alt="Image" class="img-fluid">
            </div>

            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
              <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <h2>모집 공고 제목</h2>
                <strong>기업명</strong>
                <div>월급 줄거고</div>
                <div>재택할거임</div>
                <div>신입모집</div>
              </div>
              <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
                <span class="icon-room"></span> 지역<br>
                <span class="icon-room"></span> 진행 날짜<br>
                <span class="icon-room"></span> 진행 날짜<br>
                <span class="icon-room"></span> 진행 날짜<br>
                <span class="icon-room"></span> 연봉
              </div>
              <div class="job-listing-meta">
                <span class="badge badge-success">D-7</span>
              </div>
            </div>
          </li>
          
          <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
            <a href="job-single.html"></a>
            <div class="job-listing-logo">
              <img src="resources/images/job_logo_2.jpg" alt="Image" class="img-fluid">
            </div>

            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
              <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <h2>Digital Marketing Director</h2>
                <strong>Sprint</strong>
              </div>
              <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
                <span class="icon-room"></span> Overland Park, Kansas 
              </div>
              <div class="job-listing-meta">
                <span class="badge badge-success">D-7</span>
              </div>
            </div>
          </li>

          <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
            <a href="job-single.html"></a>
            <div class="job-listing-logo">
              <img src="resources/images/job_logo_3.jpg" alt="Image" class="img-fluid">
            </div>

            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
              <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <h2>Back-end Engineer (Python)</h2>
                <strong>Amazon</strong>
              </div>
              <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
                <span class="icon-room"></span> Overland Park, Kansas 
              </div>
              <div class="job-listing-meta">
                <span class="badge badge-success">D-7</span>
              </div>
            </div>
          </li>

          <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
            <a href="job-single.html"></a>
            <div class="job-listing-logo">
              <img src="resources/images/job_logo_4.jpg" alt="Image" class="img-fluid">
            </div>

            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
              <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <h2>Senior Art Director</h2>
                <strong>Microsoft</strong>
              </div>
              <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
                <span class="icon-room"></span> Anywhere 
              </div>
              <div class="job-listing-meta">
                <span class="badge badge-success">D-7</span>
              </div>
            </div>
          </li>

          <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
            <a href="job-single.html"></a>
            <div class="job-listing-logo">
              <img src="resources/images/job_logo_5.jpg" alt="Image" class="img-fluid">
            </div>

            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
              <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <h2>Product Designer</h2>
                <strong>Puma</strong>
              </div>
              <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
                <span class="icon-room"></span> San Mateo, CA 
              </div>
              <div class="job-listing-meta">
                <span class="badge badge-success">D-7</span>
              </div>
            </div>
          </li>
          <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
            <a href="job-single.html"></a>
            <div class="job-listing-logo">
              <img src="resources/images/job_logo_1.jpg" alt="Image" class="img-fluid">
            </div>

            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
              <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <h2>Product Designer</h2>
                <strong>Adidas</strong>
              </div>
              <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
                <span class="icon-room"></span> New York, New York
              </div>
              <div class="job-listing-meta">
                <span class="badge badge-danger">D-7</span>
              </div>
            </div>
            
          </li>
          <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
            <a href="job-single.html"></a>
            <div class="job-listing-logo">
              <img src="resources/images/job_logo_2.jpg" alt="Image" class="img-fluid">
            </div>

            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
              <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <h2>Digital Marketing Director</h2>
                <strong>Sprint</strong>
              </div>
              <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25">
                <span class="icon-room"></span> Overland Park, Kansas 
              </div>
              <div class="job-listing-meta">
                <span class="badge badge-success">D-7</span>
              </div>
            </div>
          </li>

          

          
        </ul>

        <div class="row pagination-wrap">
          <div class="col-md-6 text-center text-md-left mb-4 mb-md-0">
            <span>Showing 1-7 Of 43,167 Jobs</span>
          </div>
          <div class="col-md-6 text-center text-md-right">
            <div class="custom-pagination ml-auto">
              <a href="#" class="prev">Prev</a>
              <div class="d-inline-block">
              <a href="#" class="active">1</a>
              <a href="#">2</a>
              <a href="#">3</a>
              <a href="#">4</a>
              </div>
              <a href="#" class="next">Next</a>
            </div>
          </div>
        </div>

      </div>
    </section>

    <section class="py-5 bg-image overlay-primary fixed overlay" style="background-image: url('images/hero_1.jpg');">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md-8">
            <h2 class="text-white">Looking For A Job?</h2>
            <p class="mb-0 text-white lead">Lorem ipsum dolor sit amet consectetur adipisicing elit tempora adipisci impedit.</p>
          </div>
          <div class="col-md-3 ml-auto">
            <a href="#" class="btn btn-warning btn-block btn-lg">Sign Up</a>
          </div>
        </div>
      </div>
    </section>


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
   