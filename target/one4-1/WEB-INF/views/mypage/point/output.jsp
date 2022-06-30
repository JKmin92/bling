<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/WEB-INF/views/mypage/point/pointCommon.jsp"%>

    

    <div class="pointList">
        <ul>
            <li class="category out">
                <div class="date">
                    <span>출금일</span>
                </div>
                <div class="content">
                    <span>출금내역</span>
                </div>
                <div class="point">
                    <span>포인트</span>
                </div>
                <div class="state">
                    <span>상태</span>
                </div>
            </li>
            
        </ul>
    </div>

</section>
</div>
<script>
    $(document).ready(function() {
        $('.pointRemote li:nth-child(2)').addClass('active');
        setBankCumalative();
    });

    function setBankCumalative() {
        $.ajax({
            url : '${pageContext.request.contextPath}/user/mypage/point/bankTake',
            type : 'get',
            success : function(item) {
                if(item.user == false) {
                    alert('로그인 해주세요.');
                    location.href = '${pageContext.request.contextPath}/';
                } else {
                    (item.bankTakeList).forEach(function(bankTake) {
                        $('.pointList ul').append(setBankTake(bankTake));
                    });

                    if((item.bankTakeList).length <= 0) {
                        $('.pointList ul').append('<li class="miss">내역 없음</li>');
                    }
                }
            }
        });
    }

    function setBankTake(bankTake) {

        let date = new Date(bankTake.takeDate);
        let point = parseInt(bankTake.takePoint);
        let state = parseInt(bankTake.state);
        let day = '' + date.getDate();
        let month = '' + (date.getMonth() + 1);
        let year = date.getFullYear();

        if(day.length < 2) day = '0' + day;
        if(month.length < 2) month = '0' + month;

        date = year + '.' + month + '.' + day;
        point = point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

        if(state == 1) {
            state = '출금완료';
        } else if(state == 2) {
            state = '출금지연';
        } else {
            state = '출금신청'
        }

        console.log(state);

        let list = '<li class="out">'
            + '<div class="bo_li_day">'
                + '<span>' + date + '</span>'
            + '</div>'
            + '<div class="bo_li_content">'
                + '<span>' + bankTake.takeContent + '</span>'
            + '</div>'
            + '<div class="bo_li_point">'
                + '<span>' + point + 'P</span>'
            + '</div>'
            + '<div class="bo_li_state">'
                + '<span>' + state + '</span>'
            + '</div>'
        + '</li>'

        return list;
    }
</script>