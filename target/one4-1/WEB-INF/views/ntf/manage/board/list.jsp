<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/ntf/manage/gnb.jsp"%>

<div class="man_container">

    <section class="boardList exper_list">
        <div class="btn">
            <a href="${pageContext.request.contextPath }/mana/board/insert"><div class="add">등록</div></a>
        </div>
        <ul class="board_list">
            <li class="board_cate">
                <div class="modify"><span>수정</span></div>
                <div class="cate01"><span>분류</span></div>
                <div class="cate02"><span>제목</span></div>
                <div class="cate03"><span>작성일</span></div>
            </li>
            
        </ul>
    </section>

</div>

<script>

    $(document).ready(function() {
        getBoardList();
    });


    $('.delete').click(function() {
        let dataCode = $(this).data('code');

        $.ajax({
            url : '${pageContext.request.contextPath }/board/delete',
            data : {'b_num' : dataCode},
            type : 'post',
            success : function(result) {
                if(result) {
                    alert('삭제되었습니다.');
                    getBoardList();
                }
            }
        });
    });

    function getBoardList() {
        $.ajax({
            url : '${pageContext.request.contextPath }/mana/board/list',
            type : 'post',
            success : function(result) {
                if(result != null) {
                    result.forEach(function(item) {
                        $('.board_list').append(getBoard(item));
                    })
                    
                }
            }, error: function(e) {
                console.log(e);
            }
        })
    }

    function getBoard(board) {
        let dateFormat = new Date(board.registDate);
        let day = '' + dateFormat.getDate();
        if(day.length < 2) day = '0' + day;
        let month = ''+(dateFormat.getMonth() + 1);
        if(month.length < 2) month = '0' + month;
        let year = ''+dateFormat.getFullYear();
        let registDate = year + '.' + month + '.' + day;

        
        let boardItem = '<li>'
                    + '<div class="modify_btn">'
                        + '<span class="update" data-code="' + board.b_num + '">U</span>'
                        + '<span class="delete" data-code="' + board.b_num + '">D</span>'
                    + '</div>'
                    + '<div class="bo_li_ca"><span>';
        
        if(board.notice) {
            boardItem += '[공지]';
        } else {
            boardItem += ' ';
        }
                        
        boardItem += '</span></div>'
                    + '<div class="bo_li_ti"><span>' + board.title + '</span></div>'
                    + '<div class="bo_li_day"><span>' + registDate + '</span></div>'
                + '</li>'

        return boardItem;
    }
</script>