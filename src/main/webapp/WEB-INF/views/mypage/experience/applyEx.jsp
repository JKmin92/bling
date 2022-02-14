<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>


<section class="apply_list">
	<div class="state">
		<ul>
			<li class="active"><a>신청한 캠페인</a></li>
			<li><a>선정된 캠페인</a></li>
			<li><a>미등록 캠페인</a></li>
			<li><a>등록한 컨텐츠</a></li>
		</ul>

		<p>신청중(18)</p>

		<table>
			<colgroup>
				<col width="10%"/>
				<col width="20%"/>
				<col width="40%"/>
				<col width="10%"/>
				<col width="20%"/>
			</colgroup>

			<thead>
				<td>No</td>
				<td>캠페인 이미지</td>
				<td>캠페인 정보</td>
				<td>상태</td>
				<td>발표일</td>
			</thead>

			<tbody>
				<tr>
					<td>2</td>
					<td><img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%"></td>
					<td>
						<p>하니네 당근</p>
						<div>신청인원 : 10명 신청 / 10명 모집</div>
						<div>상세보기</div>
					</td>
					<td>신청중</td>
					<td>2022/01/03</td>
				</tr>

				<tr>
					<td>2</td>
					<td><img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%"></td>
					<td>
						<p>하니네 당근</p>
						<div>신청인원 : 10명 신청 / 10명 모집</div>
						<div>상세보기</div>
					</td>
					<td>신청중</td>
					<td>2022/01/03</td>
				</tr>
			</tbody>

		</table>
	</div>
</section>