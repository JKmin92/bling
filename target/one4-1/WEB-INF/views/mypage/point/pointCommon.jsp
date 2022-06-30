<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>

<section class="myPoint">
    <div class="mytitle">나의 포인트</div>

    <div class="pointState">
        <div class="present">
            <p class="title">현재 포인트</p>
            <p class="point"></p>
        </div>
        <div class="accrue">
            <p class="title">누적 포인트</p>
            <p class="point"></p>
        </div>
    </div>
    
    <div class="pointRemote">
        <ul>
            <li><a href="${pageContext.request.contextPath}/user/mypage/point/list">적립내역</a></li>
            <li><a href="${pageContext.request.contextPath}/user/mypage/point/output">출금내역</a></li>
            <li><a href="${pageContext.request.contextPath}/user/mypage/point/pointApply">출금신청</a></li>
        </ul>
    </div>

    <script>


        $(document).ready(function() {
            getPoint();
        });


        function getPoint() {
            $.ajax({
                url : '${pageContext.request.contextPath}/user/mypage/getPoint',
                type : 'get',
                success : function(item) {
                    if(item.user == 0) {
                        alert('로그인 해주세요.');
                        location.href = '${pageContext.request.contextPath}/';
                    } else {
                        let present = item.presentPoint;
                        let camalative = item.cumalatePoint;

                        if(parent == '' || parent == null) {
                            present = 0
                        }

                        if(camalative == '' || camalative == null) {
                            camalative = 0
                        }

                        present = present.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                        camalative = camalative.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

                        $('.present .point').append(present+'P');
                        $('.accrue .point').append(camalative+'P');
                    }
                }, error : function(e) {
                    console.log(e);
                }
            });
        }

    </script>