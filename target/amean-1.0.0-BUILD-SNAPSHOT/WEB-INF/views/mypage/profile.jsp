<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="my_profile">
    <div class="info">
        <div class="thum">
            <div class="img" style="background:url('${pageContext.request.contextPath}/resources/img/user/user1.jpg') no-repeat; background-size:cover;" ></div>
        </div>
        <div class="user">
            <div class="name">USER</div>
            <div class="mail">ameanbiz@naver.com</div>
        </div>
        <div class="channel">
            <ul>
                <li><img src="${pageContext.request.contextPath}/resources/img/icon/channel/ico_nav_active.png" width="22px"></li>
                <li><img src="${pageContext.request.contextPath}/resources/img/icon/channel/ico_insta_inact.png" width="22px"></li>
            </ul>
        </div>
        <div class="point">
            포인트 <span>1000P</span>
        </div>
    </div>
</div>