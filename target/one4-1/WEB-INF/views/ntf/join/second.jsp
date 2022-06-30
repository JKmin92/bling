<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
    .joinCon {margin:70px auto 0 auto !important; min-width:auto; width:400px; min-width: auto;}
    @media (max-width : 787px) {
        .joinCon {width:100%;}
    }
</style>
<div class="container joinCon">
	<section class="join_2">
		<div class="logo">
			<img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="100%" />
		</div>
		
		<h3>추가 정보를 입력해주세요.</h3>
		<p>회원님의 관심분야에 맞는 캡페인을 추천해드립니다</p>
		
		<div class="inter_kind">
			<p>관심 카테고리를 선택해주세요(최대 3)</p>
			<ul>
				<li name="res"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/restaurant.svg')"></i>맛집/카페</li>
				<li name="sal"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/beautyShop.svg')"></i>뷰티샵/미용실</li>
				<li name="beu"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/beauty.svg')"></i>화장품</li>
				<li name="vec"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/vacation.svg')"></i>여행/숙박</li>
				<li name="liv"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/living.svg')"></i>생활/리빙</li>
				<li name="bab"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/baby.svg')"></i>육아용품</li>
				<li name="deg"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/digital.svg')"></i>디지털/IT</li>
				<li name="fas"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/fashion.svg')"></i>패션</li>
				<li name="boo"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/book.svg')"></i>도서</li>
				<li name="foo"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/food.svg')"></i>식품</li>
				<li name="hel"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/weight.svg')"></i>건강/운동</li>
				<li name="car"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/car.svg')"></i>차량</li>
				<li name="int"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/interior.svg')"></i>인테리어</li>
				<li name="anm"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/pet.svg')"></i>반려동물</li>
				<li name="acc"><i style="background-image: url('${pageContext.request.contextPath }/resources/img/icon/join/acc.svg')"></i>일상/기타</li>
			</ul>
		</div>
		<div class="location">
			<p>체험 가능 지역을 선택해주세요.</p>
			<div class="locate_area">
				<div class="select_locate">
					<select class="main_locate index_1" data-code="1">
						<option value="서울">서울</option>
						<option value="경기/인천">경기/인천</option>
						<option value="대전/충북">대전/충북</option>
						<option value="대구/경북">대구/경북</option>
						<option value="부산/경남">부산/경남</option>
						<option value="광주/전라">광주/전라</option>
						<option value="기타">기타</option>
					</select>
					
					<select class="sub_locate index_1" data-code="1">
						
					</select>
					
					<button class="locate_add">+</button>
				</div>
				
			</div>
		</div>
		
		<div class="summit"><button>다음</button></div>
	</section>
	
	<script>

		const mLocate = ['서울','경기/인천','대전/충북','대구/경북','부산/경남','광주/전라','기타'];
		const seoul = ['강남/논현', '강동/천호', '강서/목동', '건대/왕십리','관악/신림','교대/사당','노원/강북','명동/이태원', '삼성/선릉', '송파/선릉', '송파/잠실', '수유/잠실', '수유/동대문', '신촌/이대', '압구정/신사', '여의도/영둥포', '종로/대학로', '홍대/마포'];
		const incheon = ['일산/파주', '용인/분당/수원', '인천/부천', '남양주/구리/하남', '안양/안산/광명'];
		const deajeon = ['대전', '충청'];
		const deagoo = ['대구', '경북'];
		const busan = ['부산', '경남'];
		const jeonra = ['광주', '전라'];
		const acc = ['강원', '제주'];
		var locationIndex = 2;

		$(document).ready(function() {

			let sLocation = '';

			seoul.forEach(function(item) {
				sLocation += '<option value="' + item + '">' + item + '</option>';
			});

			$('.sub_locate').append(sLocation)
			
		});

		$('.inter_kind ul li').click(function() {
			if($(this).hasClass('select')) {
				$(this).removeClass('select');
			} else {
				let interestCount = $('.inter_kind ul li.select').length;
				if(interestCount <= 2) {
					$(this).addClass('select');
				} else {
					alert('최대 3개까지 추가하실 수 있습니다.');
				}
			}
		});

		$(document).on('change', '.main_locate', function() {
			let subValue;
			let subOptions;
			let dataCode = $(this).data('code');
			let val = $(this).val();

			console.log(val);
			console.log(dataCode);

			$("select[name='sub_locate'] option").remove();
		
			if(val == "서울") {
				subValue = seoul;
			} else if(val == "경기/인천") {
				subValue = incheon;
			} else if(val == "대전/충북") {
				subValue = deajeon;
			} else if(val == "대구/경북") {
				subValue = deagoo;
			} else if(val == '부산/경남') {
				subValue = busan;
			} else if(val == '광주/전라') {
				subValue = jeonra;
			} else if(val == '기타') {
				subValue = acc;
			}

			subValue.forEach(function(e) {
				subOptions += '<option class="sub_locate index_' + dataCode +'" value="' + e +'">' + e + '</option>';
			});
			
			$('.sub_locate.index_' + dataCode + ' option').remove();
			$('.sub_locate.index_' + dataCode).append(subOptions);
		});
		
		$(".locate_add").on("click", function(){
			let option = '';
			if(locationIndex > 3) {
				alert('최대 3개까지 추가 가능합니다');
				return false;
			}
			seoul.forEach(function(item) {
				option += '<option value="' + item + '">' + item + '</option>';
			});
			
			let addLocateSelect = getLocateArea(locationIndex, option);
			$(".locate_area").append(addLocateSelect);
			locationIndex++;
		});

		function getLocateArea(index, option) {
			let locateArea = '<div class="select_locate">'
				+ '<select class="main_locate index_' + index + '" data-code="' + index + '">'
					+ '<option value="서울">서울</option>'
					+ '<option value="경기/인천">경기/인천</option>'
					+ '<option value="대전/충북">대전/충북</option>'
					+ '<option value="대구/경북">대구/경북</option>'
					+ '<option value="부산/경남">부산/경남</option>'
					+ '<option value="광주/전라">광주/전라</option>'
					+ '<option value="기타">기타</option>'
				+ '</select>'
				+ '<select class="sub_locate index_' + index + '" data-code="' + index + '">'
				+ option
				+ '</select>'
				+ '</div>';

			return locateArea;
		}

		$('.summit button').click(function() {
			let interestList = [];
			let mainLocate = [];
			let subLocate = [];

			$('.inter_kind ul li.select').each(function() {
				interestList.push($(this).text());
			});

			if($('.main_locate option:selected').length != 0) {
				$('.main_locate option:selected').each(function () {
					mainLocate.push($(this).text());
				});
			}

			if($('.sub_locate option:selected').length != 0) {
				$('.sub_locate option:selected').each(function () {
					subLocate.push($(this).text());
				});
			}

			
			

			$.ajax({
				url : '${pageContext.request.contextPath }/user/joinSecond',
				type : 'POST',
				data : {'interestList' : interestList,
			'mainLocate': mainLocate,
			'subLocate': subLocate},
			traditional : true,
				success : function(e) {
					if(e.result != false) {
						window.location = '${pageContext.request.contextPath }' + e.locate;
					}
				},
				error : function (e) {
					console.log('ajax error');
					console.log(e);
				}
			});
		});
		

	</script>
</div>