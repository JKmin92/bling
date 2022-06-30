<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">

    <section class="boardList">

        <div class="boardTit">
            <div class="t01"></div>
            <div class="t02"></div>
        </div>

        <ul class="board_list">
            <li class="board_cate">
                <div class="cate01"><span>분류</span></div>
                <div class="cate02"><span>제목</span></div>
                <div class="cate03"><span>작성일</span></div>
            </li>
            

        </ul>

        <!-- <div class="board_paging">
            <ul>
                <a href="#"><li>&#60;</li></a>
                <a href="#"><li class="active">1</li></a>
                <a href="#"><li>2</li></a>
                <a href="#"><li>&#62;</li></a>
            </ul>
        </div> -->

        <div class="info_btn">
            <div class="half"><a href="${pageContext.request.contextPath }/board/penalty">
                <div class="btn">리뷰 미작성 시 <br class="m_s"/>패널티 안내</div>
            </a></div>
           <div class="half"> <a href="${pageContext.request.contextPath }/board/useContents">
                <div class="btn">리뷰 2차 활용 <br class="m_s"/>동의 안내</div>
            </a></div>
        </div>

    </section>

</div>

<script>

    $(document).ready(function() {
        titleSet();
        boardList();
    });

    function titleSet() {
        let boardCode = getParameterByName('bc');

        if(boardCode == 1) {
            $('.boardList .boardTit .t01').append('공지사항');
            $('.boardList .boardTit .t02').append('원포의 소식을 전해드립니다.');
        } else if(boardCode == 2) {
            $('.boardList .boardTit .t01').append('이벤트');
            $('.boardList .boardTit .t02').append('원포에서 이벤트 진행중');
            $('.boardList .info_btn').css('display','none');
        }
    }

    function boardList() {

        let boardCode = getParameterByName('bc');
        $.ajax({
            url : '${pageContext.request.contextPath}/board/getList',
            type : 'get',
            data : {'boardCode' : boardCode},
            success : function(item) {
                item.forEach(function(board) {
                    $('.board_list').append(getBoard(board));
                });
            }, error : function(e) {
                console.log(e);
            }
        });
    }

    function getBoard(board) {
        let category = board.category;
        let registDate = new Date(board.registDate);

        if(category == 0) {
            category = '';
        } else if(category == 1) {
            category = '[공지]';
        } else if(category == 2) {
            category = '[이벤트]';
        }

        let day = '' + registDate.getDate();
        let month = '' + (registDate.getMonth() + 1);
        let year = registDate.getFullYear();

        if(month.length < 2) {
            month = '0' + month;
        }

        if(day.length < 2) {
            day = '0' + day;
        }

        registDate = year + '.' + month + '.' +day;

        let boardView = '<a href="${pageContext.request.contextPath }/board/detail?b_num=' + board.b_num + '">'
                    + '<li>'
                        + '<div class="bo_li_ca"><span>'+ category + '</span></div>'
                        + '<div class="bo_li_ti"><span>' + board.title + '</span></div>'
                        + '<div class="bo_li_day"><span>' + registDate +'</span></div>'
                    + '</li>'
                + '</a>'
        return boardView;
    }
</script>