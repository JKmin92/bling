<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/ntf/manage/gnb.jsp"%>

<div class="man_container">
    <section class="exper_list">

		<div class="btn">
			<a href="${pageContext.request.contextPath }/mana/addExper"><div class="add">캠페인 추가</div></a>
		</div>

		<div class="exper_filter">
			<div class="category">
				<ul class="product_kind">
					<li class="select">ALL</li>
					<li>뷰티</li>
					<li>식품/생활</li>
					<li>육아</li>
					<li>차량/캠핑</li>
					<li>IT/가전제품</li>
				</ul>
			</div>

			<div class="channel_sort">
				<ul>
					<li class="select">블로그</li>
					<li>인스타</li>
					<li>리뷰</li>
					<li>유튜브</li>
					<li class="sort">
						<select>
							<option>최신순</option>
							<option>인기순</option>
							<option>마감임박순</option>
						</select>
					</li>
				</ul>
			</div>
		</div>

		<div class="experience_table">
		
				<c:forEach items="${experienceList}" var="experience">

						<div class="item">
							<a href="${pageContext.request.contextPath }/mana/experApply?e_num=${experience.e_num}">
							<div class="thumb">
								<img src="${pageContext.request.contextPath }/${experience.main_img}" width="100%" />
							</div>
							<input type="hidden" value="${experience.kind_n}"/>
							<div class="info">
								<ul class="kind">
									<c:if test="${experience.kind_n == true}">
										<li class="nav">BLOG</li>
									</c:if>
									<c:if test="${experience.kind_i == true}">
										<li class="insta">INSTAGRAM</li>
									</c:if>
									<c:if test="${experience.kind_s == true}">
										<li class="store">스토어리뷰</li>
									</c:if>
									<c:if test="${experience.kind_h == true}">
										<li class="home">공식몰리뷰</li>
									</c:if>
									<c:if test="${experience.kind_r == true}">
										<li class="receipt">영수증</li>
									</c:if>
								</ul>
								<p class="ex_title">${experience.title}</p>
								<p class="ex_service">${experience.service}</p>
								<div class="ex_preg">
									<div class="ex_preg_rhap" style="width:50%"></div>
								</div>
								<p class="ex_pe">${experience.headCount}</p>
							</div></a>
						</div>

					
			</c:forEach>
		</div>
	</section>
</div>