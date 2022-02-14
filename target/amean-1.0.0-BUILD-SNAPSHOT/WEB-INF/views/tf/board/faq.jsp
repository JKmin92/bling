<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="container">

    <section class="faq">
        <div class="boardTit">
            <div class="t01">FAQ</div>
            <div class="t02">블링리뷰의 소식을 전해드립니다.</div>
        </div>

        <div class="list">
            <ul>
                <h4 class="tit">캠페인 신청</h4>
                <li>
                    <div class="quest">
                        <span>Q.</span> 유명한 인플루언서 / 셀럽만 신청이 가능한가요?
                    </div>
                    <div class="anser">
                        <span>A.</span> 어쩌구 저쩌구
                    </div>
                </li>
            </ul>
        </div>
    </section>

</div>


<script>
    $('.faq .list ul li').click(function(){
        if($(this).find('.quest').hasClass('active') == false) {
            $(this).find('.quest').addClass('active');
            $(this).find('.anser').slideDown(400);
        } else if($(this).find('.quest').hasClass('active') == true) {
            console.log("A");
            $(this).find('.quest').removeClass('active');
            $(this).find('.anser').slideUp(400);
        }
        
    });
</script>