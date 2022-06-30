<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="kr.com.amean.entity.user.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container" style="margin:0 auto;">

	<section class="exper_detail">
		<div class="exper_left">
			<div class="exper_info_top">
				<div class="tag">
					<div class="channel">
						<ul>
						
						</ul>
					</div>
				</div>
				<div class="title">
					<h3></h3>
					<p></p>
				</div>
				<div class="simple_btn">
					<div class="interestCampaign"></div>
				</div>
			</div>
			<div class="exper_simple_info">
				<div class="thumnail">
					<img src="" width="100%">
				</div>
				<ul>
					<li id="applyDate"><span>캠페인 신청기간</span></li>
					<li id="annDate"><span>리뷰어 발표일</span></li>
					<li id="createDate"><span>컨텐츠 작성일</span></li>
					<li id="campaignCloseDate"><span>캠페인 종료일</span></li>
				</ul>
			</div>
			<div class="campainTimer m_s" style="margin-bottom: 20px;">
				<div class="time">
					<span>0일 00:00:00</span>
				</div>
			</div>
			<div class="exper_btn_area">
				<div class="exper_btn">
					<ul>
						<li onclick="infoScrollM('.detail .img');"><span>캠페인 정보</span></li>
						<li onclick="infoScrollM('#service');"><span>제공 내용</span></li>
						<li onclick="infoScrollM('#mission');"><span>캠페인 미션</span></li>
					</ul>
				</div>
			</div>
			<div class="detail">
				<div class="img" style="max-height: 600px;">
				</div>
				<div class="img_more_btn">+더보기</div>
				<div class="campain_info">
					<div id="service" class="info">
						<div class="t01">제공 내용</div>
						<div class="t02"></div>
					</div>
					<div id="keyword" class="info">
						<div class="t01">키워드</div>
						<div class="t02">
						</div>
					</div>
					<div id="mission" class="info">
						<div class="t01">캠페인 미션</div>
						<div class="t02">
						</div>
					</div>
					
					<div id="caution" class="info">
						<div class="t01">주의사항</div>
						<div class="t02"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="exper_right">
			<div class="info_area">
				<ul>
					<li class="img">
						<img src="" width="100%"/>
					</li>
					<li class="title">
						
					</li>
					<li class="ex_apply_date" id="applyDate">
						<div class="title">캠페인 신청기간</div>
						<div class="content"></div>
					</li>
					<li class="ex_apply_ann_date" id="annDate">
						<div class="title">리뷰어 발표일</div>
						<div class="content"></div>
					</li>
					<li class="ex_apply_ann_date" id="createDate">
						<div class="title">컨텐츠 작성일</div>
						<div class="content"></div>
					</li>
					<li class="ex_apply_ann_date" id="campaignCloseDate">
						<div class="title">캠페인 종료일</div>
						<div class="content"></div>
					</li>
				</ul>
				<div class="scrollBtn" onclick="infoScroll('service');"><span>제공내용</span></div>
				<div class="scrollBtn" onclick="infoScroll('keyword');"><span>키워드</span></div>
				<div class="scrollBtn" onclick="infoScroll('mission');"><span>캠페인 미션</span></div>
				<div class="scrollBtn" onclick="infoScroll('caution');"><span>주의사항</span></div>
				<div class="campainTimer">
					<div class="time">
						<span>0일 00:00:00</span>
					</div>
				</div>
				<div class="apply_btn" onclick="apply();"><span>캠페인 신청</span></div>
			</div>
		</div>
		
		<a href="#" onclick="apply();">
			<div class="exper_apply_btn">
				<span>캠페인 신청</span>
			</div>
		</a>
	
	</section>

</div>
<section class="main_ex relative">
	<div class="container">
		<div class="title">연관 캠페인</div>
		<ul class="ex"></ul>
	</div>
</section>

