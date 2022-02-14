<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	
	<div class="container">

		<section class="exper_title">
			<div class="title">
				<p class="t1">제품 캠페인</p>
			</div>
		</section>
		

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
		
		<section class="experience">
			
			<table class="experience_table">
				<colgroup>
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
				</colgroup>
				<tbody>
					<tr>
						<td>
							<a href="${pageContext.request.contextPath }/experience/detail"><div class="thubm">
								<img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%" />
							</div>
							<div class="info">
								<div class="kind">BLOG</div>
								<p class="ex_title">하니네 당근</p>
								<p class="ex_service">당근 100개</p>
								<div class="ex_preg">
									<div class="ex_preg_rhap" style="width:50%"></div>
								</div>
								<p class="ex_pe">5/10명</p>
							</div></a>
						</td>
						<td>
							<div class="thubm">
								<img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%" />
							</div>
							<div class="info">
								<div class="kind">BLOG</div>
								<p class="ex_title">하니네 당근</p>
								<p class="ex_service">당근 100개</p>
								<div class="ex_preg">
									<div class="ex_preg_rhap" style="width:50%"></div>
								</div>
								<p class="ex_pe">5/10명</p>
							</div>
						</td>
						<td>
							<div class="thubm">
								<img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%" />
							</div>
							<div class="info">
								<div class="kind">BLOG</div>
								<p class="ex_title">하니네 당근</p>
								<p class="ex_service">당근 100개</p>
								<div class="ex_preg">
									<div class="ex_preg_rhap" style="width:50%"></div>
								</div>
								<p class="ex_pe">5/10명</p>
							</div>
						</td>
						<td>
							<div class="thubm">
								<img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%" />
							</div>
							<div class="info">
								<div class="kind">BLOG</div>
								<p class="ex_title">하니네 당근</p>
								<p class="ex_service">당근 100개</p>
								<div class="ex_preg">
									<div class="ex_preg_rhap" style="width:50%"></div>
								</div>
								<p class="ex_pe">5/10명</p>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="5"><div class="banner" style="height:150px; width:100%; margin:100px 0;"></div></td>
					</tr>
					
					<tr>
						<td>
							<div class="thubm">
								<img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%" />
							</div>
							<div class="info">
								<div class="kind">BLOG</div>
								<p class="ex_title">하니네 당근</p>
								<p class="ex_service">당근 100개</p>
								<div class="ex_preg">
									<div class="ex_preg_rhap" style="width:50%"></div>
								</div>
								<p class="ex_pe">5/10명</p>
							</div>
						</td>
						<td>
							<div class="thubm">
								<img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%" />
							</div>
							<div class="info">
								<div class="kind">BLOG</div>
								<p class="ex_title">하니네 당근</p>
								<p class="ex_service">당근 100개</p>
								<div class="ex_preg">
									<div class="ex_preg_rhap" style="width:50%"></div>
								</div>
								<p class="ex_pe">5/10명</p>
							</div>
						</td>
						<td>
							<div class="thubm">
								<img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%" />
							</div>
							<div class="info">
								<div class="kind">BLOG</div>
								<p class="ex_title">하니네 당근</p>
								<p class="ex_service">당근 100개</p>
								<div class="ex_preg">
									<div class="ex_preg_rhap" style="width:50%"></div>
								</div>
								<p class="ex_pe">5/10명</p>
							</div>
						</td>
						<td>
							<div class="thubm">
								<img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%" />
							</div>
							<div class="info">
								<div class="kind">BLOG</div>
								<p class="ex_title">하니네 당근</p>
								<p class="ex_service">당근 100개</p>
								<div class="ex_preg">
									<div class="ex_preg_rhap" style="width:50%"></div>
								</div>
								<p class="ex_pe">5/10명</p>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			
		</section>
		
		
		
	</div>
	
