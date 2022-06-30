<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="kr.com.amean.entity.user.User"%>
<% 
	User user = (User)session.getAttribute("user"); 
	String name = (String)user.getName();
%>
<style>
    .joinCon {margin:100px auto 0 auto !important; min-width:auto; width:400px; min-width: auto;}
    @media (max-width : 787px) {
        .joinCon {width:100%;}
    }
</style>
<div class="container joinCon">
	<section class="join_4">
		<div class="logo">
			<img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="100%" />
		</div>
		<p style="margin-top:50px; margin-bottom: 0;"><span><% out.println(name); %></span> 님 원포에 가입하신것을</p>
		<h5>환영합니다!</h5>
		
		<p>마이페이지에서 캠페인 신청에 필요한 정보를 입력하시고</p>
		<p>미디어를 등록해보세요</p>
		<p>원포의 다양한 캠페인에 참여하실 수 있습니다.</p>
		
		<button style="background-color: #3d0000;" onclick="location.href='${pageContext.request.contextPath }/'">메인으로</button>
		<button onclick="location.href='${pageContext.request.contextPath }/user/mypage'">마이페이지</button>
		
	</section>
</div>