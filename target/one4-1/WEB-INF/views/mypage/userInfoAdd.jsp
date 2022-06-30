<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>

<section class="userInfo">
	<div class="mytitle">내정보</div>
    <ul class="myInfoNav">
        <li><a href="${pageContext.request.contextPath}/user/mypage/userInfo">기본정보</a></li>
        <li class="active"><a href="">추가정보</a></li>
    </ul>
    <table class="userTable userInfoAdd">
        <colgroup>
            <col width="20%">
            <col width="80%">
        </colgroup>
        <tbody>
            <tr class="interest inter_kind">
                <td colspan="2">관심사
					<p>회원님의 관심사를 선택해주세요. (최대3개)</p>
					<p>회원님의 관심사에 맞추어 맞춤 캠페인을 추천해드립니다.</p>
				</td>
			</tr>
			<tr class="interest inter_kind">
                <td colspan="2">
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
                </td>
            </tr>
            <tr>
                <td colspan="2">지역
					<p>회원님이 활동하시는 지역을 추가해주세요. (최대3개)</p>
					<p>회원님의 관심지역에 맞추어 맞춤 캠페인을 추천해드립니다.</p>
				</td>
			</tr>
			<tr class="location">
                <td colspan="2">
                    <div class="locate_area">
                        <div class="select_locate">
                            
                            
                        </div>
                        
                    </div>
                </td>
            </tr>
			<tr>
				<td colspan="2">
					<div class="infoSubmit">
						<button type="submit">기본정보 저장</button>
					</div>
				</td>
			</tr>
        </tbody>
    </table>
</section>
</div>

<script>

    const mLocate = ['서울','경기/인천','대전/충북','대구/경북','부산/경남','광주/전라','기타'];
	const seoul = ['강남/논현', '강동/천호', '강서/목동', '건대/왕십리','관악/신림','교대/사당','노원/강북','명동/이태원', '삼성/선릉', '송파/선릉', '송파/잠실', '수유/잠실', '수유/동대문', '신촌/이대', '압구정/신사', '여의도/영둥포', '종로/대학로', '홍대/마포'];
	const incheon = ['일산/파주', '용인/분당/수원', '인천/부천', '남양주/구리/하남', '안양/안산/광명'];
	const deajeon = ['대전', '충청'];
	const deagoo = ['대구', '경북'];
	const busan = ['부산', '경남'];
	const jeonra = ['광주', '전라'];
	const acc = ['강원', '제주'];
	const interestListCheck = ['맛집/카페', '뷰티샵/미용실', '화장품', '여행/숙박', '생활/리빙', '육아용품', '디지털/IT', '패션', '도서', '식품', '건강/운동', '챠량', '인테리어', '반려동물', '일상/기타'];
	var locationIndex = 2;

    $(document).ready(function() {
		setting();

    });

	function setting() {
		$.ajax({
			url : '${pageContext.request.contextPath }/user/mypage/userInfoAdd/getData',
			type : 'get',
			success : function(items) {
				if(items.user == false) {
					alert('로그인 후 재시도 부탁드립니다.');
					window.location = '${pageContext.request.contextPath }/user/login';
				}

				let interestList = items.interestList;
				let areaList = items.areaList;

				setInterest(interestList);
				setArea(areaList);

			
			}
		});
	}

	function setInterest(interestList) {
		interestList.forEach(function(i) {
			let index = interestListCheck.indexOf(i.item);
			if(index > -1) {
				index += 1;
				$('.interest ul li:nth-child(' + index + ')').addClass('select');
			}
		});
	}

	function setArea(areaList) {
		areaList.forEach(function(ar, index) {
			let area_mLocate = ar.mlocate;
			let area_sLocate = ar.slocate;
			let subValue = '';
			let subOptions = '';
			let i = index + 1;
			let optionSelectPosition = -1;
			locationIndex = i+1;

			let addLocateSelect = getLocateArea(i, '');
			$(".locate_area").append(addLocateSelect);
			

			if(area_mLocate == "서울") {
				subValue = seoul;
			} else if(area_mLocate == "경기/인천") {
				subValue = incheon;
			} else if(area_mLocate == "대전/충북") {
				subValue = deajeon;
			} else if(area_mLocate == "대구/경북") {
				subValue = deagoo;
			} else if(area_mLocate == '부산/경남') {
				subValue = busan;
			} else if(area_mLocate == '광주/전라') {
				subValue = jeonra;
			} else if(area_mLocate == '기타') {
				subValue = acc;
			}

			subValue.forEach(function(e) {
				subOptions += '<option value="' + e +'">' + e + '</option>';
			});

			$('.sub_locate.index_' + i).append(subOptions);
			optionSelectPosition = subValue.indexOf(area_sLocate);
			
			if(optionSelectPosition > -1) {
				$('.sub_locate.index_' + i + ' option:eq(' + optionSelectPosition + ')').prop('selected', true);
			}
		});
	}

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


    $('body').on('click','.locate_add', function(){
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

    $(document).on('change', '.main_locate', function() {
		let subValue;
		let subOptions;
		let dataCode = $(this).data('code');
		let val = $(this).val();

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
			+ '</select>';
		if(index == 1) {
			locateArea += '<button class="locate_add">+</button>';
		}
		locateArea += '</div>';

		return locateArea;
	}

	$('button[type=submit]').click(function() {
		let interestList = [],
		mainLocate = [],
		subLocate = [];

		if($('.userInfo .inter_kind ul li.select').length < 0) {
			alert('관심사 1개 이상 선택해주세요.');
			return false;
		}


		$('.userInfo .inter_kind ul li.select').each(function() {
			interestList.push($(this).text());
		});

		$('select.main_locate option:selected').each(function() {
			mainLocate.push($(this).val());
		});
		$('select.sub_locate option:selected').each(function() {
			subLocate.push($(this).val());
		});

		console.log(interestList);


		let sendData = {
			'interestList' : interestList,
			'mainLocate' : mainLocate,
			'subLocate' : subLocate
		};

		$.ajax({
			url : '${pageContext.request.contextPath }/user/mypage/userInfoAddModify',
			type : 'post',
			data : sendData,
			traditional : true,
			success : function(map) {
				if(map.user == false) {
					alert('로그인 후 재시도 부탁드립니다.');
					window.location = '${pageContext.request.contextPath }/user/login';
				}

				if(map.result == true) {
					alert('변경 완료');
					location.reload();
				} else {
					alert('변경 실패, 재시도 부탁드립니다.');
					location.reload();
				}
			}
		});
	});

</script>