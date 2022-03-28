<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<section class="join_2">
		<div class="logo">
			<img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="30%" />
		</div>
		
		<h3>추가 정보를 입력해주세요.</h3>
		<p>회원님의 관심분야에 맞는 캡페인을 추천해드립니다</p>
		
		<div class="inter_kind">
			<p>관심 카테고리를 선택해주세요(최대 3)</p>
			<ul>
				<li name="res">맛집/카페</li>
				<li name="sal">뷰티샵/미용실</li>
				<li name="beu">화장품</li>
				<li name="vec">여행/숙박</li>
				<li name="liv">생활/리빙</li>
				<li name="bab">육아용품</li>
				<li name="deg">디지털/IT</li>
				<li name="fas">패션</li>
				<li name="boo">도서</li>
				<li name="foo">식품</li>
				<li name="hel">건강/운동</li>
				<li name="car">차량</li>
				<li name="int">인테리어</li>
				<li name="anm">반려동물</li>
				<li name="acc">일상/기타</li>
			</ul>
		</div>
		<div class="location">
			<p>체험 가능 지역을 선택해주세요.</p>
			<div class="locate_area">
				<div class="select_locate">
					<select class="main_locate" onchange="changeMainLocate(this)">
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="경기">경기</option>
						<option value="부산">경기도</option>
					</select>
					
					<select class="sub_locate">
						<option>강남구</option>
						<option>서대문구</option>
						<option>종로구</option>
						<option>강서구</option>
					</select>
					
					<button class="locate_add">+</button>
				</div>
			</div>
		</div>
		
		<div class="summit"><button>다음</button></div>
	</section>
	
	<script>

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

		function changeMainLocate(val) {
			let seoul = ["강남구", "서대문구", "종로구","강서구"];
			let incheon = ["부평구","계양구","연수구"];
			let subValue;
			let subOptions
			
			$("select[name='sub_locate'] option").remove();
		
			if(val.value == "서울") {
				subValue = seoul
			} else if(val.value == "인천") {
				subValue = incheon
			}
			
			subValue.forEach(function(e, i) {
				subOptions += "<option>" + e + "</option>";
				
			});
			
			$("select[name='sub_locate']").append(subOptions);
		};
		
		$(".locate_add").on("click", function(){
			
			let addLocateSelect = $(".locate_area").html();
			
			$(".location").append(addLocateSelect);
		});

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
				data : {'interestList':JSON.stringify(interestList),
			'mainLocate':JSON.stringify(mainLocate),
			'subLocate':JSON.stringify(subLocate)},
				dataType : "json",
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