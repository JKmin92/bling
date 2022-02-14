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
				<li>맛집/카페</li>
				<li>뷰티샵/미용실</li>
				<li>화장품</li>
				<li>여행/숙박</li>
				<li>생활/리빙</li>
				<li>육아용품</li>
				<li>디지털/IT</li>
				<li>패션</li>
				<li>도서</li>
				<li>식품</li>
				<li>건강/운동</li>
				<li>차량</li>
				<li>인테리어</li>
				<li>반려동물</li>
				<li>일상/기타</li>
			</ul>
		</div>
		<div class="location">
			<p>체험 가능 지역을 선택해주세요.</p>
			<div class="locate_area">
				<div class="select_locate" >
					<select name="main_locate" onchange="changeMainLocate(this)">
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="경기">경기</option>
						<option value="부산">경기도</option>
					</select>
					
					<select name="sub_locate">
						<option>강남구</option>
						<option>서대문구</option>
						<option>종로구</option>
						<option>강서구</option>
					</select>
					
					<button class="locate_add">+</button>
				</div>
			</div>
		</div>
		
		<div class="summit"><a href="${pageContext.request.contextPath }/user/joinView3"><button>다음</button></a></div>
	</section>
	
	<script>
		function changeMainLocate(val) {
			var seoul = ["강남구", "서대문구", "종로구","강서구"];
			var incheon = ["부평구","계양구","연수구"];
			var subValue;
			var subOptions
			
			console.log("aa");
			
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
			
			var addLocateSelect = $(".locate_area").html();
			
			$(".location").append(addLocateSelect);
		});
	</script>
</div>