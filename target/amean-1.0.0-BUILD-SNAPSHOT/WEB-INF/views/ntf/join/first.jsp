<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<section class="join_1">
		<div class="logo">
			<img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="30%" />
		</div>
		<table class="insert_data">
			<colgroup>
				<col width="100%" />
			</colgroup>
			<tbody>
				<tr>
					<td><input type="email" placeholder="이메일"/></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="닉네임" /></td>
				</tr>
				<tr>
					<td><input type="password" placeholder="비밀번호" /></td>
				</tr>
				<tr>
					<td><input type="password" placeholder="비밀번호 확인" /></td>
				</tr>
			</tbody>
		</table>
		<div class="agree">
			<div class="all">
				<label><input type="checkbox" id="agreeAll" />서비스 이용에 일괄 동의합니다.</label>
			</div>
			<label><input type="checkbox" name="service" />서비스 이용약관에 동의합니다. (필수)</label>
			<label><input type="checkbox" id="private"/>개인정보 취급 방침에 동의합니다. (필수)</label>
			<label><input type="checkbox" id="sms"/>SMS 수신을 동의합니다. (선택)</label>
			<label><input type="checkbox" id="email"/>이메일 수신을 동의합니다. (선택)</label>
		</div>
		
		<div class="summit">
			<a href="${pageContext.request.contextPath }/user/joinView2"><button>회원가입</button></a>
		</div>
		
		<div class="simple_join">
			<div class="kakao">카카오로 가입</div>
			<div class="naver">네이버로 가입</div>
		</div>
	</section>
</div>