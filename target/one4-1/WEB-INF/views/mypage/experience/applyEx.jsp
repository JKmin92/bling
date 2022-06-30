<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>

<section class="apply_list">
	<div class="mytitle">나의 캠페인</div>
	<div class="state">
		<ul class="exper_state">
			<li class="active"><a href="${pageContext.request.contextPath}/user/mypage/applyExperience">신청한 캠페인</a></li>
			<li><a href="${pageContext.request.contextPath}/user/mypage/selectExper">선정된 캠페인</a></li>
			<li><a href="${pageContext.request.contextPath}/user/mypage/insertExper">미등록 캠페인</a></li>
			<li><a href="${pageContext.request.contextPath}/user/mypage/registerReview">등록한 컨텐츠</a></li>
		</ul>
	</div>

	<ul class="experList">
			
			
	</ul>
</section>
</div>
<script>

	$(document).ready(function() {
		let locate = window.location.href;
		if(locate.includes('applyExperience')) {
			$('.apply_list').css('display','block');
			$('.my_profile').css('display','none');
		}

		getExperience();
	});

	function getExperience() {
		$.ajax({
			url : '${pageContext.request.contextPath}/user/applyExperienceList',
			type : 'post',
			success : function(result) {
				if(result != null) {
					(result.exList).forEach(function(experience) {
						$('.experList').append(setExperienceList(experience));
					});

					if(result.exList.length <= 0) {
						$('.experList').append('<div class="expernone">신청하신 체험이 없습니다</div>');
					}
				}
			}, error : function(e) {
				console.log("오류");
			}
		});
	}

	function setExperienceList(experience) {

		let date = new Date(experience.desDate);
		let month = '' + (date.getMonth() + 1);
		let day = '' + date.getDate();
		let year = date.getFullYear();

		if(month.length < 2) month = '0' + month;
		if(day.length < 2) day = '0' + day;

		desDate = year + '.' + month + '.' + day;

		let experienceView = '<li>'
			+ '<a href="${pageContext.request.contextPath }/experience/detail?eNum=' + experience.e_num + '" >'
			+ '<div class="thum"><img src="${pageContext.request.contextPath }/' + experience.main_img + '" width="100%"></div>'
			+ '</a>'
				+ '<div class="exper_info">'
					+ '<div class="channel">';
		
		if(experience.kind_n == true) {
			experienceView += '<span class="naver" style="color:#03c75a;">BLOG</span>';
		}

		if(experience.kind_i == true) {
			experienceView += '<span class="instagram" style="color:#e94969;">INSTAGRAM</span>';
		}

		if(experience.kind_h == true) {
			experienceView += '<span class="homepage" style="color:#707070;">HOMEPAGE</span>';
		}

		if(experience.kind_s == true) {
			experienceView += '<span class="naver" style="color:#03c75a;">STORE</span>';
		}

		if(experience.kind_r == true) {
			experienceView += '<span class="naver" style="color:#03c75a;">영수증리뷰</span>';
		}
						
		experienceView += '</div>'
					+ '<p class="exper_title">' + experience.title + '</p>'
					+ '<div class="t01">' + experience.service +'</div>'
					+ '<div class="date">발표일 : ' + dateFormat(experience.desDate) +'</div>'
					
				+ '</div>'
				+ '<a href="${pageContext.request.contextPath}/user/mypage/applyDetail?eNum=' + experience.e_num +'"><div class="detail_btn">자세히보기</div></a>'
			+ '</li>'
		return experienceView;
	}

	function dateFormat(date) {
        let dateFom = new Date(date);
		let month = '' + (dateFom.getMonth() + 1);
		let day = '' + dateFom.getDay();

		if(month.length < 2) month = '0' + month;
		if(day.length < 2) day = '0' + day;

		return dateFom = [month, day].join('.');
    }


	
</script>