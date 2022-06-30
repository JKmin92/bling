<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>

<div class="interestExper main_ex">
	<div class="mytitle">관심 캠페인</div>
	<ul class="experience_table ex">
		
	</ul>
</div>


<script>

	$(document).ready(function() {
		getInterestCampaign();
	})

	function getInterestCampaign() {
		$.ajax({
			url : '${pageContext.request.contextPath }/experience/interestCampaign/list',
			type : 'get',
			success : function(items) {
				items.forEach(function(i) {
					$('.interestExper ul.experience_table').append(setCampaign(i));
				})
			}
		});
	}

	function setCampaign(experience) {

		let endDate = new Date(experience.endDate);
		let month = '' + (endDate.getMonth() + 1);
		let day = '' + endDate.getDate();

		if(month.length < 2) month = '0' + month;
		if(day.length < 2) day = '0' + day;

		endDate = [month, day].join('.');

		let item = '<li>'
			+ '<div class="experInfo">'
				+ '<a href="${pageContext.request.contextPath}/experience/detail?eNum=' + experience.e_num + '">'
						+ '<div class="ex_thubmnail">'
						+ '<img src="${pageContext.request.contextPath}/' + experience.main_img + '" width="100%">'
					+ '</div>'
				+ '</a>'
				+ '<div class="content">'
					+ '<div class="kind">';
		if(experience.kind_n) {
			item += '<span class="naver" style="color:#03c75a;">BLOG</span>';
		}

		if(experience.kind_i){
			item += '<span class="instagram" style="color:#e94969;">INSTAGRAM</span>';
		}
				item += '</div>'
					+ '<p class="ex_title">'+ experience.title + '</p>'
					+ '<p class="ex_service">' + experience.service + '</p>'
					+ '<div class="ex_pe_prog"></div>'
					+ '<div class="ex_apply_info">'
						+ '<span class="ex_pe">' + experience.applyCount + '/' + experience.headCount + '명</span>'
						+ '<span class="date">' + endDate + '까지</span>'
					+ '</div>'
				+ '</div>'
			+ '</div>'
		+ '</li>';

		return item;
	}

</script>