<script>

	var experEndDate = '';

	$(window).scroll(function(){
		let this_scroll = $(document).scrollTop();
		let scroll = $('.exper_detail').height() - $('.info_area').height();
		let target = $('.info_area');
		let target2 = $('.exper_btn_area .exper_btn');
		let target2Top = 304;

		if(this_scroll < scroll) {
			if(target.hasClass('bottom')) {
				target.removeClass('bottom');
			}
			target.addClass('fix');
		} else {
			if(target.hasClass('fix')) {
				target.removeClass('fix');
			}
			target.addClass('bottom');
		}

		if(this_scroll > target2Top) {
			if(!target2.hasClass('fix')) {
				target2.addClass('fix');
			}
		} else {
			if(target2.hasClass('fix')) {
				target2.removeClass('fix');
			}
		}

	});

	$('.exper_detail .simple_btn .interestCampaign').click(function() {
		let state = $(this).hasClass('active');
		let eNum = getParameterByName('eNum');

		<% 
			User userCheck = (User)session.getAttribute("user");
			if(userCheck == null) {
		%>

		window.location = '${pageContext.request.contextPath}/user/login?locate=experDetail&eNum=' + eNum;

		<%
			}
		%>

		if(state) {
			$.ajax({
				url : '${pageContext.request.contextPath}/experience/interest/delete',
				data : {'eNum':eNum},
				type : 'post',
				success : function(result) {
					if(result == true) {
						$('.exper_detail .simple_btn .interestCampaign').removeClass('active');
					}
				}
			});
		} else {
			$.ajax({
				url : '${pageContext.request.contextPath}/experience/interest/insert',
				data : {'eNum':eNum},
				type : 'post',
				success : function(result) {
					if(result == true) {
						$('.exper_detail .simple_btn .interestCampaign').addClass('active');
					}
				}
			});
		}
	});

	function setDate(date) {
		let setD = new Date(date);
		let month = '' + (setD.getMonth() + 1);
		let day = '' + setD.getDate();

		if(month.length < 2) month = '0' + month;
		if(day.length < 2) day = '0' + day;

		setD = [month, day].join('.');

		return setD;
	}

	function apply() {
		<% 
			String userId = null;
			if(userCheck != null) {
				userId = userCheck.getId();
		%>
		window.location = '${pageContext.request.contextPath}/experience/apply?eNum=' + getParameterByName('eNum');
		<%
			} else {
		%>
		window.location = '${pageContext.request.contextPath}/user/login?locate=apply&eNum='+ getParameterByName('eNum') + '&popup=1';
			
		<%
			}
		%>
		
	}

	$('.img_more_btn').click(function() {
		$('.exper_detail .detail .img').css('max-height','');
		$(this).css('display','none');
	});

	function infoScroll(i) {
		$('html, body').animate({ 
			scrollTop: $('#'+i + '').offset().top - 150
		}, 300);
	}
	function infoScrollM(item) {
		$('html, body').animate({ 
			scrollTop: $(item + '').offset().top - 170
		}, 300);
	}

	$(document).ready(function() {
		let windowOutWidth = window.outerWidth;

		if(windowOutWidth <= 800) {
			$('.m_gbn').css('display','none');
		}

		if($('.detail .img').children().height() < 600) {
			$('.img_more_btn').remove();
		}

		thisExperience();

	});
	
	$(window).resize(function (){
		let windowOutWidth = window.outerWidth;

		if(windowOutWidth <= 800) {
			$('.m_gbn').css('display','none');
		}
	 });



	 function thisExperience() {
		let eNum = getParameterByName('eNum');
		$.ajax({
			url : '${pageContext.request.contextPath}/experience/detail/getExperience',
			type : 'post',
			data : {'eNum' : eNum},
			success : function(map) {
				settingData(map.experience, map.guide);

				if(map.interestCampaignCheck == true) {
					$('.exper_detail .simple_btn .interestCampaign').addClass('active');
				}
			}, error : function(e) {
				console.log(e);
			}
		})
	 }

	function settingData(experience, guide) {
		$('.title h3').append(experience.title);
		$('.info_area li.title').append(experience.title);
		$('.title p').append(experience.subject);

		let blog = experience.kind_n;
		let instagram = experience.kind_i;
		let homepage = experience.kind_h;
		let store = experience.kind_s;
		let receipt = experience.kind_r;

		experEndDate = experience.endDate;

		if(blog == true) {
			$('.channel ul').append('<li class="naver" style="color:#03c75a;">BLOG</li>');
		}

		if(instagram == true) {
			$('.channel ul').append('<li class="instagram" style="color:#e94969;">INSTAGRAM</li>');
		}

		if(homepage == true) {
			$('.channel ul').append('<li class="homepage" style="color:#707070;">HOMEPAGE</li>');
		}

		if(store == true) {
			$('.channel ul').append('<li class="naver" style="color:#03c75a;">STORE</li>');
		}

		if(receipt == true) {
			$('.channel ul').append('<li class="naver" style="color:#03c75a;">영수증리뷰</li>');
		}
		
		$('.detail .img').append(experience.content);
		$('.campain_info #service .t02').append(experience.service);
		$('.campain_info #keyword .t02').append('메인 키워드 : ' + guide.keyword);
		if(guide.subKeyword != null && guide.subKeyword != '') {
			$('.campain_info #keyword .t02').append('<br>서브 키워드 : ' + guide.subKeyword);
		}
		$('.campain_info #mission .t02').append(guide.mission);
		$('.campain_info #caution .t02').append(guide.caution);

		$('.exper_simple_info .thumnail img').attr('src','${pageContext.request.contextPath}/' +experience.main_img);
		$('.exper_simple_info ul li#applyDate span').append(' '+setDate(experience.startDate) + ' ~ ' + setDate(experience.endDate));
		$('.exper_simple_info ul li#annDate span').append(' '+setDate(experience.desDate));
		$('.exper_simple_info ul li#createDate span').append(' '+setDate(guide.closeDate));
		$('.exper_simple_info ul li#campaignCloseDate span').append(' '+setDate(experience.closeDate));

		$('.info_area .img img').attr('src','${pageContext.request.contextPath}/' +experience.main_img);

		$('#applyDate .content').append(setDate(experience.startDate) + ' ~ ' + setDate(experience.endDate));
		$('#annDate .content').append(setDate(experience.desDate));
		$('#createDate .content').append(setDate(guide.closeDate));
		$('#campaignCloseDate .content').append(setDate(experience.closeDate));

		relativeExperience(experience.e_num);
	}

	

	 function relativeExperience(eNum) {
		 $.ajax({
			url : '${pageContext.request.contextPath}/experience/relative/list',
			type : 'post',
			data : {'eNum' : eNum},
			success : function(item) {
				item.forEach(function(experience) {
					$('.relative ul').append(getExperience(experience));
				});
			} 
		 })
	 }


	 function getExperience(experience) {
		
		let endDate = new Date(experience.endDate);
		let month = '' + (endDate.getMonth() + 1);
		let day = '' + endDate.getDate();

		if(month.length < 2) month = '0' + month;
		if(day.length < 2) day = '0' + day;

		endDate = [month, day].join('.');
		
		let experienceView = '<li>'
				+ '<div class="experInfo">'
					+ '<a href="${pageContext.request.contextPath }/experience/detail?eNum=' + experience.e_num + '">'
						+ '<div class="ex_thubmnail">'
							+ '<img src="${pageContext.request.contextPath }/'+ experience.main_img + '" width="100%" />'
						+ '</div>'
					+ '</a>'
					+ '<div class="content">'
						+ '<div class="kind">';
		if(experience.kind_n) {
			experienceView += '<span class="naver" style="color:#03c75a;">BLOG</span>';
		}

		if(experience.kind_i){
			experienceView += '<span class="instagram" style="color:#e94969;">INSTAGRAM</span>';
		}
							
		experienceView = experienceView + '</div>'
						+ '<p class="ex_title">' + experience.title + '</p>'
						+ '<p class="ex_service">' + experience.service +'</p>'
						+ '<div class="ex_pe_prog">'
							+ '<div class="ex_prog_ing" style="width: 0;"></div>'
						+ '</div>'
						+ '<div class="ex_apply_info">'
								+ '<span class="ex_pe">' + experience.applyCount + '/' + experience.headCount + '명</span>'
								+ '<span class="date">' + endDate + '까지</span>'
							+ '</div>'
					+ '</div>'
				+ '</div>'
			+ '</li>';

		return experienceView;
	}

	setInterval(function() {
		let today = new Date();

		let to_year = today.getFullYear(),
		to_month = today.getMonth(),
		to_day = today.getDate(),
		to_hour = today.getHours(),
		to_min = today.getMinutes(),
		to_sec = today.getSeconds();

		let endDate = new Date(experEndDate);
		let now = new Date(to_year, to_month, to_day, to_hour, to_min, to_sec);

		let between = endDate.getTime() - now.getTime(),
		timeBetween = new Date(0,0,0,0,0,0, endDate-now);

		let bet_day = parseInt(between/(1000*60*60*24)),
		bet_hour = timeBetween.getHours(),
		bet_min = timeBetween.getMinutes(),
		bet_sec = timeBetween.getSeconds();

		$('.campainTimer .time span').text(bet_day + '일 ' + bet_hour + ':' + bet_min + ':' + bet_sec);

	}, 1000)
</script>