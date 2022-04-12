<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container" style="margin:0;">

	<section class="exper_detail">
		<div class="exper_left">
			<div class="exper_info_top">
				<div class="title">
					<h3><span class="channel">BLOG</span> 히알루론산 앰플 체험단</h3>
					<p>겨울철 보습 관리엔</p>
				</div>
				<div class="tag">
					<div class="channel">
						<ul>
							<li class="show">BLOG</li>
							<li>INSTA</li>
							<li>YOUTUBE</li>
						</ul>
					</div>
					<div class="point">5,0000P</div>
					<div class="info">
						<ul>
							<li class="show">블로그포스팅</li>
							<li class="show">스토어리뷰</li>
						</ul>
					</div>

				</div>
			</div>
			<div class="detail">
				<div class="img" style="max-height: 600px;">
					<img src="${pageContext.request.contextPath}/resources/img/ex/exper/220122/detail.jpeg">
				</div>
				<div class="img_more_btn">+더보기</div>
				<div class="campain_info">
					<div id="service" class="info">
						<div class="t01">체험 서비스</div>
						<div class="t02">히알루론산 앰플 30ml 1개 제공</div>
					</div>
					<div id="keyword" class="info">
						<div class="t01">키워드</div>
						<div class="t02">
								필수키워드 : 에이민<br>
								서브 키워드 : 블링리뷰
						</div>
					</div>
					<div id="mission" class="info">
						<div class="t01">체험미션</div>
						<div class="t02">
							이미지 최소 10장 이상<br>
							홈페이지 연동
						</div>
					</div>
					<div id="coution" class="info">
						<div class="t01">주의사항</div>
						<div class="t02">미작성 시 넌 좆됨</div>
					</div>
				</div>
			</div>
		</div>
		<div class="exper_right">
			<div class="info_area">
				<ul>
					<li class="ex_apply_date">
						<div class="title">모집기간</div>
						<div class="content">01.20 ~ 01.25</div>
					</li>
					<li class="ex_apply_ann_date">
						<div class="title">발표일</div>
						<div class="content">01.26</div>
					</li>
				</ul>
				<div class="scrollBtn" onclick="infoScroll('service');">제공내용</div>
				<div class="scrollBtn" onclick="infoScroll('keyword');">키워드</div>
				<div class="scrollBtn" onclick="infoScroll('mission');">체험미션</div>
				<div class="scrollBtn" onclick="infoScroll('coution');">주의사항</div>
				<div class="apply_btn" onclick="location.href='${pageContext.request.contextPath}/experience/apply'">신청하기</div>
			</div>
		</div>
		
		<a href="${pageContext.request.contextPath}/experience/apply">
			<div class="exper_apply_btn">
				<span>체험신청하기</span>
			</div>
		</a>
	
	</section>

	

</div>


<script>
	$(window).scroll(function(){
		var this_scroll = $(document).scrollTop();
		var target = $('.info_area');
		
		if(this_scroll > 40) {
			target.addClass('fix');
		} else {
			target.removeClass('fix');
		}
	});

	$('.img_more_btn').click(function() {
		$('.exper_detail .detail .img').css('max-height','');
		$(this).css('display','none');
	});

	function infoScroll(i) {
		$('html, body').animate({ 
			scrollTop: $('#'+i + '').offset().top - 50
		}, 300);
	}

	$(document).ready(function() {
		let windowOutWidth = window.outerWidth;

		if(windowOutWidth <= 800) {
			$('.m_gbn').css('display','none');
		}
	});

	$(window).resize(function (){
		let windowOutWidth = window.outerWidth;

		if(windowOutWidth <= 800) {
			$('.m_gbn').css('display','none');
		}
	 });
</script>