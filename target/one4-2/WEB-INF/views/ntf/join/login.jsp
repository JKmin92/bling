<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
    <section class="login">
        
        <div class="logo">
			<img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="30%" />
		</div>

            <div class="user_info">
                <div class="user_id">
                    <input type="email" placeholder="email" name="email" />
                </div>
                <div class="user_pw">
                    <input type="password" placeholder="password" name="password" />
                </div>
                <div class="btns">
                    <div class="auto_login">
                        <label><input type="checkbox" name="autoLogin">자동로그인</label>
                    </div>
                    <div class="lost_pw">
                        <a href="#"><span>비밀번호 찾기</span></a>
                    </div>
                </div>
                <button class="login_btn">로그인</button>
            </div>

        <div class="log_join">
            <div class="btn naver">NAVER</div>
            <div class="btn kakao">KAKAO</div>
            <div class="btn join" onclick="location.href='${pageContext.request.contextPath}/user/joinView'">회원가입</div>
        </div>

        <div class="bottom_locate">
            <div class="btm_btn">회사소개</div>
            <div class="btm_btn">광고문의</div>
            <div class="btm_btn">체험단문의</div>
        </div>


        
    </section>
</div>

<script>
    $('input[name=password]').keydown(function(key) {
        if(key.keyCode == 13) {
            $('.login_btn').click();
        }
    });

    $('.login_btn').on('click', function() {
        let email = $('input[name=email]').val();
        let password = $('input[name=password]').val();

        if(email.length == 0) {
            alert('email을 입력해주세요');
            return false;
        }

        if(password.length == 0) {
            alert('비밀번호를 입력해주세요');
            return false;
        }

        $.ajax({
            url : '${pageContext.request.contextPath}/user/login/go',
            data : {'id':email, 'password':password},
            type : 'post',
            success : function(result) {
                if(result.data) {
                    window.location = '${pageContext.request.contextPath }/'
                } else {
                    alert("ID 또는 비밀번호가 다릅니다.");
                }
            }, error : function(e) {
                console.log(e);
                alert("로그인에 실패했습니다.")
            }
        })
    });
</script>

