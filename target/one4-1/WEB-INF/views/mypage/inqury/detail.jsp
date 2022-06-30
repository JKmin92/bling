<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>


<section class="boardDetail myInquryDetail">

        <div class="title">
            <div class="t02"><span></span></div>
            <div class="t03"><span></span></div>
			<div class="t04"><span></span></div>
        </div>

        <div class="boardContent">
            <div class="content"></div>
            

        </div>
		
		<div class="boardContent">
            <div class="anser"></div>
        </div>

</section>


<script>

    $(document).ready(function() {
        getInquery();
    });

    function getInquery() {
        let in_num = getParameterByName('in_num');
        $.ajax({
            url : '${pageContext.request.contextPath }/board/user/Inquery',
            type : 'post',
            data : {'in_num' : in_num},
            success : function(item) {

                if(item == null) {
                    location.href = '${pageContext.request.contextPath}/';
                }

                let state = '', anser = '최대한 빨리 확인하여 답변 드리겠습니다.';
                
                if(item.state == 0) {
                    state = '확인중'
                } else if(item.state == 1) {
                    state = '답변완료';
                }

                if(item.anser != null && item.anser != '') {
                    anser = item.anser;
                }

                $('.boardDetail .title .t02 span').append(item.title);
                $('.boardDetail .title .t03 span').append(dateFormat(item.registDate));
                $('.boardDetail .title .t04 span').append(state);
                $('.boardDetail .boardContent .content').append(item.content);
                $('.boardDetail .boardContent .anser').append(anser);
            }
        })
    }

    function dateFormat(date) {
        let dateFom = new Date(date);
        let year = '' + dateFom.getFullYear();
		let month = '' + (dateFom.getMonth() + 1);
		let day = '' + dateFom.getDay();

		if(month.length < 2) month = '0' + month;
		if(day.length < 2) day = '0' + day;

		return dateFom = [year, month, day].join('.');
    }

</script>
