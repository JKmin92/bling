<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container" style="margin:0;">

    <section class="ex_aply">
        <div class="exper_left">
            <div class="tit">
                <h3>캠페인 신청</h3>
            </div>
            <div class="aply_ul">
                <div class="aply_li">
                    <div class="aply_tit">체험 내용</div>
                    <div class="aply_cont">
                        히알루론산 앰플 30ml 제공
                    </div>
                </div>
                <div class="aply_li">
                    <div class="aply_tit">회원 정보</div>
                    <div class="aply_cont">
                        <div class="aply_inp">
                            <input type="text" placeholder="성함" />
                        </div>
                        <div class="aply_inp">
                            <input type="tel" placeholder="연락처" />
                        </div>
                        <div class="aply_but">
                            <button>+배송지 추가</button>
                        </div>
                    </div>
                </div>
                <div class="aply_li">
                    <div class="aply_tit">블로그 등록</div>
                    <div class="aply_cont">
                        <p>콘텐츠를 작성할 블로그 링크를 등록해주세요. 등록한 블로그는 선정 후 변경할 수 없습니다.</p>
                        <div class="channel_add">
                            <input type="text" placeholder="https://blog.naver.com/아이디" /> <button>등록</button>
                        </div>
                    </div>
                </div>
                <div class="aply_li">
                    <div class="aply_tit">안내 사항</div>
                    <div class="aply_cont">
                        <div class="caution">
                            본 체험은 어쩌구 저쩌구 이니 이거 저거 꼭 작성 해주세요. 알겠죠?
                        </div>
                        <div class="agree">
                            <label><input type="checkbox" name="caution_agree">네, 동의합니다.</label>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="exper_right">
            <div class="info_area">
                <div class="thubm">
                    <img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%" />
                </div>
                <h4>히알루론산 앰플 체험단</h4>
				<ul>
					<li class="ex_apply_date">
						<div class="title">모집기간</div>
						<div class="content">01.20 ~ 01.25</div>
					</li>
					<li class="ex_apply_ann_date">
						<div class="title">발표일</div>
						<div class="content">01.26</div>
					</li>
				</ul>
				<div class="agr">
                    <label><input type="checkbox" name="agree1">마케팅 활용에 동의합니다.</label><br><span class="ag_zoom">자세히보기</span>
                </div>
                <div class="agr">
                    <label><input type="checkbox" name="agree2">캠페인 유의사항 및 제 3자 제공에 모두 동의 합니다</label><br><span class="ag_zoom">자세히보기</span>
                </div>
				<div class="apply_btn">신청하기</div>
			</div>
        </div>
    </section>

</div>