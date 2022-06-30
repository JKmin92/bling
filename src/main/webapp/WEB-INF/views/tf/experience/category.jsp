<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <section class="experCategory">
        <ul class="category">
			<li class="gnb_li"><span class="cate">제품</span>
                <ul class="snb">
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=뷰티">뷰티</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=식품%2F생활">식품/생활</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=육아">육아</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=차량%2F캠핑">차량/캠핑</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=반려동물">반려동물</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=IT%2F가전제품">IT/가전제품</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=기타">기타</a></li>
                </ul>
            </li>
			<li class="gnb_li"><span class="cate">방문</span>
                <ul class="snb">
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=맛집">맛집</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=미용샵">미용샵</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=체험">체험</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=기타">기타</a></li>
                </ul>
            </li>
			<li class="gnb_li"><a href="${pageContext.request.contextPath }/experience?mCategory=3"><span>기자단</span></a></li>
			<li class="gnb_li"><a href="${pageContext.request.contextPath }/experience?mCategory=4"><span>서비스</span></a></li>
			<li class="gnb_li"><a href="${pageContext.request.contextPath }/experience?mCategory=5"><span>얼리버드</span></a></li>
			<li class="gnb_li"><a href="${pageContext.request.contextPath }/experience?mCategory=6"><span>프리미엄</span></a></li>
		</ul>
    </section>
</div>