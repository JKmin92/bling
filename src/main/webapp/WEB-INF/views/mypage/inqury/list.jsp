<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>

<section class="boardList myInqury">

        <div class="boardTit">
            <div class="t01">1:1문의하기</div>
            <div class="t02">문의를 남겨주시면 최대한 빠른 시일에 답변 드리겠습니다.</div>
			
        </div>

        <ul class="board_list">
            <li class="board_cate">
                <div class="cate01"><span>No</span></div>
                <div class="cate02"><span>제목</span></div>
                <div class="cate03"><span>작성일</span></div>
				<div class="cate04"><span>상태</span></div>
            </li>
            

        </ul>

        <a href="${pageContext.request.contextPath }/user/mypage/inqury/regist"><div id="regist">문의하기</div></a>

    </section>

<script>

    $(document).ready(function() {
        getInqueryList();
    });

    function getInqueryList() {
        $.ajax({
            url : '${pageContext.request.contextPath }/board/user/inpuqeryList',
            type : 'get',
            success : function (items) {

                if(items != null) {
                    items.forEach(function(i, index) {
                        $('.myInqury .board_list').append(setInquery(i, index+1));
                    })
                } else {
                    $('.myInqury .board_list').append('<li>문의 내역이 없습니다</li>');
                }
                
            }
        })
    }

    function setInquery(inquery, index) {

        let state = '';
                
        if(inquery.state == 0) {
            state = '확인중'
        } else if(inquery.state == 1) {
            state = '답변완료';
        }

        let item = '<a href="${pageContext.request.contextPath }/user/mypage/inqury/detail?in_num=' + inquery.in_num + '">'
            + '<li>'
                + '<div class="bo_li_no"><span>' + index + '</span></div>'
                + '<div class="bo_li_ti"><span>'+ inquery.title + '</span></div>'
                + '<div class="bo_li_day"><span>' + dateFormat(inquery.registDate) + '</span></div>'
                + '<div class="bo_li_state"><span>' + state + '</span></div>'
            + '</li>'
        + '</a>'

        return item;
    }

    function dateFormat(date) {
        let dateFom = new Date(date);
        let year = '' + dateFom.getFullYear();
		let month = '' + (dateFom.getMonth() + 1);
		let day = '' + dateFom.getDate();

		if(month.length < 2) month = '0' + month;
		if(day.length < 2) day = '0' + day;

		return dateFom = [year, month, day].join('.');
    }
</script>