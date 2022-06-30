<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	
	<div class="container">

		<section class="exper_title">
			<div class="title">
				<p class="t1">${categoryName} 캠페인 <c:if test="${categoryName eq '방문'}">
					<span class="locate">지역전체<img src="${pageContext.request.contextPath }/resources/img/icon/down_arrow.png" width="13px" /></span>
					<div class="location_select">
						<dl>
							<dt style="width: 100%;">지역전체</dt>
							<dt class="seoul">서울</dt>
							<dd>강남/논현</dd>
							<dd>강동/천호</dd>
							<dd>강서/목동</dd>
							<dd>건대/왕십리</dd>
							<dd>관악/신림</dd>
							<dd>교대/사당</dd>
							<dd>노원/강북</dd>
							<dd>명동/이태원</dd>
							<dd>삼성/선릉</dd>
							<dd>송파/잠실</dd>
							<dd>수유/동대문</dd>
							<dd>신촌/이대</dd>
							<dd>압구정/신사</dd>
							<dd>여의도/영동포</dd>
							<dd>종로/대학로</dd>
							<dd>홍대/마포</dd>
						</dl>
						<dl>
							<dt class="incheon">경기/인천</dt>
							<dd>일산/파주</dd>
							<dd>용인/분당/수원</dd>
							<dd>인천/부천</dd>
							<dd>남양주/구리/하남</dd>
							<dd>안양/안산/광명</dd>
						</dl>
						<dl>
							<dt>대전/충북</dt>
							<dd>대전</dd>
							<dd>충청</dd>
						</dl>
						<dl>
							<dt>대구/경북</dt>
							<dd>대구</dd>
							<dd>경북</dd>
						</dl>
						<dl>
							<dt>부산/경남</dt>
							<dd>부산</dd>
							<dd>경남</dd>
						</dl>
						<dl>
							<dt>광주/전라</dt>
							<dd>광주</dd>
							<dd>전라</dd>
						</dl>
						<dl>
							<dt>다른지역</dt>
							<dd>강원</dd>
							<dd>제주</dd>
						</dl>
					</div>
				</c:if></p>
				<p class="t2"></p>
			</div>
		</section>
		

		<div class="exper_filter">
			
			<div class="category">
				
				<ul class="product_kind">
					<c:choose>
						<c:when test="${!empty filterList}">
							<li onclick="sCategoryGo('all');">ALL</li>
							<c:forEach items="${filterList}" var="filter">
							<li onclick="sCategoryGo('${filter}');" data-filter="${filter}">${filter}</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li style="border-bottom:1px solid transparent">&nbsp;</li>
						</c:otherwise>
					</c:choose>
				</ul>
				
			</div>
			

			<div class="channel_sort">
				<ul>
					<li data-code="kind_n" class="blog">블로그</li>
					<li data-code="kind_i" class="instagram">인스타</li>
					<li data-code="kind_sorkind_horkind_r" class="review">쇼핑리뷰</li>
					<li data-code="kind_y" class="youtube">유튜브</li>
					<li class="m_channel">
						<select>
							<option data-code="all">전체</option>
							<option data-code="kind_n" class="blo">블로그</option>
							<option data-code="kind_i" class="ins">인스타그램</option>
							<option data-code="kind_sorkind_horkind_r" class="rev">쇼핑리뷰</option>
							<option data-code="kind_y" class="you">유튜브</option>
						</select>
					</li>
					<li class="sort">
						<select>
							<option value="0">최신순</option>
							<option value="1">인기순</option>
							<option value="2">마감임박순</option>
						</select>
					</li>
				</ul>
			</div>
		</div>
		
		<section class="main_ex">
			
			<ul class="experience_table ex">
				
			
			</ul>
		</section>
		
		
		
	</div>
	
