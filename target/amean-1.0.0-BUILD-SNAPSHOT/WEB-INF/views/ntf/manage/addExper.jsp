<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/ntf/manage/gnb.jsp"%>

<div class="man_container">

    <section class="add_exper">
        <div class="tr">
            <div class="tit">카테고리</div>
            <div class="con">
                <select class="mCategory">
                    <option>방문</option>
                    <option>제품</option>
                    <option>기자단</option>
                </select>
                <select class="sCategory">
                    <option>뷰티</option>
                    <option>식품/생활</option>
                    <option>육아</option>
                    <option>차량/캠핑</option>
                    <option>IT/가전제품</option>
                </select>
            </div>
        </div>
        <div class="tr">
            <div class="tit">제목</div>
            <div class="con">
                <div class="in_bor">
                    <input type="text" name="title">
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">부제</div>
            <div class="con">
                <div class="in_bor">
                    <input type="text" name="subject">
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">메인 이미지</div>
            <div class="con">
                <div class="in_bor">
                    <input type="file" name="main_img">
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">채널</div>
            <div class="con channel">
                <ul>
                    <li name="blog">BLOG</li>
                    <li name="insta">INSTAGRAM</li>
                    <li name="shop">홈페이지 리뷰</li>
                    <li name="store">스토어리뷰</li>
                </ul>
            </div>
        </div>
        <div class="tr">
            <div class="tit">모집기간</div>
            <div class="con">
                <div class="start date">
                    시작기간 <div class="in_bor">
                        <input type="date" name="startDate">
                    </div>
                </div>
                <div class="end date" style="padding-top:40px;">
                    종료기간 <div class="in_bor"><input type="date" name="endDate"></div>
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">발표일</div>
            <div class="con date">
                <div class="in_bor" style="margin:0;">
                    <input type="date" name="desDate">
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">체험서비스</div>
            <div class="con">
                <div class="in_bor">
                    <input type="text">
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">키워드</div>
            <div class="con">
                <div class="main keyword">
                    메인 키워드 <div class="in_bor">
                        <input type="text" placeholder=",으로 구분" name="keyword">
                    </div>
                </div>
                <div class="sub keyword" style="padding-top:40px;">
                    서브 키워드 <div class="in_bor">
                        <input type="text" placeholder="미작성 시 노출안됨" name="sKeyword">
                    </div>
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">체험미션</div>
            <div class="con">
                <div class="in_bor">
                    <textarea name="mission"></textarea>
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">주의사항</div>
            <div class="con">
                <div class="in_bor">
                    <textarea name="caution" placeholder="기본 주의사항은 디폴트"></textarea>
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">상세페이지</div>
            <div class="con">
                <div class="txt in_bor" >
                    <textarea name="caution" style="height: 50px;"></textarea>
                </div>
                <div class="img"><input type="file"></div>
            </div>
        </div>
        

        <div class="btn">
            <button type="submit" id="submit">등록</button>
            <div class="cancel">취소</div>
        </div>
    </section>
</div>

<script>

    $('.channel li').click(function () {
        let hasActive = $(this).hasClass('active');
        if(hasActive) {
            $(this).removeClass('active');
        } else {
            $(this).addClass('active');
        }
    });

    $('#submit').click(function() {

        let

        $.ajax({
            url : '${pageContext.request.contextPath}/experience/insertExperience',

        });
    });

</script>