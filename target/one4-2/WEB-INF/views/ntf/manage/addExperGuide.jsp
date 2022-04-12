<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/ntf/manage/gnb.jsp"%>

<div class="man_container">

    <form action="${pageContext.request.contextPath}/mana/insertExperGuide" method="post">
    <section class="add_exper">

        <input type="hidden" value="${eNum}" name="eNum"/>
        <input type="hidden" value="${mCate}" name="mCate"/>

        <div class="tr">
            <div class="tit">체험 이름</div>
            <div class="con">
                <p>${experTitle}</p>
            </div>
        </div>
        
        <div class="tr">
            <div class="tit">가이드라인 이름</div>
            <div class="con">
                <div class="in_bor">
                    <input placeholder="가이드라인을 구별하도록 이름을 정해주세요." type="text" name="guideName" >
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
                        <input type="text" placeholder="미작성 시 노출안됨" name="subKeyword">
                    </div>
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">해시태그</div>
            <div class="con">
                <div class="in_bor">
                        <input type="text" placeholder=",으로 구분" name="teg">
                </div>
                
            </div>
        </div>
        <div class="tr placeInfo">
            <div class="tit">방문안내</div>
            <div class="con">
                <div class="in_bor">
                    <textarea name="visitInfo"></textarea>
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
        <div class="tr locate">
            <div class="tit">매장주소</div>
            <div class="con">
                <div class="in_bor">
                    <input name="locate" placeholder="정확한 매장 주소" type="text">
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">링크</div>
            <div class="con">
                <div class="in_bor" style="margin-bottom: 15px;">
                    <input placeholder="링크1" type="text" name="homepage" >
                </div>
                <div class="in_bor" style="margin-bottom: 15px;">
                    <input placeholder="링크2" type="text" name="site2">
                </div>
                <div class="in_bor" style="margin-bottom: 15px;">
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
        <div class="tr">
            <div class="tit">작성 마감일</div>
            <div class="con date">
                <div class="dateType" style="padding:30px 0;">
                    <label><input type="radio" name="dateType" class="dateType_date" checked>날짜</label>
                    <label><input type="radio" name="dateType" class="dateType_text">직접입력</label>
                </div>
                <div class="in_bor" style="margin:0;">
                    <input type="date" name="close_Date" class="closeDate_dateType">
                </div>
            </div>
        </div>
        
        

        <div class="btn">
            <div class="cancel">취소</div>
            <button type="submit" id="submit">등록</button>
        </div>
    </section>
    </form>
</div>

<script>

    $('input[name=dateType]').change(function() {
        let dateType = '<input type="date" name="close_Date" class="closeDate_dateType">';
        let textType = '<input type="text" name="close_Date" class="closeDate_textType">';
        if($(this).hasClass('dateType_date')) {
            if($('.date in_bor').find('.closeDate_textType')) {
                $('.closeDate_textType').remove();
                $('.date .in_bor').append(dateType);
            }
            
        } else if($(this).hasClass('dateType_text')) {
            if($('.date in_bor').find('.closeDate_dateType')) {
                $('.closeDate_dateType').remove();
                $('.date .in_bor').append(textType);
            }
        }
    });

    if($('input[name=mCate]').val() != 1) {
        $('.placeInfo').css('display', 'none');
        $('.locate').css('display','none');
    }

    $('.channel li').click(function () {
        let hasActive = $(this).hasClass('active');
        if(hasActive) {
            $(this).removeClass('active');
        } else {
            $(this).addClass('active');
        }
    });

    $('#submit').click(function() {

        let guideName = $('input[name=guideName]').val();
        let keyword = $('input[name=keyword]').val();
        let sKeyword = $('input[name=sKeyword]').val();
        let mission = $('textarea[name=mission]').val();
        let teg = $('input[name=teg]').val();
        let site1 = $('input[name=site1]').val();
        let site2 = $('input[name=site2]').val();
        let site3 = $('input[name=site3]').val();
        let caution = $('textarea[name=caution]').val();
        let closeDate = $('intput[name=closeDate]').val();

        let param = {
            'guideName' : guideName,
            'keyword' : keyword,
            'sKeyword' : sKeyword,
            'mission' : mission,
            'teg' : teg,
            'site1' : site1,
            'site2' : site2,
            'site3' : site3,
            'caution' : caution,
            'closeDate' : closeDate
        }
        let jasonData = JSON.stringify(param);

        $.ajax({
            url : '${pageContext.request.contextPath}/experience/insertExperGuide',
            type : 'POST',
            data : JSON.stringify(dataMap),
            contentType : 'application/json; charset=UTF-8',
            dataType : 'json',
            success : function(data) {
                if(data.result) {
                    window.location = '${pageContext.request.contextPath }/mana';
                }
            }, error : function(e) {
                console.log("체험등록오류");
                console.log(e);
            }

        });
    });

</script>