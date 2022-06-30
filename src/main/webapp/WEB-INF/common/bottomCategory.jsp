<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <section class="experCategory">
        <div class="experCategoryClose"><img src="${pageContext.request.contextPath }/resources/img/icon/close.png" width="100%"></div>
        <ul class="category">
			<li class="gnb_li"><span class="cate">제품</span>
                <ul class="snb">
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=뷰티">뷰티</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=식품">식품</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=생활용품">생활용품</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=육아">육아</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=차량·캠핑">차량·캠핑</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=반려동물">반려동물</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=IT·가전제품">IT·가전제품</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=기타">기타</a></li>
                </ul>
            </li>
			<li class="gnb_li"><span class="cate">방문</span>
                <ul class="snb">
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=맛집·카페">맛집·카페</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=뷰티·미용">뷰티·미용</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=여행·숙박·레저">여행·숙박·레저</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=문화">문화</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=기타">기타</a></li>
                </ul>
            </li>
			<li class="gnb_li"><a href="${pageContext.request.contextPath }/experience?mCategory=3"><span class="cate">기자단</span></a></li>
			<li class="gnb_li"><span class="cate">서비스</span>
                <ul class="snb">
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=교육·강의">교육·강의</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=APP">APP</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=기타">기타</a></li>
                </ul>
            </li>
			<li class="gnb_li"><a href="${pageContext.request.contextPath }/experience?mCategory=5"><span class="cate">얼리버드</span></a></li>
			<li class="gnb_li"><a href="${pageContext.request.contextPath }/experience?mCategory=6"><span class="cate">프리미엄</span></a></li>
		</ul>
    </section>

<script>
    $('.experCategory .experCategoryClose').click(function() {
        if($('body').hasClass('bottom_category')) {
            $('body').removeClass('bottom_category');
        }
    });
</script>