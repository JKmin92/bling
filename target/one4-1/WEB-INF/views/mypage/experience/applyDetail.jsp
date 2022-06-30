<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>
<div class="detailApply">
	<div class="mytitle">나의 캠페인</div>
    <div class="state">
		<ul class="exper_state">
			<li class="active"><a href="${pageContext.request.contextPath}/user/mypage/applyExperience">신청한 캠페인</a></li>
			<li><a href="${pageContext.request.contextPath}/user/mypage/selectExper">선정된 캠페인</a></li>
			<li><a href="${pageContext.request.contextPath}/user/mypage/insertExper">미등록 캠페인</a></li>
			<li><a href="${pageContext.request.contextPath}/user/mypage/registerReview">등록한 컨텐츠</a></li>
		</ul>
	</div>

    <ul class="experienceInfo">
        <li class="title">
            <div class="t1">체험 이름</div>
            <div class="t2"></div>
        </li>
        <li class="service">
            <div class="t1">제공 내용</div>
            <div class="t2"></div>
        </li>
    </ul>

    <ul class="userInfo">
        <li class="name">
            <div class="t1">이름</div>
            <div class="t2"></div>
        </li>
        <li class="phone">
            <div class="t1">연락처</div>
            <div class="t2"></div>
        </li>
        <li class="address">
            <div class="t1">주소</div>
            <div class="t2"></div>
        </li>
        <li class="channel" style="margin:0;">
            <div class="t1">채널</div>
            <div class="t2"></div>
        </li>
    </ul>

    <ul class="consentList">
        <li>
            <div class="t1">희망컬러</div>
            <div class="t2">23호</div>
        </li>
    </ul>

    <ul class="date">
        <li class="apply">
            <div class="t1">모집기간</div>
            <div class="t2"></div>
        </li>
        <li class="des">
            <div class="t1">발표일</div>
            <div class="t2">
                
            </div>
        </li>
        <li class="create">
            <div class="t1">작성일</div>
            <div class="t2"></div>
        </li>
    </ul>

    <ul class="btn">
        <li class="show_guide">가이드라인 보기</li>
        <li class="cancel">체험취소</li>
    </ul>
</div>
</div>
<script>

    $(document).ready(function() {
        getApply();
    });

    $('.btn .cancel').click(function() {
        cancelApply(getParameterByName('eNum'));
    });

    $('.btn .show_guide').click(function() {
        let e_num = getParameterByName('eNum');
        window.location = '${pageContext.request.contextPath }/experience/detail?eNum=' + e_num;
    });


    function cancelApply(e_num) {
		let cancelReason = confirm('캠페인을 취소 하시겠습니까?');

        if(cancelReason) {
            $.ajax({
                url : '${pageContext.request.contextPath }/experience/cancelApply',
                type : 'post',
                data : {'eNum' : e_num},
                success : function(result) {
                    if(result.user == false) {
                        alert('로그인 후 재시도 부탁드립니다.');
                        window.location = '${pageContext.request.contextPath }/user/login';
                    }
                    if(result.already == false) {
                        alert('이미 취소된 캠페인입니다.');
                        history.back();
                    }
                    if(result.result == true) {
                        alert('캠페인 취소 완료.');
                        window.location.replace('${pageContext.request.contextPath }/user/mypage/applyExperience');
                    } else if(result.result == false) {
                        alert('캠페인 취소 오류, 지속될 경우 관리자에게 말씀 부탁드립니다.');
                    }
                }
            });
        }
	}

    function getApply() {
        let eNum = getParameterByName('eNum');
        $.ajax({
            url : '${pageContext.request.contextPath}/user/experience/getApply',
            type : 'post',
            data : {'eNum' : eNum},
            success : function(map) {
                let experience = map.experience;
                let apply = map.apply;
                let user = map.user;
                let channel = map.channel;
                let address = map.address;
                let desDate = dateFormat(experience.desDate) + '<div class="notice">업체측 사정상 발표가 늦어질 수 있습니다.</div>';
                
                let chID = channel.url;
                if(experience.kind_n == true) {
                    chID = 'http://blog.naver.com/' + chID;
                } else if(experience.kind_i == true) {
                    chID = 'https://www.instagram.com/' + chID;
                }

                $('.experienceInfo .title .t2').append(experience.title);
                $('.experienceInfo .service .t2').append(experience.title);
                $('.userInfo .name .t2').append(user.name);
                $('.userInfo .phone .t2').append(user.phone_number);
                $('.userInfo .address .t2').append(address);
                $('.userInfo .channel .t2').append(chID);
                $('.date .apply .t2').append(dateFormat(experience.startDate) + ' ~ ' + dateFormat(experience.endDate));
                $('.date .des .t2').append(desDate);
                $('.date .create .t2').append(map.guide.closeDate);
            }, error : function(e) {
                console.log(e);
            }
        });
    }

    function dateFormat(date) {
        let dateFom = new Date(date);
		let month = '' + (dateFom.getMonth() + 1);
		let day = '' + dateFom.getDate();

		if(month.length < 2) month = '0' + month;
		if(day.length < 2) day = '0' + day;

		return dateFom = [month, day].join('.');
    }

</script>