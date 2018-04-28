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

$(document).on('turbolinks:load', function() {

	showAnimation();
	homeSlider();
	
});

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

	homeSliderHeight(); // Execute after slick slider
}

function homeSliderHeight(){
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

	if (height > win) {
		$('#home-slider').css('height', win);
	    $('#home-slider .slide').css('height', win);
	    $('.home-slider-wrapper').css('height', menu);

	}else{
		$('#home-slider').css('height', height);
	    $('#home-slider .slide').css('height', height);
	    $('.home-slider-wrapper').css('height', menu);
	}

	if (win == 0) {
		homeSliderHeight();
	}
}






// function centerSlider(){
// 	$(window).bind("scroll", function(e) {
// 		var slider = document.getElementById("home-slider");
// 		var height = $(slider).height();
// 		var offset = $(window).scrollTop();
// 		$( slider ).height(height - offset);
// 		console.log(height)
// 		console.log(offset)
// 	});
// }