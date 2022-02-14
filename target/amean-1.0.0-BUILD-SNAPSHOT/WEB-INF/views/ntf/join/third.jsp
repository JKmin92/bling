<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<section class="join_3">
		<div class="logo">
			<img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="30%" />
		</div>
		
		<p>리뷰 컨텐츠를 작성할 미디어 채널을 설정해주세요.</p>
		<p>(중복 선택 가능)</p>
		
		<ul>
			<li>BLOG</li>
			<li>INSTA</li>
			<li>YOUTUBE</li>
		</ul>
		
		<div class="summit"><a href="${pageContext.request.contextPath }/user/joinCompletion"><button>다음</button></a></div>
		
	</section>
</div>