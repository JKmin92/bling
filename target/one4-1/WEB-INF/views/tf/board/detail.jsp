<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">

    <section class="boardDetail">

        <div class="title">
            <div class="t01"><span></span></div>
            <div class="t02"><span></span></div>
            <div class="t03"><span></span></div>
        </div>

        <div class="boardContent">

        </div>

    </section>
</div>

<script>

    $(document).ready(function() {
        getBoard();
    });

    function getBoard() {

        let b_num = getParameterByName('b_num');
        
        $.ajax({
            url : '${pageContext.request.contextPath}/board/getDetail',
            type : 'post',
            data : {'b_num' : b_num},
            success : function(board) {

                let category = board.category;
                let title = board.title;
                let registDate = new Date(board.registDate);
                let content = board.content;

                if(category == 1) {
                    category = '[공지]';
                } else if(category == 2) {
                    category = '[이벤트]';
                } else {
                    category = '';
                }

                let year = registDate.getFullYear();
                let month = '' + registDate.getMonth()+1;
                let day = '' + registDate.getDate();

                if(month.length < 2) {
                    month = '0' + month;
                }

                if(day.length < 2) {
                    day = '0' + day;
                }

                registDate = year + '.' + month + '.' + day;

                $('.boardDetail .t01 span').append(category);
                $('.boardDetail .t02 span').append(title);
                $('.boardDetail .t03 span').append(registDate);
                $('.boardContent').append(content);
            }

        });
    }
</script>