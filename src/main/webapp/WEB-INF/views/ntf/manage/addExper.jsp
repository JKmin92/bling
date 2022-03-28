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
                    <li name="blog" data-channel="1">BLOG</li>
                    <li name="insta" data-channel="2">INSTAGRAM</li>
                    <li name="shop" data-channel="3">홈페이지 리뷰</li>
                    <li name="store" data-channel="4">스토어리뷰</li>
                    <li name="store" data-channel="5">영수증리뷰</li>
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
                    <input type="text" name="service">
                </div>
            </div>
        </div>
        
        <div class="tr">
            <div class="tit">상세페이지</div>
            <div class="con">
                <div class="txt in_bor" >
                    <textarea name="detail" style="height: 50px;"></textarea>
                </div>
                <div class="img"><input type="file" name="detailFile"></div>
            </div>
        </div>
        

        <div class="btn">
            <button type="submit" id="submit">다음</button>
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

        let mCategory = $('.mCategory option:selected').text();
        let sCategory = $('.sCategory option:selected').text();
        let title = $('input[name=title').val();
        let subject = $('input[name=subject').val();
        let main_img = $('input[name=main_img').val();
        let channel = [];
        let startDate = $('input[name=startDate').val();
        let desDate = $('input[name=desDate').val();
        let service = $('input[name=service').val();
        let detail = $('textarea[name=detail').val();
        let detailFile = $('input[name=detailFile').val();
        

        $('.channel ul li.active').each(function() {
            channel.push($(this).data('channel'));
        });

        let dataMap = {
            'mCategory' : mCategory,
            'sCategory' : sCategory,
            'title' : title,
            'subject' : subject,
            'main_img' : main_img,
            'channel' : channel,
            'startDate' : startDate,
            'desDate' : desDate,
            'service' : service,
            'detail' : detail,
            'detailFile' : detailFile
        };

        param.push(dataMap);
        let jasonData = JSON.stringify(param);



        $.ajax({
            url : '${pageContext.request.contextPath}/mana/insertExperience',
            type : 'POST',
            data : {'jsonData' : jsonData},
            dataType : 'json',
            success : function(data) {
                if(data.result) {
                    window.location = '${pageContext.request.contextPath }/mana/addExperGuide?eNum=' +data.eNum;
                }
            }, error : function(e) {
                console.log("error");
            }

        });
    });

</script>