<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>

<div class="registerReview">
    <ul>
        <li class="report_review_1">
            <div class="thum">
                <img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%">
            </div>
            <div class="info">
                <div class="title">체험 제목</div>
                <div class="state">상태 : 검토중</div>
                <a href="#"><div class="inquire info_btn">문의하기</div></a>
            </div>
            <div class="updateReview">
                <div class="modify"><a href="https://blog.naver.com/ameanbiz">
                    <div class="suc_url">https://blog.naver.com/ameanbiz</div></a>
                </div>
            </div>
        </li>
        <li class="report_review_1">
            <div class="thum">
                <img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%">
            </div>
            <div class="info">
                <div class="title">체험 제목</div>
                <div class="state">상태 : 수정필요</div>
                <a href="#"><div class="modifyReview info_btn">수정내용</div></a>
                <a href="#"><div class="inquire info_btn">문의하기</div></a>
            </div>
            <div class="updateReview">
                <div class="modify"><input type="text" name="url" placeholder="링크 재업로드 부탁합니다." /></div>
                <button onclick="sendApply(1)">제출하기</button>
            </div>
        </li>
        <li class="report_review_1">
            <div class="thum">
                <img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%">
            </div>
            <div class="info">
                <div class="title">체험 제목</div>
                <div class="state">상태 : 수정필요</div>
                <a href="#"><div class="modifyReview info_btn">수정내용</div></a>
                <a href="#"><div class="inquire info_btn">문의하기</div></a>
            </div>
            <div class="updateReview">
                <div class="modify"><input type="text" name="url" placeholder="링크 재업로드 부탁합니다." /></div>
                <div class="modify">
                    <label class="reivew_label_2" for="review_img_2">스토어리뷰 업로드</label><input id="review_img_2" data-code="2" type="file">
                </div>
                <button onclick="sendApply(1)">제출하기</button>
            </div>
        </li>
        <li class="report_review_1">
            <div class="thum">
                <img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%">
            </div>
            <div class="info">
                <div class="title">체험 제목</div>
                <div class="state">상태 : 채험 마감</div>
                <a href="#"><div class="inquire info_btn">문의하기</div></a>
            </div>
            <div class="updateReview">
                <div class="modify"><a href="https://blog.naver.com/ameanbiz">
                    <div class="suc_url">https://blog.naver.com/ameanbiz</div></a>
                </div>
            </div>
        </li>
    </ul>
</div>