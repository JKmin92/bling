<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/WEB-INF/views/mypage/point/pointCommon.jsp"%>



    <div class="pointList">
        <ul>
            <li class="category">
                <div class="date">
                    <span>적립일</span>
                </div>
                <div class="content">
                    <span>적립내역</span>
                </div>
                <div class="point">
                    <span>포인트</span>
                </div>
            </li>
            
        </ul>
    </div>

</section>
</div>
<script>
    $(document).ready(function() {
        $('.pointRemote li:nth-child(1)').addClass('active');
        setBankCumalative();
    });

    function setBankCumalative() {
        $.ajax({
            url : '${pageContext.request.contextPath}/user/mypage/point/cumalative',
            type : 'get',
            success : function(item) {
                if(item.user == false) {
                    alert('로그인 해주세요.');
                    location.href = '${pageContext.request.contextPath}/';
                } else {
                    (item.cumalativeList).forEach(function(cumalative) {
                        $('.pointList ul').append(setCumalative(cumalative));
                    });

                    if((item.cumalativeList).length <= 0) {
                        $('.pointList ul').append('<li class="miss">내역 없음</li>');
                    }
                }
            }
        });
    }

    function setCumalative(cumalative) {

        let date = new Date(cumalative.saveDate);
        let point = parseInt(cumalative.savePoint);
        let day = '' + date.getDate();
        let month = '' + (date.getMonth() + 1);
        let year = date.getFullYear();

        if(day.length < 2) day = '0' + day;
        if(month.length < 2) month = '0' + month;

        date = year + '.' + month + '.' + day;
        point = point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

        let list = '<li>'
            + '<div class="bo_li_day">'
                + '<span>' + date + '</span>'
            + '</div>'
            + '<div class="bo_li_content">'
                + '<span>' + cumalative.saveContent + '</span>'
            + '</div>'
            + '<div class="bo_li_point">'
                + '<span>' + point + 'P</span>'
            + '</div>'
        + '</li>'

        return list;
    }
</script>