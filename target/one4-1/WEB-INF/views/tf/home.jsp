<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container">
	<div class="banner">
		<div class="main_top_swiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="${pageContext.request.contextPath}/resources/img/banner/main_banner_1_pc.png" width="100%"/>
				</div>
				<div class="swiper-slide">
					<img src="${pageContext.request.contextPath}/resources/img/banner/main_banner_2_pc.png" width="100%"/>
				</div>
				<div class="swiper-slide">
					<img src="${pageContext.request.contextPath}/resources/img/banner/main_banner_3_pc.png" width="100%"/>
				</div>
			</div>
		</div>
		
		<div class="main_top_swiper_mo">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="${pageContext.request.contextPath}/resources/img/banner/main_popup_1_m.png" width="100%"/>
				</div>
				<div class="swiper-slide">
					<img src="${pageContext.request.contextPath}/resources/img/banner/main_popup_2_m.png" width="100%"/>
				</div>
				<div class="swiper-slide">
					<img src="${pageContext.request.contextPath}/resources/img/banner/main_popup_3_m.png" width="100%"/>
				</div>
			</div>
		</div>
		
	</div>

	<div class="main_tab">
		<ul>
			<li><a href="${pageContext.request.contextPath}/experience?mCategory=1">
				<p class="t1">제품 캠페인</p>
				<p class="t2">Product Campaign</p>
			</a></li>
			<li><a href="${pageContext.request.contextPath}/experience?mCategory=2">
				<p class="t1">방문 캠페인</p>
				<p class="t2">Visiting Campaign</p>
			</a></li>
			<li><a href="#">
				<p class="t1">원포 이벤트</p>
				<p class="t2">ONE4 EVENT</p>
			</a></li>
			<li><a href="#">
				<p class="t1">이용가이드</p>
				<p class="t2">Service Guide</p>
			</a></li>
		</ul>
	</div>

	<section class="main_ex">
		<div class="main_ex_title">
			<p class="t1">마감임박</p>
			<p class="t2">당첨확률 UP! 마감이 임박된 캠페인</p>
		</div>

		<ul class="ex deadLineExperience">
			
		</ul>

		<div class="ex_more_btn">
			<a class="morebtn" href="#"><span>MORE</span></a>
		</div>

	</section>

	<section class="main_ex">
		<div class="main_ex_title">
			<p class="t1">신규오픈</p>
			<p class="t2">오늘 오픈한 신규 캠페인</p>
		</div>

		<ul class="ex newExperience">

			
		</ul>

		<div class="ex_more_btn">
			<a class="morebtn" href="#"><span>MORE</span></a>
		</div>

	</section>

	<section class="main_ex">
		<div class="main_ex_title">
			<p class="t1">인기 제품 캠페인</p>
			<p class="t2">지금 가장 인기있는 제품 캠페인</p>
		</div>

		<ul class="ex populaProductExperience">
			
		</ul>

		<div class="ex_more_btn">
			<a class="morebtn" href="${pageContext.request.contextPath }/experience?mCategory=1&sort=1"><span>MORE</span></a>
		</div>

	</section>

	

	<div class="banner">
		<img src="${pageContext.request.contextPath }/resources/img/banner/main_banner_seconde.png" class="w_s" width="100%">
		<img src="${pageContext.request.contextPath }/resources/img/banner/main_banner_seconde_m.png" class="m_s" width="100%">
	</div>

	<section class="main_ex">
		<div class="main_ex_title">
			<p class="t1">인기 방문 캠페인</p>
			<p class="t2">지금 가장 인기있는 방문 캠페인</p>
		</div>
		

		<ul class="ex populaPlaceExperience">

		</ul>

		<div class="ex_more_btn">
			<a class="morebtn" href="${pageContext.request.contextPath }/experience?mCategory=2&sort=1"><span>MORE</span></a>
		</div>

	</section>

</div>

<div class="main_bottom">
	<div class="container">
		<div class="main_bottom_info">
			<div class="noticeBox">
				<div class="title">
					공지사항
					<a href="#">more</a>
				</div>
				<ul>
					
				</ul>
			</div>
			<div class="useInfoBox">
				<a href="#">
					<img src="${pageContext.request.contextPath}/resources/img/icon/main_bottom_icon_guide.png" alter="guide" />
					<div class="txt">
						<p class="t1">원포가 처음이라면?</p>
						<p class="t2">이용 가이드</p>
					</div>
				</a>
			</div>
			<div class="widgetBox">
				<a href="#">
					<img src="${pageContext.request.contextPath}/resources/img/icon/main_bottom_icon_widget.png" alter="guide" />
					<div class="txt">
						<p class="t1">선정확률 UP!</p>
						<p class="t2">원포 위젯</p>
					</div>
				</a>
			</div>
			<div class="joinBox">
				<a href="#">
					<img src="${pageContext.request.contextPath}/resources/img/icon/main_bottom_icon_join.png" alter="guide" />
					<div class="txt">
						<p class="t1">원포 리뷰어로 활동하세요!</p>
						<p class="t2">회원가입</p>
					</div>
				</a>
			</div>
		</div>
	</div>
</div>



<script>

	$(document).ready(function() {
		getExperience();
		getNotice();
	})

	function getExperience() {
		$.ajax({
			url : '${pageContext.request.contextPath }/mainExper',
			type : 'post',
			success : function(map) {
				if(map != null) {
					(map.deadLineExperience).forEach(function(item) {
						$('.deadLineExperience').append(setExperience(item));
					});

					(map.newExperience).forEach(function(item) {
						$('.newExperience').append(setExperience(item));
					});

					(map.populaProductExperience).forEach(function(item) {
						$('.populaProductExperience').append(setExperience(item));
					});

					(map.populaPlaceExperience).forEach(function(item) {
						$('.populaPlaceExperience').append(setExperience(item));
					});
				}
			}, error : function(e) {
				console.log(e);
			}
		});
	}


	function setExperience(experience) {

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
								+ '<img src="${pageContext.request.contextPath}/' + experience.main_img + '" width="100%" />'
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
		
		experienceView += '</div>'
						+ '<p class="ex_title">' + experience.title + '</p>'
						+ '<p class="ex_service">' + experience.service + '</p>'
							+ '<div class="ex_pe_prog">'
								+ '<div class="ex_prog_ing" style="width: 0"></div>'
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

	function getNotice() {
		$.ajax({
			url : '${pageContext.request.contextPath}/board/mainNotice',
			type : 'get',
			success : function(result) {
				if(result != null) {
					(result).forEach(function(item) {
						$('.noticeBox ul').append('<a href="${pageContext.request.contextPath}//board/detail?b_num=' + item.b_num + '">'
						+ '<li>' + item.title + '</li>');
					});
				}
			}
		});
	}

</script>