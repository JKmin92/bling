<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/ntf/manage/gnb.jsp"%>
<style>
   
</style>
<div class="man_container">

    <section class="add_exper">

        <c:if test="${!empty experience}">
            <fmt:formatDate value="${experience.startDate}" var="startDate" pattern="yyyy-MM-dd"/>
            <fmt:formatDate value="${experience.endDate}" var="endDate" pattern="yyyy-MM-dd"/>
            <fmt:formatDate value="${experience.desDate}" var="desDate" pattern="yyyy-MM-dd"/>
            <input type="hidden" value="${experience.e_num}" name="data_e_num" />
            <input type="hidden" value="${experience.MCategory}" name="data_mCategory" />
            <input type="hidden" value="${experience.SCategory}" name="data_sCategory" /> 
            <input type="hidden" value="${experience.title}" name="data_title" />
            <input type="hidden" value="${experience.subject}" name="data_subject" />
            <input type="hidden" value="${experience.area}" name="data_area" />
            <input type="hidden" value="${experience.subArea}" name="data_subarea" />
            <input type="hidden" value="${experience.kind_n}" name="data_kind_n" />
            <input type="hidden" value="${experience.kind_i}" name="data_kind_i" />
            <input type="hidden" value="${experience.kind_h}" name="data_kind_h" />
            <input type="hidden" value="${experience.kind_s}" name="data_kind_s" />
            <input type="hidden" value="${experience.kind_r}" name="data_kind_r" />
            <input type="hidden" value="${experience.headCount}" name="data_headCount" />
            <input type="hidden" value="${startDate}" name="data_startDate" />
            <input type="hidden" value="${endDate}" name="data_endDate" />
            <input type="hidden" value="${desDate}" name="data_desDate" />
            <input type="hidden" value="${experience.service}" name="data_service" />
        </c:if>

        <div class="tr">
            <div class="tit">카테고리</div>
            <div class="con">
                <select class="mCategory" name="mCategory">
                    <c:if test="${!empty mCategoryList}">
                        <c:forEach items="${mCategoryList}" var="mCate" varStatus="status">
                            <option data-code="${mCategoryCodeList[status.index]}">${mCate}</option>
                        </c:forEach>
                    </c:if>
                </select>
                    
                <select class="sCategory" name="sCategory">
                    <option>뷰티</option>
                    <option>식품</option>
                    <option>생활용품</option>
                    <option>육아</option>
                    <option>차량·캠핑</option>
					<option>반려동물</option>
					<option>IT·가전제품</option>
					<option>기타</option>
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
        
        <div class="tr place">
            <div class="tit">매장 위치</div>
            <div class="con">
                <div class="in_bor">
                    <select class="area" name="area">
                        <option value="서울">서울</option>
                        <option value="경기/인천">경기/인천</option>
                        <option value="대전/충북">대전/충북</option>
                        <option value="대구/경북">대구/경북</option>
                        <option value="부산/경남">부산/경남</option>
                        <option value="광주/전라">광주/전라</option>
                        <option value="다른지역">다른지역</option>
                    </select>
                    <select class="subArea" name="subArea"></select>
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">채널</div>
            <div class="con channel">
                <ul>
                    <li><input type="checkbox" name="kind_n" id="kind_n" ><label for="kind_n">BLOG</label></li>
                    <li><input type="checkbox" name="kind_i" id="kind_i"><label for="kind_i">INSTAGRAM</label></li>
                    <li><input type="checkbox" name="kind_h" id="kind_h"><label for="kind_h">홈페이지 리뷰</label></li>
                    <li><input type="checkbox" name="kind_s" id="kind_s"><label for="kind_s">스토어리뷰</label></li>
                    <li><input type="checkbox" name="kind_r" id="kind_r"><label for="kind_r">영수증리뷰</label></li>
                </ul>
            </div>
        </div>
        <div class="tr">
            <div class="tit">모집인원</div>
            <div class="con">
                <div class="in_bor">
                    <input type="number" name="headCount" placeholder="본 체험에 모집하는 인원 설정, 숫자만 입력">
                </div>
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
            <div class="tit">캠페인 종료</div>
            <div class="con date">
                <div class="in_bor" style="margin:0;">
                    <input type="date" name="closeDate">
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
        
        
        

            <div class="btn">
                <div class="cancel">취소</div>
                <button type="submit" id="submit">다음</button>
            </div>
    </section>
