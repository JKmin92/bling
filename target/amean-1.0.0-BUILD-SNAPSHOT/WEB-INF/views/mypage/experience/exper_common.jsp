<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="mysimple">
    <div class="campaign_state">
        <h3>나의 캠페인</h3>

        <ul>
            <a href="${pageContext.request.contextPath}/user/mypage">
                <li class="counting">
                    <div class="num">18</div>
                    <div class="subject">신청한 캠페인</div>
                </li>
            </a>
            <li class="next">></li>
            <a href="${pageContext.request.contextPath}/user/mypage/selectExper">
                <li class="counting">
                    <div class="num">3</div>
                    <div class="subject">선정된 캠페인</div>
                </li>
            </a>
            <li class="next">></li>
            <a href="${pageContext.request.contextPath}/user/mypage/insertExper">
                <li class="counting">
                    <div class="num">3</div>
                    <div class="subject">미등록 컨텐츠</div>
                </li>
            </a>
            <li class="next">></li>
            <a href="${pageContext.request.contextPath}/user/mypage/registerReview">
                <li class="counting">
                    <div class="num">3</div>
                    <div class="subject">등록한 컨텐츠</div>
                </li>
            </a>
        </ul>
    </div>
    
    <div class="channel">
        <ul class="exper_state">
            <li>네이버 블로그</li>
            <li>인스타그램</li>
            <li>유튜브</li>
            <li></li>
        </ul>
    </div>
    
</div>