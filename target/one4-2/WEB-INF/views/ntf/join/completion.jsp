<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="kr.com.amean.entity.user.User"%>
<% 
	User user = (User)session.getAttribute("user"); 
	String NickName = (String)user.getNickName();
%>
<div class="container">
	<section class="join_4">
		<div class="logo">
			<img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="30%" />
		</div>
		<p><span><% out.println(NickName); %></span> 님 원포에 가입하신것을</p>
		<h5>환영합니다!</h5>
		
		<p>마이페이지에서 캠페인 신청에 필요한 정보를 입력하시고</p>
		<p>미디어를 등록해보세요</p>
		<p>블링의 다양한 캠페인에 참여하실 수 있습니다.</p>
		
		<button onclick="location.href='${pageContext.request.contextPath }/user/mypage'">마이페이지</button>
		<button onclick="location.href='${pageContext.request.contextPath }/'">메인으로</button>
	</section>
</div>