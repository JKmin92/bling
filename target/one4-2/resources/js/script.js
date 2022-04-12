$(document).ready(function() {
	
	$('.gnb ul .gnb_li').click(function(){
		
		var tag_this = $(this);
		var snb_ul = $('.gnb_li .snb');
		
		if(!tag_this.hasClass('active')) {
			tag_this.addClass('active');
			snb_ul.addClass('active')
		}else {
			tag_this.removeClass('active');
			snb_ul.removeClass('active');
		}
		
	});
	
	// $('.gnb ul li.gnb_li ul.snb li').click(function(){
	// 	event.stopImmediatePropagation()
	// });
	
	$('header .top_menu .search a input[type=image]').click(function() {

		let input_search = $('header .top_menu .search input[type=search]');

		if (!input_search.hasClass('active')) {
			input_search.addClass('active');
			input_search.css({'right':'5px','display':'block'});
			$(this).css('left','-53%');
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

	
	
});

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
