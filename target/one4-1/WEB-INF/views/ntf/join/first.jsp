<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
    .joinCon {margin:70px auto 0 auto !important; min-width:auto; width:400px; min-width: auto;}
    @media (max-width : 787px) {
        .joinCon {width:100%;}
    }
</style>
<div class="container joinCon">
	<section class="join_1">
		<div class="logo">
			<a href="/"><img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="100%" /></a>
		</div>
			<table class="insert_data">
				<colgroup>
					<col width="100%" />
				</colgroup>
				<tbody>
					<tr>
						<td><input type="email" placeholder="이메일" name="email"/></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="성함(배송을 위해 실명을 기입해주세요)" name="name" /></td>
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
				<!-- <div class="all">
					<input type="checkbox" name="agreeAll" id="agreeAll" /><label for="agreeAll"><i></i>서비스 이용에 일괄 동의합니다.</label>
				</div> -->
				<input type="checkbox" name="service" id="service" /><label for="service"><i></i>서비스 이용약관에 동의합니다. (필수)</label>
				<input type="checkbox" name="privat" id="privat" /><label for="privat"><i></i>개인정보 취급 방침에 동의합니다. (필수)</label>
				<input type="checkbox" name="sAgr" id="sAgr" /><label for="sAgr"><i></i>캠페인 모집 및 추천, 이벤트 정보 등 마케팅 수신<br><i style="visibility: hidden;"></i>(이메일, 문자, 카카오톡 등)에 동의합니다. (선택)</label>
			
				<table class="agreeContents">
					<tr>
						<th>목적</th>
						<th>항목</th>
						<th>보유 및 이용기간</th>
					</tr>
					<tr>
						<td>이용자 식별 및<br>본인여부 확인</td>
						<td>이메일, 성함,<br>비밀번호, 연락처</td>
						<td>회원탈퇴시까지</td>
					</tr>
				</table>
				
			</div>


			
			<div class="summit">
				<button type="submit">회원가입</button>
			</div>
			<div class="social">
				<span>SNS 계정 가입</span>
				<div class="channel">
					<button><img src="${pageContext.request.contextPath}/resources/img/icon/channel/login_naver.png" width="40px"></button>
					<button><img src="${pageContext.request.contextPath}/resources/img/icon/channel/login_kakao.png" width="40px"></button>
					<button><img src="${pageContext.request.contextPath}/resources/img/icon/channel/login_facebook.png" width="40px"></button>
				</div>
			</div>
	</section>
</div>

<script>
	$('#agreeAll').click(function() {
		if($(this).is(':checked')) {
			$('input[type=checkbox]').prop('checked', true);

		} else {
			$('input[type=checkbox]').prop('checked', false);
		}
	});

	/* $('input[type=checkbox]').click(function() {
		let agreeAll = $('#agreeAll');

		if($(this) == agreeAll) {
			return;
		}

		if(!$(this).is(':checked')) {
			if(agreeAll.is(':checked')) {
				agreeAll.prop('checked', false);
			}
		}

	}); */

	$(document).ready(function() {
		let email = getParameterByName("email");

		if(email != null && email != '' && email != 'undefined') {
			$('input[name=email]').val(email);
		}

	});

	function email_check(email) {    
		let regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		return (email != '' && email != 'undefined' && regex.test(email)); 
	}

	$('button[type=submit]').click(function() {

		let email = $('input[name=email]').val();
		let name = $('input[name=name]').val();
		let password = $('input[name=password]').val();
		let ps2 = $('input[name=ps2]').val();
		let phone = $('input[name=phone]').val();
		let service = $('input[name=service]').is(':checked');
		let privat = $('input[name=privat]').is(':checked');
		let smsAgr = $('input[name=sAgr]').is(':checked');
		let channel = getParameterByName("channel");
		let channelId = '';

		if(channel != null && channel != '') {
			channelId = getParameterByName("channelId");
		}
		


		if(email.length <= 0) {
			alert("이메일을 입력하세요");
			$('input[name=email]').focus();
			return false;
		}

		if(!email_check(email) ) {
			alert('이메일 형식으로 적어주세요');
			$('input[name=email]').focus();
			return false;
		}

		if(name.length <= 0) {
			alert('성함을 입력하세요');
			$('input[name=name]').focus();
			return false;
		}

		if(phone.length <= 0) {
			alert('연락처를 입력하세요');
			$('input[name=phone]').focus();
			return false;
		}

		if(password.length <= 7) {
			alert("비밀번호는 8자 이상 설정해주세요.");
			$('input[name=password]').focus();
			return false;
		}

		if(password != ps2) {
			alert("비밀번호가 다릅니다");
			$('input[name=ps2]').focus();
			return false;
		}

		if(!service) {
			alert("서비스 이용약관에 동의해주세요");
			$('input[name=service]').focus();
			return false;
		}

		if(!privat) {
			alert("개인정보 취급 방침에 동의하주세요");
			$('input[name=privat]').focus();
			return false;
		}

		let sendData = {
			'id' : email,
			'name' : name,
			'password' : password,
			'phone_number' : phone,
			'serviceAgr' : service,
			'privatAgr' : privat,
			'sAgr' : smsAgr,
			'channel' : channel,
			'channelId' : channelId
		};

		$.ajax({
			url : '${pageContext.request.contextPath }/user/joinFrist',
			type : 'post',
			data : sendData,
			success : function(result) {
                if(result.data) {
                    window.location = '${pageContext.request.contextPath }/user/joinSec'
                } else {
                    alert("회원 가입된 계정입니다.");
                }
            }, error : function(e) {
                console.log(e);
                alert("회원가입에 실패했습니다.")
            }
		})

	});
		
	
</script>