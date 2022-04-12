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
						<td><input type="email" placeholder="이메일" name="email"/></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="성함(배송을 위해 실명을 기입해주세요)" name="nickName" /></td>
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
		<div class="simple_join">
			<div class="kakao">카카오로 가입</div>
			<div class="naver">네이버로 가입</div>
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

	$('input[type=checkbox]').click(function() {
		let agreeAll = $('#agreeAll');

		if($(this) == agreeAll) {
			return;
		}

		if(!$(this).is(':checked')) {
			if(agreeAll.is(':checked')) {
				agreeAll.prop('checked', false);
			}
		}

	});

	function email_check(email) {    
		let regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		return (email != '' && email != 'undefined' && regex.test(email)); 
	}

	$('button[type=submit]').click(function() {

		let email = $('input[name=email]').val();
		let nickName = $('input[name=nickName]').val();
		let password = $('input[name=password]').val();
		let ps2 = $('input[name=ps2]').val();
		let phone = $('input[name=phone]').val();
		let service = $('input[name=service]').is(':checked');
		let privat = $('input[name=privat]').is(':checked');
		let smsAgr = $('input[name=smsAgr]').is(':checked');
		let mailAgr = $('input[name=mailAgr]').is(':checked');


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
			'nickName' : nickName,
			'pw' : password,
			'phone_number' : phone,
			'serviceAgr' : service,
			'privatAgr' : privat,
			'sAgr' : smsAgr,
			'eAgr' : mailAgr
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