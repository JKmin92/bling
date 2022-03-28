<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<section class="join_1">
		<div class="logo">
			<img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="30%" />
		</div>
		<form action="${pageContext.request.contextPath }/user/joinFrist" method="post" onsubmit="return checkJoinFirst();">
			<table class="insert_data">
				<colgroup>
					<col width="100%" />
				</colgroup>
				<tbody>
					<tr>
						<td><input type="email" placeholder="이메일" name="email"/></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="닉네임" name="nickName" /></td>
					</tr>
					<tr>
						<td><input type="password" placeholder="비밀번호" name="password" /></td>
					</tr>
					<tr>
						<td><input type="password" placeholder="비밀번호 확인" name="ps2" /></td>
					</tr>
					<tr>
						<td><input type="tel" placeholder="연락처(문자 체험 발표 안내 드리니 정확히 기입 부탁드립니다)" name="phone" /></td>
					</tr>
				</tbody>
			</table>
			<div class="agree">
				<div class="all">
					<label><input type="checkbox" id="agreeAll" />서비스 이용에 일괄 동의합니다.</label>
				</div>
				<label><input type="checkbox" name="service" />서비스 이용약관에 동의합니다. (필수)</label>
				<label><input type="checkbox" name="privat"/>개인정보 취급 방침에 동의합니다. (필수)</label>
				<label><input type="checkbox" name="smsAgr"/>SMS 수신을 동의합니다. (선택)</label>
				<label><input type="checkbox" name="mailAgr"/>이메일 수신을 동의합니다. (선택)</label>
			</div>
			
			<div class="summit">
				<button type="submit">회원가입</button>
			</div>
		</form>
		<div class="simple_join">
			<div class="kakao">카카오로 가입</div>
			<div class="naver">네이버로 가입</div>
		</div>
	</section>
</div>

<script>
	$('#agreeAll').click(function() {
		let agreeArray = [$('input[name=service'), $('input[name=privat'), $('input[name=smsAgr'), $('input[name=mailAgr')];
		if($(this).is(':checked')) {
			for(let i=0; i<=agreeArray.length; i++) {
				agreeArray[i].prop('checked', true);
			}

		} else {
			for(let i=0; i<=agreeArray.length; i++) {
				agreeArray[i].prop('checked', false);
			}
		}
	});

	function checkJoinFirst() {
		let email = $('input[name=email');
		let nickName = $('input[name=nickName');
		let password = $('input[name=password');
		let ps2 = $('input[name=ps2');
		let phone = $('input[name=phone');
		let service = $('input[name=service');
		let privat = $('input[name=privat');
		let smsAgr = $('input[name=smsAgr');
		let mailAgr = $('input[name=mailAgr');


		if(email.val().length <= 0) {
			alert("이메일을 입력하세요");
			return false;
		}

		if(password.val() != ps2.val()) {
			alert("비밀번호가 다릅니다");
			return false;
		}

		if(!service.is(':checked')) {
			alert("서비스 이용약관에 동의해주세요");
			return false;
		}

		if(!privat.is(':checked')) {
			alert("개인정보 취급 방침에 동의하주세요");
			return false;
		}
	}
</script>