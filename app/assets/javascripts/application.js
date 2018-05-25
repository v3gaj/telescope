// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require twitter/bootstrap
//= require activestorage
//= require turbolinks
//= require_tree .

//= slick
//= dropify

//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales

$(document).on('turbolinks:load', function() {

	showAnimation();
	scrollMenu();
	homeSlider();
	aboutSlider();
	bootstrapWysihtml5();
	hideHeaderImage();
	scrollTop();
	showScrollTop();
	serviceTabs();
	toolpit();
	$(".slide img").load(function(){
	  homeSliderHeight();
	});
	$('.dropify').dropify();
	adjustImageDropify();	


    $(".navbar-toggle").click(function(){
    	$(".nav-center").slideToggle('normal', function(){
        $(".nav-center").toggleClass("toogle-menu");
        	
      });	
    });
});

function toolpit(){
	$('[data-toggle="tooltip"]').tooltip();   
}

function showAnimation(){
  setTimeout(function() {
    $('.animation-wrapper').css({ opacity: "1"});
  }, 500);
}

function homeSlider(){
	$('.home-slider').slick({
		arrows: false,
		dots: true,
		infinite: true,
		speed: 1000,
		fade: true,
		autoplay: true,
	  	autoplaySpeed: 4000,
	  	pauseOnHover: false,
		cssEase: 'linear'
	});
}

function aboutSlider(){
	$('.about-slider').slick({
		arrows: false,
		dots: true,
		infinite: true,
		speed: 500,
		autoplay: true,
	  	autoplaySpeed: 4000,
		cssEase: 'linear'
	});
}

function bootstrapWysihtml5(){
	$(document).ready(function(){
    $('.wysihtml5').each(function(i, elem) {
      $(elem).wysihtml5({toolbar: {
	      'font-styles': true,
	      'color': false,
	      'emphasis': {
	        'small': true
	      },
	      'blockquote': true,
	      'lists': true,
	      'html': false,
	      'link': false,
	      'image': false,
	      'smallmodals': false
	    }});
    });
	})
}

function bootstrapWysihtml5Experience(){
	$(document).ready(function(){
    $('.wysihtml5').each(function(i, elem) {
      $(elem).wysihtml5({toolbar: {
	      'font-styles': false,
	      'color': false,
	      'emphasis': {
	        'small': true
	      },
	      'blockquote': true,
	      'lists': true,
	      'html': false,
	      'link': false,
	      'image': false,
	      'smallmodals': false
	    }});
    });
	})
}

function homeSliderHeight(){
	if ($('.slide img').length != 0) {
		var array = $( ".slide img" ).toArray()
		var height = 0;
		var win = $(window).height();
		var menuOffset = $('.navbar').offset();
		var menuHeight = $('.navbar').height();

		var menu = menuOffset.top + menuHeight;
		var menu = win - menu;

		for (var i = 0; i < array.length; i++) {
			var attribute = $(array[i]).height();
			if (height == 0) {
				height = attribute
			}else if (attribute < height) {
				height = attribute
			}
		}

		console.log(win, height)

		if (height > win) {
			$('#home-slider').css('height', win);
		    $('#home-slider .slide').css('height', win);

		}else{
			$('#home-slider').css('height', height);
		    $('#home-slider .slide').css('height', height);
		}
	}
}

function scrollMenu(){

	$(window).bind("scroll", function(e) {
		var menu = $('.navbar').offset();
		var win = $(window).scrollTop();

		if (win > menu.top) {
			$('.navbar').addClass('nav-bar-white');
		}else if (win < 20) {
			$('.navbar').removeClass('nav-bar-white');
		}
	});

}

// If exist an image header for the view hide the general header image

function hideHeaderImage(){

	if ($('.header-active').length != 0) {
		$('.header-background').css('display', 'none');
	}

}

// Return top function

function showScrollTop(){

	$(window).bind("scroll", function(e) {
		var win = $(window).scrollTop();
		if (win > 20) {
			$('.scroll-top').addClass('scroll-top-show');
		}else{
			$('.scroll-top').removeClass('scroll-top-show');
		}
	});
}

function scrollTop(){
	$(".scroll-top").click(function() {
	  	$("html, body").animate({ scrollTop: 0 }, "slow");
	 return false;
	});
}

function serviceTabs(){
	$(".header-service").click(function () {

		var header = $(this) // Get clicked element
		var winHeight = $(window).height(); // Get window height
		var winScrollTop = $(window).scrollTop(); // Get window scrolled section
		var panel = $(this).parent().next(); // Get panel to show
		var height

		$(header).toggleClass('service-toogle');
	    $(panel).slideToggle('normal', function () { // Declare function
        	if ($(header).hasClass('service-toogle')) {
        		height = panel.outerHeight(); // Get element height after slide down
        		if ((winScrollTop + winHeight) < (panel.offset().top + height)) { // If window botton is less than panel botton shown, animate the window to show the panel 
		    		$('html, body').animate({scrollTop: ($(panel).offset().top) - winHeight + height}, 'normal');
		    	}
	   		};
        }).promise().done(); // Declare promise to obtain height after slide down
	});
}

function imageWidthDropify(){
	$('.dropify-wrapper').css('height', ($('.dropify-wrapper').outerWidth() * 1.335));
}

function adjustImageDropify(){
	$(window).on('resize', function(){
	   imageWidthDropify();
	});
}



// AJAX RAILS FUNCTIONS

function messages_create_js(){
	$(".message_errors").html("<p class='message_notice'>Mensaje enviado exitosamente.</p>");
	$(".message_notice").addClass("message_warning").delay(5000).queue(function(next){
	    $(this).removeClass("message_warning");
	    next();
	});
	$('html, body').animate({
        scrollTop: $(".message_errors").position().top
    }, 2000);
	$(".form-clear").val('');
}

function user_edit_js(){
	$('.dropify').dropify();
	imageWidthDropify();
}

function user_update_js(){
	$('.dropify').dropify();
	imageWidthDropify();
}

function education_cancel_js(){
	toolpit();
}

function education_create_js(){
	toolpit();
}

function education_update_js(){
	toolpit();
}

function experience_cancel_js(){
	toolpit();
}

function experience_create_js(){
	toolpit();
}

function experience_update_js(){
	toolpit();
}

function experience_new_js(){
	bootstrapWysihtml5Experience();
}

function experience_edit_js(){
	bootstrapWysihtml5Experience();
}

function skill_cancel_js(){
	toolpit();
}

function skill_create_js(){
	toolpit();
}

function skill_update_js(){
	toolpit();
}

function user_language_cancel_js(){
	toolpit();
}

function user_language_create_js(){
	toolpit();
}


function user_language_update_js(){
	toolpit();
}