<script>

	const seoul = ['서울', '강남/논현', '강동/천호', '강서/목동', '건대/왕십리', '관악/신림', '교대/사당', '노원/강북', '명동/이태원', '삼성/선릉', '송파/잠실', '수유/동대문', '신촌/이대', '압구정/신사', '여의도/영동포', '종로/대학로', '홍대/마포'];
	const incheon = ['경기/인천', '일산/파주', '용인/분당/수원', '인천/부천', '남양주/구리/하남', '안양/안산/광명'];
	const deajeon = ['대전/충북', '대전', '충청'];
	const deagoo = ['대구/경북', '대구', '경북'];
	const busan = ['부산/경남', '부산', '경남'];
	const gwangju = ['광주/전라', '광주', '전라'];
	const other = ['다른지역', '강원', '제주'];

	$(document).ready(function() {
		let mCategory = getParameterByName('mCategory');
		let sCategory = getParameterByName('sCategory');
		let area = getParameterByName('area');
		let subArea = getParameterByName('subArea');
		let locateIcon = '<img src="${pageContext.request.contextPath }/resources/img/icon/down_arrow.png" width="13px" />';
		let kind = getParameterByName('kind');
		let sort = 0;

		

		if(mCategory==1) {
			$('.exper_title .title .t2').append('궁금했던 제품을 체험으로 만나볼 기회! 원포 제품 캠페인');
		} else if(mCategory == 2) {
			$('.exper_title .title .t2').append('좋은 서비스 체험으로 추억을 쌓는 기회! 원포 방문 캠페인');
		} else if(mCategory == 3) {
			$('.exper_title .title .t2').append('브랜드의 마케터로 활동하는 부수익의 기회! 원포 기자단 캠페인');
		} else if(mCategory == 4) {
			$('.exper_title .title .t2').append('좋은 서비스 체험으로 스킬/역량 UP! 원포 서비스 캠페인');
		} else if(mCategory == 5) {
			$('.exper_title .title .t2').append('신규 제품 / 서비스를 가장 먼저 만나보는 기회! 원포 얼리버드 캠페인');
		} else if(mCategory == 6) {
			let premiumImg = '<a href="${pageContext.request.contextPath }/experience/premium/applyView"><img src="${pageContext.request.contextPath }/resources/img/banner/premium_p.png" class="w_s" width="100%"/>'
			+ '<img src="${pageContext.request.contextPath }/resources/img/banner/premium_m.png" class="m_s" width="100%"/></a>';

			$('.exper_title .title').append(premiumImg);
		}

		if(getParameterByName('sCategory')) {
			$('.exper_filter .category .product_kind li').each(function(index, element) {
				if($(this).data('filter') == getParameterByName('sCategory')) {
					$(this).addClass('select');
				}
			});
			
		}else {
			$('.exper_filter .category .product_kind li:first-child').addClass('select');
		}

		if(area != null && area != '') {
			$('.locate').html(area + locateIcon);
		}

		if(subArea != null && subArea != '') {
			$('.locate').html(subArea + locateIcon);
		}

		if(kind == 'kind_n') {
			$('.blog').addClass('active');
			$('.m_channel .blo').prop('selected',true);
		}

		if(kind == 'kind_i') {
			$('.instagram').addClass('active');
			$('.m_channel .ins').prop('selected',true);
		}

		if(kind == 'kind_s&kind_h&kind_r') {
			$('.review').addClass('active');
			$('.m_channel .rev').prop('selected',true);
		}

		if(kind == 'kind_y') {
			$('.youtube').addClass('active');
			$('.m_channel .you').prop('selected',true);
		}

		if(getParameterByName('sort') != null && getParameterByName('sort')) {
			sort = getParameterByName('sort');
		}

		getExperienceList(mCategory, sCategory, area, subArea, kind, sort);
	})

	function sCategoryGo(sCategory) {

		if(sCategory == 'all') {
			let mCategory = getParameterByName('mCategory');
			location.href = window.location.origin + window.location.pathname + '?mCategory=' + mCategory;
			return false;
		}
		let href = window.location.origin + window.location.pathname;
		let params = new URLSearchParams(window.location.search);
		let parameter;
		if(getParameterByName('sCategory') != null && getParameterByName('sCategory')) {
			params.set('sCategory', sCategory);
			parameter = '?' + params.toString();
		} else {
			parameter = window.location.search + '&sCategory=' + sCategory;
		}
		location.href = href + parameter;
	}

	function areaGo(area) {
		let href = window.location.origin + window.location.pathname;
		let params = new URLSearchParams(window.location.search);
		let sCategory = '';
		let parameter = window.location.search;

		if(getParameterByName('subArea') != null && getParameterByName('subArea')) {
			let filter = (window.location.search).substring(0, (window.location.search).indexOf('subArea', 0));
			params = new URLSearchParams(filter);
		}

		if(getParameterByName('area') != null && getParameterByName('area')) {
			if(area != '지역전체') {
				params.set('area', area);
				parameter = '?' + params.toString();
			}
		} else {
			if(area != '지역전체') {
				parameter = window.location.search + '&area=' + area;
			}
		}

		if(getParameterByName('area') != null && getParameterByName('area')) {
			if(area == '지역전체') {
				parameter = parameter.substring(0, parameter.indexOf('&area', 0));
			}
		}

		if(getParameterByName('sCategory') != null && getParameterByName('sCategory')) {
			sCategory = getParameterByName('sCategory');
			if(parameter.indexOf('sCategory') < -1) {
				parameter += '&sCategory=' + sCategory;
			}
		}
		
		location.href = href + parameter;
	}

	function subAreaGo(subArea) {
		let href = window.location.origin + window.location.pathname;
		let params = new URLSearchParams(window.location.search);
		let area = '';
		let parameter;

		seoul.forEach(function(item) {
			if(item == subArea) {
				area = '서울';
			}
		});

		incheon.forEach(function(item) {
			if(item == subArea) {
				area = '경기/인천';
			}
		});

		deajeon.forEach(function(item) {
			if(item == subArea) {
				area = '대전/충북';
			}
		});

		deagoo.forEach(function(item) {
			if(item == subArea) {
				area = '대구/경북';
			}
		});

		busan.forEach(function(item) {
			if(item == subArea) {
				area = '부산/경남';
			}
		});

		gwangju.forEach(function(item) {
			if(item == subArea) {
				area = '광주/전라';
			}
		});

		other.forEach(function(item) {
			if(item == subArea) {
				area = '다른지역';
			}
		});

		if(getParameterByName('subArea') != null && getParameterByName('subArea')) {
			params.set('area',area);
			params.set('subArea', subArea);
			parameter = '?' + params.toString();
		} else {
			parameter = window.location.search;

			if(getParameterByName('area') != null && getParameterByName('area') != '') {
				parameter = parameter.substring(0, parameter.indexOf('&area', 0));
			}
			parameter = parameter + '&area=' + area + '&subArea=' + subArea;
			
		}
		location.href = href + parameter;
	}

	function channel(kind) {
		let href = window.location.origin + window.location.pathname;
		let params = new URLSearchParams(window.location.search);
		let parameter;
		if(getParameterByName('kind') != null && getParameterByName('kind') != '') {
			params.set('kind', kind);
			parameter = '?' + params.toString();
		} else {
			parameter = window.location.search + '&kind=' + kind;
		}
		location.href = href + parameter;
	}

	function sort(value) {
		let href = window.location.origin + window.location.pathname;
		let params = new URLSearchParams(window.location.search);
		let parameter;
		if(getParameterByName('sort') != null && getParameterByName('sort') != '') {
			params.set('sort', value);
			parameter = '?' + params.toString();
		} else {
			parameter = window.location.search + '&sort=' + value;
		}
		location.href = href + parameter;
	}

	$(document).click(function(e) {

		if($(e.target).hasClass('sort')) {
			return false;
		}

		if(!$(e.target).hasClass('locate')){
			if(!$(e.target).hasClass('location_select')) {
				if($('.location_select').hasClass('active')) {
					$('.location_select').removeClass('active');
				}
			}
		}


		if(e.target.nodeName == 'DT') {
			areaGo($(e.target).html());
		}

		if(e.target.nodeName == 'DD') {
			subAreaGo($(e.target).html());
		}
	});
	
	$('.channel_sort ul li').click(function() {
		if($(this).hasClass('blog') || $(this).hasClass('instagram') || $(this).hasClass('review') || $(this).hasClass('youtube')) {
			let code = $(this).data('code');
			channel(code);
		}
	});

	$('.channel_sort ul li.m_channel select').change(function() {
		let code = $('li.m_channel select option:selected').data('code');
		channel(code);
	});

	$('.channel_sort ul li.sort select').change(function() {
		let value = $('.channel_sort ul li.sort select option:selected').val();
		sort(value);
	});


	function getExperienceList(mCategory, sCategory, area, subArea, kind, sort) {
		let sendData = {
			'mCategory' : mCategory,
			'sCategory' : sCategory,
			'area' : area,
			'subArea' : subArea,
			'kind' : kind,
			'sort' : sort
		};

		$.ajax({
			url : '${pageContext.request.contextPath}/experience/getExper',
			type : 'post',
			data : sendData,
			success : function(result) {
				if(result != null) {
					(result.experienceList).forEach(function(item) {
						
						let applyPeople = 0;
						if(result.applyList != null) {
							(result.applyList).forEach(function(apply) {
								if(apply.e_num == item.e_num) {
									applyPeople++;
								}
							});
						}
						$('.experience_table').append(getExperience(item.e_num, item.main_img, item.kind_n, item.kind_i, item.title, item.service, applyPeople, item.headCount, item.endDate, '50%'));	
					
					});

					if((result.experienceList).length <= 0) {
						$('.experience_table').append('<div class="experNone">준비된 캠페인이 없습니다.</div>');
					}
				}
			}, error : function(e) {
				console.log(e);
			}
		});
	}


	function getExperience(e_num, img, naver, instagram, title, service, applyPeople, headCount, endDateOri, persentProg) {
		
		let endDate = new Date(endDateOri);
		let month = '' + (endDate.getMonth() + 1);
		let day = '' + endDate.getDate();

		if(month.length < 2) month = '0' + month;
		if(day.length < 2) day = '0' + day;

		endDate = [month, day].join('.');
		
		let experienceView = '<li>'
				+ '<div class="experInfo">'
					+ '<a href="${pageContext.request.contextPath }/experience/detail?eNum=' + e_num + '">'
						+ '<div class="ex_thubmnail">'
							+ '<img src="${pageContext.request.contextPath}'+ img + '" width="100%" />'
						+ '</div>'
					+ '</a>'
					+ '<div class="content">'
						+ '<div class="kind">';
		if(naver) {
			experienceView += '<span class="naver" style="color:#03c75a;">BLOG</span>';
		}

		if(instagram){
			experienceView += '<span class="instagram" style="color:#e94969;">INSTAGRAM</span>';
		}
							
		experienceView = experienceView + '</div>'
						+ '<p class="ex_title">' + title + '</p>'
						+ '<p class="ex_service">' + service +'</p>'
						+ '<div class="ex_pe_prog">'
							+ '<div class="ex_prog_ing" style="width: 0;"></div>'
						+ '</div>'
						+ '<div class="ex_apply_info">'
								+ '<span class="ex_pe">' + applyPeople + '/' + headCount + '명</span>'
								+ '<span class="date">' + endDate + '까지</span>'
							+ '</div>'
					+ '</div>'
				+ '</div>'
			+ '</li>';

		return experienceView;
	}

</script>