</div>

<script>

    const seoul = ['강남/논현', '강동/천호', '강서/목동', '건대/왕십리', '관악/신림', '교대/사당', '노원/강북', '명동/이태원', '삼성/선릉', '송파/잠실', '수유/동대문', '신촌/이대', '압구정/신사', '여의도/영동포', '종로/대학로', '홍대/마포'];
	const incheon = ['일산/파주', '용인/분당/수원', '인천/부천', '남양주/구리/하남', '안양/안산/광명'];
	const deajeon = ['대전', '충청'];
	const deagoo = ['대구', '경북'];
	const busan = ['부산', '경남'];
	const gwangju = ['광주', '전라'];
	const other = ['강원', '제주'];

    $('.area').change(function() {
        let areaValue = $(this).val();
        $('.subArea option').remove();
        
        if(areaValue == '서울') {
            seoul.forEach(function(item) {
                $('.subArea').append('<option value="' + item + '">'+ item + '</option>');
            });
        }

        else if(areaValue == '경기/인천') {
            incheon.forEach(function(item) {
                $('.subArea').append('<option value="' + item + '">'+ item + '</option>');
            });
        }

        else if(areaValue == '대전/충북') {
            deajeon.forEach(function(item) {
                $('.subArea').append('<option value="' + item + '">'+ item + '</option>');
            });
        }

        else if(areaValue == '대구/겅북') {
            deagoo.forEach(function(item) {
                $('.subArea').append('<option value="' + item + '">'+ item + '</option>');
            });
        }

        else if(areaValue == '광주/전라') {
            gwangju.forEach(function(item) {
                $('.subArea').append('<option value="' + item + '">'+ item + '</option>');
            });
        }

        else if(areaValue == '다른지역') {
            other.forEach(function(item) {
                $('.subArea').append('<option value="' + item + '">'+ item + '</option>');
            });
        }
    });

    $('.mCategory').change(function() {
        let code = $('.mCategory option:selected').data('code');
        changeSCategory(code);
        if(code == 1) {
            $('.place').css('display', 'none');
            $('input[name=area]').val('');
        } else {
            $('.place').css('display', 'table');
        }

        if(code == 3 || code == 4) {
            $('.sCategory').css('display','none');
        } else {
            $('.sCategory').css('display','inline-block');
        }
    });

    function changeSCategory(code) {
        $('.sCategory option').remove();
        $.ajax({
            url : '${pageContext.request.contextPath}/mana/addExper/sCategory',
            type : 'post',
            data : {'code' : code},
            success : function(result) {
                if(result != null) {
                    result.forEach(function(item) {
                        $('.sCategory').append('<option>' + item + '</option>');
                    })
                    
                }
            }
        })
    }

    $(document).ready(function() {
        let code = $('.mCategory option:selected').data('code');
        if(code == 1) {
            $('.place').css('display', 'none');
        } else {
            $('.place').css('display', 'table');
        }

        <c:if test="${!empty experience}">
            setUpdateData();
        </c:if>

        seoul.forEach(function(item) {
            $('.subArea').append('<option value="' + item + '">'+ item + '</option>');
        });
    });

    function setUpdateData() {
        let mCategory = $('input[name=data_mCategory]').val();
        let sCategory = $('input[name=data_sCategory]').val();
        let title = $('input[name=data_title]').val();
        let subject = $('input[name=data_subject]').val();
        let area = $('input[name=data_area]').val();
        let subArea = $('input[name=data_subArea]').val();
        let kind_n = $('input[name=data_kind_n]').val();
        let kind_i = $('input[name=data_kind_i]').val();
        let kind_h = $('input[name=data_kind_h]').val();
        let kind_s = $('input[name=data_kind_s]').val();
        let kind_r = $('input[name=data_kind_r]').val();
        let headCount = $('input[name=data_headCount]').val();
        let startDate = $('input[name=data_startDate]').val();
        let endDate = $('input[name=data_endDate]').val();
        let desDate = $('input[name=data_desDate]').val();
        let service = $('input[name=data_service]').val();

        console.log('startDate : ' + startDate);


        if(mCategory == '제품') {
            $('.mCategory option:eq(0)').prop('selected', true);
        } else if(mCategory == '방문') {
            $('.mCategory option:eq(1)').prop('selected', true);
        } else if(mCategory == '기자단') {
            $('.mCategory option:eq(2)').prop('selected', true);
        } else if(mCategory == '프리미엄') {
            $('.mCategory option:eq(3)').prop('selected', true);
        }
        
        /* $('.sCategory option').val(sCategory).prop('selected', true); */
        $('input[name=title]').val(title);
        $('input[name=subject]').val(subject);
        $('input[name=area]').val(area);
        $('input[name=kind_n]').prop('checked', setKind(kind_n));
        $('input[name=kind_i]').prop('checked', setKind(kind_i));
        $('input[name=kind_h]').prop('checked', setKind(kind_h));
        $('input[name=kind_s]').prop('checked', setKind(kind_s));
        $('input[name=kind_r]').prop('checked', setKind(kind_r));
        $('input[name=headCount]').val(headCount);
        $('input[name=startDate]').val(startDate);
        $('input[name=endDate]').val(endDate);
        $('input[name=desDate]').val(desDate);
        $('input[name=service]').val(service);


    }

    function setKind(kind) {
        if(kind == 'true') {
            return true;
        } else if (kind == 'false') {
            return false;
        }
    }

    function dateFomat(date) {
        let d = Date.parse(date);

        console.log(d);

        let month = '' + (d.getMonth() + 1);
        let day = '' + d.getDate();
        let year = d.getFullYear();

        if(month.length < 2) month = '0' + month;
        if(day.length < 2) day = '0' + day;

        console.log([year, month, day].join('-'));

        return [year, month, day].join('-');
    }

    $('#submit').click(function() {
        sendSubmit();
    })

    function sendSubmit() {

        
        let mCategory = $('.mCategory option:selected').val();
        let sCategory = $('.sCategory option:selected').val();
        let title = $('input[name=title]').val();
        let subject = $('input[name=subject]').val();
        let area = $('select[name=area]').val();
        let subArea = $('select[name=subArea]').val();
        let kind_n = $('input[name=kind_n]').is(':checked');
        let kind_i = $('input[name=kind_i]').is(':checked');
        let kind_h = $('input[name=kind_h]').is(':checked');
        let kind_s = $('input[name=kind_s]').is(':checked');
        let kind_r = $('input[name=kind_r]').is(':checked');
        let headCount = $('input[name=headCount]').val();
        let startDate = $('input[name=startDate]').val();
        let endDate = $('input[name=endDate]').val();
        let desDate = $('input[name=desDate]').val();
        let closeDate = $('input[name=closeDate]').val();
        let service = $('input[name=service]').val();

        let sendata = {
            <c:if test="${!empty experience}">
            'e_num' : $('input[name=data_e_num]').val(),
            </c:if>
            'mCategory' : mCategory,
            'sCategory' : sCategory,
            'title' : title,
            'subject' : subject,
            'area' : area,
            'subArea' : subArea,
            'kind_n' : kind_n,
            'kind_i' : kind_i,
            'kind_h' : kind_h,
            'kind_s' : kind_s,
            'kind_r' : kind_r,
            'headCount' : headCount,
            'startDate' : startDate,
            'endDate' : endDate,
            'desDate' : desDate,
            'closeDate' : closeDate,
            'service' : service
        }

        let url = '${pageContext.request.contextPath}/mana/insertExperience';
        <c:if test="${!empty experience}">
        url = '${pageContext.request.contextPath}/mana/updateExperience';
        </c:if>

        $.ajax({
            url : url,
            type : 'post',
            data : sendata,
            success : function(result) {
                <c:if test="${!empty experience}">
                if(result.iu) {
                    location.href = '${pageContext.request.contextPath}/mana/experApply?e_num=' + result.e_num;
                }
                </c:if>
                <c:if test="${empty experience}">
                    if(result.iu) {
                        location.href = '${pageContext.request.contextPath}/mana/addCons?e_num=' + result.e_num;
                    }
                </c:if>
                
                else {
                    alert('등록 및 수정 실패');
                }
            }, error : function(e) {
                console.log(e);
                alert('등록 및 수정 실패');
            }
        })
    }

</script>