<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">

    <section class="boardList">

        <div class="boardTit">
            <div class="t01">공지사항</div>
            <div class="t02">블링리뷰의 소식을 전해드립니다.</div>
        </div>

        <ul class="board_list">
            <li class="board_cate">
                <div class="cate01"><span>분류</span></div>
                <div class="cate02"><span>제목</span></div>
                <div class="cate03"><span>작성일</span></div>
            </li>
            <a href="${pageContext.request.contextPath }/board/detail?bdc=1">
                <li>
                    <div class="bo_li_ca"><span>[공지]</span></div>
                    <div class="bo_li_ti"><span>1월 29일 놀러갈꺼임</span></div>
                    <div class="bo_li_day"><span>2022. 01. 20</span></div>
                </li>
            </a>

        </ul>

        <div class="board_paging">
            <ul>
                <a href="#"><li>&#60;</li></a>
                <a href="#"><li class="active">1</li></a>
                <a href="#"><li>2</li></a>
                <a href="#"><li>&#62;</li></a>
            </ul>
        </div>

        <div class="info_btn">
            <div class="half"><a href="${pageContext.request.contextPath }/board/penalty">
                <div class="btn">리뷰 미작성 시 패널티 안내</div>
            </a></div>
           <div class="half"> <a href="${pageContext.request.contextPath }/board/useContents">
                <div class="btn">리뷰 2차 활용 동의 안내</div>
            </a></div>
        </div>

    </section>

</div>