<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<section class="myChannel">

    <input type="hidden" name="naverEmail" value="${n_id}"/>

	<h4 class="title">채널추가</h4>

	<ul class="channel_list">
		<li class="nav" style="cursor: pointer;" onclick="navLogin()">
			<img src="${pageContext.request.contextPath}/resources/img/icon/channel/nav_channel_off.png">
		</li>
		<li class="insta">
			<img src="${pageContext.request.contextPath}/resources/img/icon/channel/insta_channel_off.png">
			<p>&nbsp</p>
		</li>
	</ul>

    <div class="channel"><span id="naver_id_login">블로그</span></div>
    <div class="channel">인스타그램</div>

</section>

<script>

	function navLogin() {
		let url = 'https://nid.naver.com/nidlogin.login?oauth_token=ZT2LY0h0AhBimBeEbn&consumer_key=sFd89GzqyDOPCe20rvXH&logintp=oauth2&nurl=https%3A%2F%2Fnid.naver.com%2Foauth2.0%2Fauthorize%3Fresponse_type%3Dtoken%26state%3Dd933ebdd-edec-4661-bce1-a9ef4cb96fb5%26client_id%3DsFd89GzqyDOPCe20rvXH%26redirect_uri%3Dhttp%253A%252F%252Flocalhost%253A8080%252Fone4-1%252Fuser%252Fnav_callback%26locale%3Dko_KR%26inapp_view%3D%26oauth_os%3D&locale=ko_KR&inapp_view=&svctype=';
		window.open(url,'배송지 주소', 'width=500px,height=800px,scrollbars=yes');
	}

	if($('input[name=naverEmail]').val() != '' || $('input[name=naverEmail]').val() != null) {
		$('.channel_list .nav').css('cursor','');
		$('.channel_list .nav').attr('onclick','');
		$('.channel_list .nav img').attr('src','${pageContext.request.contextPath}/resources/img/icon/channel/nav_channel_on.png');
		$('.channel_list .nav').append('<p>${n_id}</p>');
	}

</script>