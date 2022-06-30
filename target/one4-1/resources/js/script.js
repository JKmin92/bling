
if (documｅnt.location.protocol == 'http:' ) {
	documｅnt.location.href = documｅnt.location.href.replace('http:', 'https:');
}

$(document).ready(function() {
	
	$('.category_menu').click(function() {
		let bodyClass = $('body').hasClass('gnb_active');
		
		if(!bodyClass) {
			$('body').addClass('gnb_active');
		} else {
			$('body').removeClass('gnb_active');
		}
	});

	$('.gnb_active_bank').click(function() {
		let body = $('body');

		if(body.hasClass('gnb_active')) {
			body.removeClass('gnb_active');
		}
	});

	$('#rightScroll .top').click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 1000);
	});
	
	
	$('.gnb ul .gnb_li').click(function(){
		
		let tag_this = $(this);
		let snb_ul = $('.gnb_li .snb');
		let activeCheck = false;

		if(tag_this.hasClass('active')) {
			activeCheck = true;
		}

		$('.gnb_li .snb').removeClass('active');
		$('.gnb ul .gnb_li').removeClass('active');
		
		if(!activeCheck) {
			tag_this.addClass('active');
			snb_ul.addClass('active')
		}
		
	});
	
	$(function() {
		let mainTopSwiper = new Swiper('.main_top_swiper', {
			slidePerView : 1,
			loop : true,
			loopAdditionalSlides: 1,
			autoHeight:true,
			spaceBetween : 1,
			autoplay : {
				delay : 3000,
				disableOnInteraction: true,
			}
		});
		
		let mainTopSwiperMobile = new Swiper('.main_top_swiper_mo', {
			slidePerView : 1,
			loop : true,
			loopAdditionalSlides: 1,
			autoHeight:true,
			spaceBetween : 1,
			autoplay : {
				delay : 3000,
				disableOnInteraction: true,
			}
		});
	});

	
	// $('.gnb ul li.gnb_li ul.snb li').click(function(){
	// 	event.stopImmediatePropagation()
	// });
	
	$('header .top_menu .search a input[type=image]').click(function() {

		let input_search = $('header .top_menu .search input[type=search]');

		if (!input_search.hasClass('active')) {
			input_search.addClass('active');
			input_search.css({'right':'5px','display':'block'});
			$('header .top_menu .search .close').css('display','block');
		}
		
	});

	$('header .top_menu .search .close').click(function() {
		let input_search = $('header .top_menu .search input[type=search]');

		if (input_search.hasClass('active')) {
			input_search.removeClass('active');
			input_search.css({'right':'-200%', 'display':'none'});
			$('header .top_menu .search a input[type=image]').css('left','77%');
			$(this).css('display','none');
		}
	});

	$('.exper_title .title .t1 .locate').click(function() {
		let location_select = $('.exper_title .title .location_select');

		if(location_select.hasClass('active')) {
			location_select.removeClass('active');
		} else {
			location_select.addClass('active');
		}
	});
	
});

function getParameterByName(name) {
	name = name.replace(/[\[]/,'\\[').replace(/[\]]/, '\\]');
	let regex = new RegExp('[//?&]' + name + '=([^&#]*)');
	results = regex.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, ''));
}

$('img[src$=".svg"]').each(function() {
	var img = jQuery(this);
	var imgURL = img.attr('src');
	var attributes= img.prop("attributes");
	
	$.get(imgURL, function(data) {
		var svg = $(data).find('svg');
		svg = svg.removeAttr('xmlns:a');
		
		$.each(attributes, function() {
			svg.attr(this.name, this.value);
		});
		img.replaceWith(svg);
	
	}, 'xml');
});

$(window).scroll(function(){
	var this_scroll = $(document).scrollTop();
	var target = $('header');
	
	if(this_scroll > 40) {
		target.addClass('fix');
	} else {
		target.removeClass('fix');
	}
});