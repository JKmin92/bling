<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/ntf/manage/gnb.jsp"%>
<div class="man_container">
    <div class="board_insert">
        <ul>
            <c:if test="${!empty board}">
                <input name="b_num" type="hidden" value="${board.b_num}" />
            </c:if>
            
            <li class="item">
                <select class="boardCode">
                    <option value="1">공지사항</option>
                </select>
            </li>
            <li class="item">
                <label><input type="checkbox" name="notice">공지사항</label>
            </li>
            <li class="item">
                <input type="text" name="title" placeholder="제목" />
            </li>
            <li class="item">
                <textarea name="content" placeholder="내용"></textarea>
            </li>
            <li class="item">
                <button type="submit">등록하기</button>
            </li>
        </ul>
    </div>
</div>

<script>

    $(document).ready(function() {
        
    });

    $('button[type=submit]').click(function() {
        submitBoard();
    });

    function submitBoard() {

        if(confirm('등록 하시겠습니까?') == false) {
            return false;
        }

        let boardDBURL = '${pageContext.request.contextPath }/mana/board/insertBoard';
        <c:if test="${!empty board}">
        let Bnum = $('input[name=b_num]').val();
        boardDBURL = '${pageContext.request.contextPath }/mana/board/updateBoard';
        </c:if>
        let boardCode = $('.boardCode option:selected').val();
        let title = $('input[name=title]').val();
        let notice = $('input[name=notice]').val();
        let content = $('textarea[name=content]').val();

        let sendData = {
            <c:if test="${!empty board}">
            'Bnum' : Bnum,
            </c:if>
            'boardCode' : boardCode,
            'notice' : notice,
            'title' : title,
            'content' : content
        }


        $.ajax({
            url : boardDBURL,
            type : 'post',
            data : sendData,
            success : function(result) {
                if(result) {
                    alert('등록 완료');
                    location.href = '${pageContext.request.contextPath }/mana/board';
                } else {
                    alert('등록 실패');
                }
            }, error : function(e) {
                console.log(e);
                alert('등록 실패');
            }
        });
    }
    
    
</script>