<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  
<div class="container">
	<section class="join_3">
		<div class="logo">
			<img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="30%" />
		</div>
		
		<p>리뷰 컨텐츠를 작성할 미디어 채널을 설정해주세요.</p>
		<p>(중복 선택 가능)</p>
		
		<ul>
			<a href="#"><li>BLOG</li></a>
			<li id="naver_id_login">INSTA</li>
			<li>YOUTUBE</li>
		</ul>
		
		<div class="summit"><a href="${pageContext.request.contextPath }/user/joinCompletion"><button>다음</button></a></div>
		
	</section>

</div>

<script>

	var naver_id_login = new naver_id_login("sFd89GzqyDOPCe20rvXH", "http://localhost:8080/user/nav_callback");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8080");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();

	// function openNavLogin() {
	// 	window.open('https://nid.naver.com/oauth2.0/authorize?response_type=token&client_id=sFd89GzqyDOPCe20rvXH&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fuser%2FjoinView3&state=d7c1f2a3-bb8a-4759-acea-f75ecee57b3b',
	// 	'naver_login', 'width=700px,height=800px,scrollbars=yes');
	// }

	// function navCallBack() {
	// 	let naver_id_login = new naver_id_login("sFd89GzqyDOPCe20rvXH", "http://localhost:8080/user/navCallBack");
	// 	let name = naver_id_login.getProfileData('name');
	// 	let email = naver_id_login.getProfileData('email');
	// 	let phone = naver_id_login.getProfileData('phone');

	// 	console.log(name + " / " + email + " / " + phone);
	// }
	
</script>