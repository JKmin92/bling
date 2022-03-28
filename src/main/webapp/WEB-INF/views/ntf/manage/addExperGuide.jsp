<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/ntf/manage/gnb.jsp"%>

<div class="man_container">

    <section class="add_exper">
        
        
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
            <div class="tit">링크</div>
            <div class="con">
                <div class="in_bor">
                    <input placeholder="링크1" type="text" name="site1" >
                </div>
                <div class="in_bor">
                    <input placeholder="링크2" type="text" name="site2">
                </div>
                <div class="in_bor">
                    <input placeholder="링크3" type="text" name="site3">
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

        let keyword = $('input[name=keyword]').val();
        let sKeyword = $('input[name=sKeyword]').val();
        let mission = $('textarea[name=mission]').val();
        let site1 = $('input[name=site1]').val();
        let site2 = $('input[name=site2]').val();
        let site3 = $('input[name=site3]').val();
        let caution = $('textarea[name=caution]').val();

        $.ajax({
            url : '${pageContext.request.contextPath}/experience/insertExperience',

        });
    });

</script>