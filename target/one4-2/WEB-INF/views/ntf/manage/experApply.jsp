<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/ntf/manage/gnb.jsp"%>

<div class="man_container">

    <section class="experApply">
        <div class="title">
            <h3>히알루론산 앰플 체험단</h3>
        </div>
        <div class="btns">
            <div class="href_btn modify">수정하기</div>
            <div class="href_btn remove">삭제하기</div>
        </div>
        <div class="experInfo">
            <div class="channel">
                <ul>
                    <li class="show">BLOG</li>
                    <li>INSTAGRAM</li>
                    <li>홈페이지 리뷰</li>
                    <li>스토어리뷰</li>
                </ul>
            </div>
            <div class="ex_date">
                <div class="t1">모집기간</div>
                <div class="t2">01.20 ~ 01.25</div>
            </div>
            <div class="ex_date">
                <div class="t1">발표일</div>
                <div class="t2">01.26</div>
            </div>
        </div>

        <table class="apply_list blog">
            <colgroup>
                <col width="5%">
                <col width="15%">
                <col width="15%">
                <col width="15%">
                <col width="15%">
                <col width="15%">
                <col width="20%">
            </colgroup>
            <thead>
                <tr>
                    <td>No</td>
                    <td>이름</td>
                    <td>연락처</td>
                    <td>email</td>
                    <td>방문자수</td>
                    <td>이웃수</td>
                    <td>주소지</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>민정기</td>
                    <td>010-6551-3317</td>
                    <td>jeongkey3317@naver.com</td>
                    <td>50 ~ 60</td>
                    <td>300명</td>
                    <td>인천시 계양구 장제로 878 111동 1102호</td>
                </tr>
            </tbody>
        </table>

    </section>

</div>