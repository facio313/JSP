<<<<<<< HEAD
jQuery(function($) {

	'use strict';
	
	$(".loader").delay(1000).fadeOut("slow");
  $("#overlayer").delay(1000).fadeOut("slow");	

	var siteMenuClone = function() {

		$('.js-clone-nav').each(function() {
			var $this = $(this);
			$this.clone().attr('class', 'site-nav-wrap').appendTo('.site-mobile-menu-body');
		});


		setTimeout(function() {
			
			var counter = 0;
      $('.site-mobile-menu .has-children').each(function(){
        var $this = $(this);
        
        $this.prepend('<span class="arrow-collapse collapsed">');

        $this.find('.arrow-collapse').attr({
          'data-toggle' : 'collapse',
          'data-target' : '#collapseItem' + counter,
        });

        $this.find('> ul').attr({
          'class' : 'collapse',
          'id' : 'collapseItem' + counter,
        });

        counter++;

      });

    }, 1000);

		$('body').on('click', '.arrow-collapse', function(e) {
      var $this = $(this);
      if ( $this.closest('li').find('.collapse').hasClass('show') ) {
        $this.removeClass('active');
      } else {
        $this.addClass('active');
      }
      e.preventDefault();  
      
    });

		$(window).resize(function() {
			var $this = $(this),
				w = $this.width();

			if ( w > 768 ) {
				if ( $('body').hasClass('offcanvas-menu') ) {
					$('body').removeClass('offcanvas-menu');
				}
			}
		})

		$('body').on('click', '.js-menu-toggle', function(e) {
			var $this = $(this);
			e.preventDefault();

			if ( $('body').hasClass('offcanvas-menu') ) {
				$('body').removeClass('offcanvas-menu');
				$this.removeClass('active');
			} else {
				$('body').addClass('offcanvas-menu');
				$this.addClass('active');
			}
		}) 

		// click outisde offcanvas
		$(document).mouseup(function(e) {
	    var container = $(".site-mobile-menu");
	    if (!container.is(e.target) && container.has(e.target).length === 0) {
	      if ( $('body').hasClass('offcanvas-menu') ) {
					$('body').removeClass('offcanvas-menu');
				}
	    }
		});
	}; 
	siteMenuClone();


	var sitePlusMinus = function() {
		$('.js-btn-minus').on('click', function(e){
			e.preventDefault();
			if ( $(this).closest('.input-group').find('.form-control').val() != 0  ) {
				$(this).closest('.input-group').find('.form-control').val(parseInt($(this).closest('.input-group').find('.form-control').val()) - 1);
			} else {
				$(this).closest('.input-group').find('.form-control').val(parseInt(0));
			}
		});
		$('.js-btn-plus').on('click', function(e){
			e.preventDefault();
			$(this).closest('.input-group').find('.form-control').val(parseInt($(this).closest('.input-group').find('.form-control').val()) + 1);
		});
	};
	// sitePlusMinus();

   var siteIstotope = function() {
  	/* activate jquery isotope */
	  var $container = $('#posts').isotope({
	    itemSelector : '.item',
	    isFitWidth: true
	  });

	  $(window).resize(function(){
	    $container.isotope({
	      columnWidth: '.col-sm-3'
	    });
	  });
	  
	  $container.isotope({ filter: '*' });

	    // filter items on button click
	  $('#filters').on( 'click', 'button', function(e) {
	  	e.preventDefault();
	    var filterValue = $(this).attr('data-filter');
	    $container.isotope({ filter: filterValue });
	    $('#filters button').removeClass('active');
	    $(this).addClass('active');
	  });
  }

  siteIstotope();

  var fancyBoxInit = function() {
	  $('.fancybox').on('click', function() {
		  var visibleLinks = $('.fancybox');

		  $.fancybox.open( visibleLinks, {}, visibleLinks.index( this ) );

		  return false;
		});
	}
	fancyBoxInit();


	var stickyFillInit = function() {
		$(window).on('resize orientationchange', function() {
	    recalc();
	  }).resize();

	  function recalc() {
	  	if ( $('.jm-sticky-top').length > 0 ) {
		    var elements = $('.jm-sticky-top');
		    Stickyfill.add(elements);
	    }
	  }
	}
	stickyFillInit();


	// navigation
  var OnePageNavigation = function() {
    var navToggler = $('.site-menu-toggle');
   	$("body").on("click", ".main-menu li a[href^='#'], .smoothscroll[href^='#'], .site-mobile-menu .site-nav-wrap li a", function(e) {
      e.preventDefault();

      var hash = this.hash;

      $('html, body').animate({
        'scrollTop': $(hash).offset().top
      }, 600, 'easeInOutCirc', function(){
        window.location.hash = hash;
      });

    });
  };
  OnePageNavigation();

  var counterInit = function() {
		if ( $('.section-counter').length > 0 ) {
			$('.section-counter').waypoint( function( direction ) {

				if( direction === 'down' && !$(this.element).hasClass('ftco-animated') ) {

					var comma_separator_number_step = $.animateNumber.numberStepFactories.separator(',')
					$('.number').each(function(){
						var $this = $(this),
							num = $this.data('number');
							console.log(num);
						$this.animateNumber(
						  {
						    number: num,
						    numberStep: comma_separator_number_step
						  }, 2000
						);
					});
					
				}

			} , { offset: '95%' } );
		}

	}
	counterInit();

	var selectPickerInit = function() {
		$('.selectpicker').selectpicker();
	}
	selectPickerInit();

	var owlCarouselFunction = function() {
		$('.single-carousel').owlCarousel({
	    loop:true,
	    margin:0,
	    nav:true,
	    autoplay: true,
	    items:1,
	    nav: false,
	    smartSpeed: 1000
		});

	}
	owlCarouselFunction();

	var quillInit = function() {

		var toolbarOptions = [
		  ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
		  ['blockquote', 'code-block'],

		  [{ 'header': 1 }, { 'header': 2 }],               // custom button values
		  [{ 'list': 'ordered'}, { 'list': 'bullet' }],
		  [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
		  [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
		  [{ 'direction': 'rtl' }],                         // text direction

		  [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
		  [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

		  [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
		  [{ 'font': [] }],
		  [{ 'align': [] }],

		  ['clean']                                         // remove formatting button
		];

		if ( $('.editor').length > 0 ) {
			var quill = new Quill('#editor-1', {
			  modules: {
			    toolbar: toolbarOptions,
			  },
			  placeholder: 'Compose an epic...',
			  theme: 'snow'  // or 'bubble'
			});
			var quill = new Quill('#editor-2', {
			  modules: {
			    toolbar: toolbarOptions,
			  },
			  placeholder: 'Compose an epic...',
			  theme: 'snow'  // or 'bubble'
			});
		}

	}
	quillInit();
  
});
=======
/**
 * 
 */
//폼태그의 모든 입력 데이터의 이름과 값을 콘솔에 로그로 출력할 수 있는 함수.
//ex) $("form").log().serializeObject();
$.fn.serializeObject=function(){
	if(this.prop('tagName')!='FORM')
		throw Error("form 태그 외에는 사용 불가.");
	let fd = new FormData(this[0]);
	let nameSet = new Set();
	for(let key of fd.keys()){
		nameSet.add(key);
	}
	let data = {};
	for(let name of nameSet){
		let values = fd.getAll(name);
		if(values.length>1){
			data[name] = values;
		}else{
			data[name] = values[0];
		}
	}
	return data;
}
$.fn.log=function(){
	let data = this.serializeObject();
	for(let prop in data){
		console.log(prop + " : " + data[prop]);
	}
	return this;
}

$.fn.sessionTimer=function(timeout, msgObj){
	if(!timeout)
		throw  Error("세션 타임아웃 값이 없음.");
	
	const SPEED = 100;
	const TIMEOUT = timeout;
	const timerArea = this;
	
// 	event propagation : bubbling 방식
	let msgArea = null;
	if(msgObj){
		msgArea = $(msgObj.msgAreaSelector).on("click", msgObj.btnSelector , function(event){
			// 		console.log(this.id + ", " + $(this).prop("id")); 
			if(this.id=="YES"){
				jobClear();
				timerInit();
				$.ajax({
					method : "head"
				});
			}
			msgArea.hide();
		}).hide();
	}
	
	let jobClear = function(){
		let timerJob = timerArea.data("timerJob");
		if(timerJob)
			clearInterval(timerJob);
		let msgJob = msgArea.data('msgJob');
		if(msgJob)
			clearTimeout(msgJob);
	}
	
	let timerInit = function(){
		if(msgObj){
			let msgJob = setTimeout(() => {
				msgArea.show();
			}, (TIMEOUT-60) * SPEED);
			msgArea.data('msgJob', msgJob);
		}
		
		let timer = TIMEOUT;
		let timerJob = setInterval(() => {
			if(timer==1){
				clearInterval(timerJob);
				location.reload();
			}else
				timerArea.html( timeFormat(--timer) );
		}, SPEED);
		timerArea.data("timerJob", timerJob);
	}
	
	timerInit();
	
	let timeFormat = function(time){
		let min = Math.trunc( time / 60 );
		let sec = time % 60;
		return min + ":" + sec;
	}
	
	return this;
}




















>>>>>>> 297d35dfb3730ed4e9f79c3bf7146a3950ab948a
