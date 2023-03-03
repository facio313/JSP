<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023.03.03  윤호연      최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/animate.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">   
<style type="text/css">
	@import url("https://fonts.googleapis.com/css2?family=Lato:wght@400;700&family=Montserrat:wght@700&display=swap");

	:root {
	  /* Colors */
	  --brand-color: hsl(46, 100%, 50%);
	  --black: hsl(0, 0%, 0%);
	  --white: hsl(0, 0%, 100%);
	  /* Fonts */
	  --font-title: "Montserrat", sans-serif;
	  --font-text: "Lato", sans-serif;
	}
	
	/* RESET */
	
	/* Box sizing rules */
	*,
	*::before,
	*::after {
	  box-sizing: border-box;
	}
	
	/* Remove default margin */
	body,
	h2,
	p {
	  margin: 0;
	}
	
	/* GLOBAL STYLES */
	h2 {
	  font-size: 2.25rem;
	  font-family: var(--font-title);
	  color: var(--white);
	  line-height: 1.1;
	}
	
	p {
	  font-family: var(--font-text);
	  font-size: 1rem;
	  line-height: 1.5;
	}
	
	
	.flow > * + * {
	  margin-top: var(--flow-space, 1em);
	}
	
	/* CARD COMPONENT */
	
	.card {
	  display: grid;
	  place-items: center;
	  width: 80vw;
	  max-width: 21.875rem;
	  height: 28.125rem;
	  overflow: hidden;
	  border-radius: 0.625rem;
	  box-shadow: 0.25rem 0.25rem 0.5rem rgba(0, 0, 0, 0.25);
	}
	
	.card > * {
	  grid-column: 1 / 2;
	  grid-row: 1 / 2;
	}
	
	.card__background {
	  object-fit: cover;
	  max-width: 100%;
	  height: 100%;
	}
	
	.card__content {
	  --flow-space: 0.9375rem;
	  display: flex;
	  flex-direction: column;
	  justify-content: space-between;
	  align-self: flex-end;
	  height: 55%;
	  padding: 12% 1.25rem 1.875rem;
	  background: linear-gradient(
	    180deg,
	    hsla(0, 0%, 0%, 0) 0%,
	    hsla(0, 0%, 0%, 0.3) 10%,
	    hsl(0, 0%, 0%) 100%
	  );
	}
	
	.card__content--container {
	  --flow-space: 1.25rem;
	}
	
	.card__title {
	  position: relative;
	  width: fit-content;
	  width: -moz-fit-content; /* Prefijo necesario para Firefox  */
	}
	
	.card__title::after {
	  content: "";
	  position: absolute;
	  height: 0.3125rem;
	  width: calc(100% + 1.25rem);
	  bottom: calc((1.25rem - 0.5rem) * -1);
	  left: -1.25rem;
	  background-color: var(--brand-color);
	}
	
	.card__button {
	  padding: 0.75em 1.6em;
	  width: fit-content;
	  width: -moz-fit-content; /* Prefijo necesario para Firefox  */
	  font-variant: small-caps;
	  font-weight: bold;
	  border-radius: 0.45em;
	  border: none;
	  background-color: var(--brand-color);
	  font-family: var(--font-title);
	  font-size: 1.125rem;
	  color: var(--black);
	}
	
	.card__button:focus {
	  outline: 2px solid black;
	  outline-offset: -5px;
	}
	
	@media (any-hover: hover) and (any-pointer: fine) {
	  .card__content {
	    transform: translateY(62%);
	    transition: transform 500ms ease-out;
	    transition-delay: 500ms;
	  }
	
	  .card__title::after {
	    opacity: 0;
	    transform: scaleX(0);
	    transition: opacity 1000ms ease-in, transform 500ms ease-out;
	    transition-delay: 500ms;
	    transform-origin: right;
	  }
	
	  .card__background {
	    transition: transform 500ms ease-in;
	  }
	
	  .card__content--container > :not(.card__title),
	  .card__button {
	    opacity: 0;
	    transition: transform 500ms ease-out, opacity 500ms ease-out;
	  }
	
	  .card:hover,
	  .card:focus-within {
	    transform: scale(1.05);
	    transition: transform 500ms ease-in;
	  }
	
	  .card:hover .card__content,
	  .card:focus-within .card__content {
	    transform: translateY(0);
	    transition: transform 500ms ease-in;
	  }
	
	  .card:focus-within .card__content {
	    transition-duration: 0ms;
	  }
	
	  .card:hover .card__background,
	  .card:focus-within .card__background {
	    transform: scale(1.3);
	  }
	
	  .card:hover .card__content--container > :not(.card__title),
	  .card:hover .card__button,
	  .card:focus-within .card__content--container > :not(.card__title),
	  .card:focus-within .card__button {
	    opacity: 1;
	    transition: opacity 500ms ease-in;
	    transition-delay: 1000ms;
	  }
	
	  .card:hover .card__title::after,
	  .card:focus-within .card__title::after {
	    opacity: 1;
	    transform: scaleX(1);
	    transform-origin: left;
	    transition: opacity 500ms ease-in, transform 500ms ease-in;
	    transition-delay: 500ms;
	  }
	  
	  .card-display{
		display: flex;
   		flex-wrap: wrap;	  
	  }
	  
/* 	슬라이드 효과 주기   */
	  .slider{
		  height: 450px;
		  margin: auto;
		  position:relative;
		  width: 100%;
		  display:grid;
		  place-items:center;
		  overflow:hidden;
		}
		
		.slide-track{
		  display:flex;
		  width: calc(300px * 12);
		  animation: scroll 10s linear infinite;	
		}
		
		.slide-track:hover{
		  animation-play-state:paused;
		}
		
		.scroll {
		  animation: scroll 10s linear infinite;
		}
		
		.scroll2 {
		  animation: scroll2 10s linear infinite;
		}

		
		@keyframes scroll{
		  0% {
		    transform: translateX(0);
		  }
		  100%{
		    transform: translateX(calc(-300px * 7));
		  }


/*		
		.slide{
		  height: 250px;
		  width: 300px;
		  display: flex;
		  align-items:center;
		  padding: 15px;
		  perspective:100px;
		}
*/
		
		.train-card{
		  width:100%;
		  transition:transform 2s;
		  border-radius:10px;
		  overflow:hidden;
		}
		
		.train-card:hover{
		  transform:translateZ(18px);
		}
	
	/* 슬라이더 그라데이션 그림자 */

		.slider::before,
		.slider::after {
		  background:linear-gradient(to right, #f6f4f2 0%,
		  rgba(255,255,255,0) 100%);
		  content:'';
		  height:100%;
		  position:absolute;
		  width:15%;
		  z-index:2;
		}
		
		.slider::before{
		  left:0;
		  top:0;
		}
		
		.slider::after{
		  right:0;
		  top:0;
		  transform: rotateZ(180deg);
		}	
		
	}
	
</style>
<section class="site-section">
	<div class="container">
	<p style="font-size: 1.5em; text-align: center;">인기 공모전</p>
	<div style="height: 50px;"></div>
	<div class="slider">
	<div class="slide-track">
	
	<!-- 카드1 -->
	<div class="card-display slide">
		<article class="card train-card" id="card1">
		  <img
		    class="card__background"
		    src="https://i.imgur.com/QYWAcXk.jpeg"
		    alt="Photo of Cartagena's cathedral at the background and some colonial style houses"
		    width="1920"
		    height="2193"
		  />
		  <div class="card__content | flow">
		    <div class="card__content--container | flow">
		      <h2 class="card__title">Colombia</h2>
		      <p class="card__description">
		        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum in
		        labore laudantium deserunt fugiat numquam.
		      </p>
		    </div>
		    <button class="card__button">Read more</button>
		  </div>
		</article>
		<div style="width: 50px;"></div>
		</div>
	
	<!-- 카드2 -->
	<div class="card-display slide">
	<article class="card train-card">
	  <img
	    class="card__background"
	    src="https://i.imgur.com/QYWAcXk.jpeg"
	    alt="Photo of Cartagena's cathedral at the background and some colonial style houses"
	    width="1920"
	    height="2193"
	  />
	  <div class="card__content | flow">
	    <div class="card__content--container | flow">
	      <h2 class="card__title">Colombia</h2>
	      <p class="card__description">
	        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum in
	        labore laudantium deserunt fugiat numquam.
	      </p>
	    </div>
	    <button class="card__button">Read more</button>
	  </div>
	</article>
	<div style="width: 50px;"></div>
	</div>
	
	<!-- 카드3 -->
	<div class="card-display slide">
	<article class="card train-card">
	  <img
	    class="card__background"
	    src="https://i.imgur.com/QYWAcXk.jpeg"
	    alt="Photo of Cartagena's cathedral at the background and some colonial style houses"
	    width="1920"
	    height="2193"
	  />
	  <div class="card__content | flow">
	    <div class="card__content--container | flow">
	      <h2 class="card__title">Colombia</h2>
	      <p class="card__description">
	        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum in
	        labore laudantium deserunt fugiat numquam.
	      </p>
	    </div>
	    <button class="card__button">Read more</button>
	  </div>
	</article>
	<div style="width: 50px;"></div>
	</div>
	
	<!-- 카드 4 -->
	<div class="card-display slide">
	<article class="card train-card">
	  <img
	    class="card__background"
	    src="https://i.imgur.com/QYWAcXk.jpeg"
	    alt="Photo of Cartagena's cathedral at the background and some colonial style houses"
	    width="1920"
	    height="2193"
	  />
	  <div class="card__content | flow">
	    <div class="card__content--container | flow">
	      <h2 class="card__title">Colombia</h2>
	      <p class="card__description">
	        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum in
	        labore laudantium deserunt fugiat numquam.
	      </p>
	    </div>
	    <button class="card__button">Read more</button>
	  </div>
	</article>
	<div style="width: 50px;"></div>
	</div>
	
	<!-- 카드5 -->
	<div class="card-display slide">
	<article class="card train-card">
	  <img
	    class="card__background"
	    src="https://i.imgur.com/QYWAcXk.jpeg"
	    alt="Photo of Cartagena's cathedral at the background and some colonial style houses"
	    width="1920"
	    height="2193"
	  />
	  <div class="card__content | flow">
	    <div class="card__content--container | flow">
	      <h2 class="card__title">Colombia</h2>
	      <p class="card__description">
	        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum in
	        labore laudantium deserunt fugiat numquam.
	      </p>
	    </div>
	    <button class="card__button">Read more</button>
	  </div>
	</article>
	<div style="width: 50px;"></div>
	</div>
	
	<!-- 카드6 -->
	<div class="card-display slide">
	<article class="card train-card">
	  <img
	    class="card__background"
	    src="https://i.imgur.com/QYWAcXk.jpeg"
	    alt="Photo of Cartagena's cathedral at the background and some colonial style houses"
	    width="1920"
	    height="2193"
	  />
	  <div class="card__content | flow">
	    <div class="card__content--container | flow">
	      <h2 class="card__title">Colombia</h2>
	      <p class="card__description">
	        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum in
	        labore laudantium deserunt fugiat numquam.
	      </p>
	    </div>
	    <button class="card__button">Read more</button>
	  </div>
	</article>
	<div style="width: 50px;"></div>
	</div>
	
	<!-- 카드7 -->
	<div class="card-display slide">
	<article class="card train-card">
	  <img
	    class="card__background"
	    src="https://i.imgur.com/QYWAcXk.jpeg"
	    alt="Photo of Cartagena's cathedral at the background and some colonial style houses"
	    width="1920"
	    height="2193"
	  />
	  <div class="card__content | flow">
	    <div class="card__content--container | flow">
	      <h2 class="card__title">Colombia</h2>
	      <p class="card__description">
	        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum in
	        labore laudantium deserunt fugiat numquam.
	      </p>
	    </div>
	    <button class="card__button">Read more</button>
	  </div>
	</article>
	<div style="width: 50px;"></div>
	</div>
	
	</div>
	</div>
	
	</div>
</section>

<section class="site-section">
	<div class="container">
		<p style="font-size: 1.5em; text-align: center;">진행 중인 공모전 asdfkal;sdfk;lsdl;k</p>
	</div>
</section>
   <!-- SCRIPTS -->
    <script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/isotope.pkgd.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/stickyfill.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.fancybox.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.easing.1.3.js"></script>
    
    <script src="<%=request.getContextPath() %>/resources/js/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.animateNumber.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/quill.min.js"></script>
    
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap-select.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/daumPostcode.js"></script>
    
    <script src="<%=request.getContextPath() %>/resources/js/custom.js"></script>
</html>