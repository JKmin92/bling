<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
    <section class="login">
        
        <div class="logo">
			<img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="30%" />
		</div>

        <form action="${pageContext.request.contextPath}/user/login/go" method="post">
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
                <button class="login_btn testBTN" type="submit">테스트 로그인</button>
                <button class="login_btn" onclick="location.href='${pageContext.request.contextPath}/user/mypage'">로그인</button>
            </div>
        </form>

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

