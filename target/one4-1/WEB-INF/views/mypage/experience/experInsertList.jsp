<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>

<div class="experInsertList">
	<div class="mytitle">나의 캠페인</div>
	<div class="state">
		<ul class="exper_state">
			<li><a href="${pageContext.request.contextPath}/user/mypage/applyExperience">신청한 캠페인</a></li>
			<li><a href="${pageContext.request.contextPath}/user/mypage/selectExper">선정된 캠페인</a></li>
			<li class="active"><a href="${pageContext.request.contextPath}/user/mypage/insertExper">미등록 캠페인</a></li>
			<li><a href="${pageContext.request.contextPath}/user/mypage/registerReview">등록한 컨텐츠</a></li>
		</ul>
	</div>
	
    <ul class="selectExper">
       
    </ul>
</div></div>

<script>
    $("input[type='file']").on('change', function() {
        let data_code = $(this).data('code');
        let file_label = $('.reivew_label_'+data_code);
        let file_data = $(this).val();
        let max_size = 1024 * 1024 * 5;

        if(file_data != "") {
            let ext = file_data.split('.').pop().toLowerCase();
            let file_size = $(this)[0].files[0].size;

            if($.inArray(ext, ['jpg','jpeg','gif','png']) == -1) {
                alert('jpg,gif,jpeg,png 파일만 업로드 할수 있습니다.');
                $(this).val('');
                return;
            }
            if(file_size > max_size){
                alert('첨부파일 사이즈는 5MB 이내로 등록 가능합니다.');
                $(this).val('');
                return;
            }

            file_label.text($(this).val());
        } else {
            alert("파일 첨부 애러로 다시 시도해주세요.");
            return;
        }
    });

    $(document).ready(function() {
        getExperience();
		$('.selectExper').append(setExperience(6, 2, '서초동헬스장', '/resources/upload/experience/6/thumnail.jpg', '2022-05-16', true, false, false, false, false));
    })

    function getExperience() {
		$.ajax({
			url : '${pageContext.request.contextPath}/user/deadExperienceList',
			type : 'post',
			success : function(result) {
				if(result!=null) {
					(result.applyList).forEach(function(item, index) {
						$('.selectExper').append(setExperience(item.e_num, item.a_num, result.experienceList[index].title, result.experienceList[index].main_img, item.createDate, result.experienceList[index].kind_n, result.experienceList[index].kind_i, result.experienceList[index].kind_h, result.experienceList[index].kind_s, result.experienceList[index].kind_r));
					});

					if(result.applyList.length <= 0) {
						$('.selectExper').append('<div class="expernone">신청하신 캠페인이 없습니다</div>');
					}
				}
			}, error : function(e) {
				console.log("오류");
			}
		});
	}
    function setExperience(e_num, a_num, title, main_img, desDate, kind_n, kind_i, kind_h, kind_s, kind_r) {

		let date = new Date(desDate);
		let today = new Date();
		let month = '' + (date.getMonth() + 1);
		let day = '' + date.getDate();
		let year = date.getFullYear();
		let today_month = today.getMonth()+1;
		let today_day = today.getDate();
		let today_year = today.getFullYear();
		let now = new Date(today_year, today_month, today_day);
		let dateBetween = (date.getTime() - today.getTime()) / (1000*60*60*24);
		dateBetween = Math.abs(Math.ceil(dateBetween));

		if(month.length < 2) month = '0' + month;
		if(day.length < 2) day = '0' + day;

		desDate = year + '.' + month + '.' + day;

		let channel;
		let naver, instagram, homepage, store, receipt;
		if(kind_n) naver = '<span style="color:#03c75a;">BLOG</span>';
		if(kind_i) instagram = '<span class="instagram" style="color:#e94969;">INSTAGRAM</span>';
		if(kind_h) homepage = '홈페이지 리뷰 작성';
		if(kind_s) store = '스토어 리뷰 작성';
		if(kind_r) receipt = '영수증 리뷰 작성';

		channel = [naver, instagram, homepage, store, receipt].join(' ');

		let experience = '<li class="exper_insert_' + e_num +'">'
            + '<input name="aNum" value="' + a_num + '" class="dataCode" />'
			+ '<input name="eNum" value="' + e_num + '" class="dataCode" />'
            + '<div class="thum">'
                + '<img src="' + main_img +'" width="100%">'
            + '</div>'
            + '<div class="info">'
                + '<div class="title">' + title +'</div>'
                + '<div class="mission">' + channel +'</div>'
                + '<a href="#"><div class="guide info_btn">가이드라인</div></a>'
                + '<a href="#"><div class="inquire info_btn">문의하기</div></a>'
				+ '<a href="#"><div class="report info_btn" data-code="' + e_num + '">작성보고</div></a>'
            + '</div>'
			+ '<div class="insertExper">'
				+ '<div class="date">'
					+ '작성 완료일 : <span>' + desDate + ' <strong>' + dateBetween + '';
				if(dateBetween <= -1) {
					experience += '일 지났습니다.</strong></span>';
				} else {
					experience += '일 남았습니다.</strong></span>';
				}

			experience += '</div>'
            
			if(kind_n) {
				experience += '<div class="insert int_' + e_num +'"><input type="text" name="blog" placeholder="작성된 블로그 포스팅 링크를 정확히 입력해주세요" class="dataCode">'
				+ '<button onclick="sendReview(' + e_num +')">제출하기</button></div>';
			}
			
			if(kind_i) {
				experience += '<div class="insert int_' + e_num +'"><input type="text" name="instagram" placeholder="작성된 인스타 피드 링크를 정확히 입력해주세요">'
				+ '<button onclick="sendReview(' + e_num +')">제출하기</button></div>';
			}

			if(kind_h) {
				experience += '<div class="insert int_' + e_num +'">'
				+ '<label for="home_' + e_num + '" class="home_' + e_num + '">작성된 홈페이지 리뷰 캡처본을 업로드해주세요.</label>'
				+ '<input type="text" id="home_' + e_num + '" data-code="' + e_num + '" data-name="home" name="homepage" placeholder="">'
				+ '<button onclick="sendReview(' + e_num +')">제출하기</button></div>';
			}

			if(kind_s) {
				experience += '<div class="insert int_' + e_num +'">'
				+ '<label for="sto_' + e_num + '" class="sto_' + e_num + '">작성된 스토어 리뷰 캡처본을 업로드해주세요</label>'
				+ '<input id="sto_' + e_num + '" data-code="' + e_num + '" data-name="sto" type="file" name="store" placeholder="">'
				+ '<button onclick="sendReview(' + e_num +')">제출하기</button></div>';
			}

			if(kind_r) {
				experience += '<div class="insert int_' + e_num +'">'
				+ '<label for="rec_' + e_num + '" class="rec_' + e_num + '">작성된 영수증 리뷰 캡처본을 업로드해주세요.</label>'
				+ '<input id="rec_' + e_num + '" data-code="' + e_num + '" data-name="rec" type="file" name="receipt" placeholder="">'
				+ '<button onclick="sendReview(' + e_num +')">제출하기</button></div>';
			}

            + '</div>'
        + '</li>';

		return experience;

	}

	$('body').on('click', '.report', function() {
		let e_num = $(this).data('code');

		$('.int_' + e_num).css('display','block');
	});

	$('body').on('change', 'input[type=file]', function() {
		let e_num = $(this).data('code');
		let name = $(this).data('name');
		let fileName = $(this).val();

		$('label.' + name + '_' + e_num).text(fileName);
	});

    function sendReview(experCode) {

		if(confirm('링크 및 첨부한 링크에 이상이 없으신가요?') == false) {
            return false;
        }

        let blog = $('.exper_insert_'+experCode+' .insertExper input[name=blog]').val();
		let instagram = $('.exper_insert_'+experCode+' .insertExper input[name=instagram]').val();
        let homepage = $('.exper_insert_'+experCode+' .insertExper input[name=homepage]')[0].files[0];
		let store = $('.exper_insert_'+experCode+' .insertExper input[name=store]')[0].files[0];
		let receipt = $('.exper_insert_'+experCode+' .insertExper input[name=receipt]')[0].files[0];
        let aNum = $('.exper_insert_'+experCode+' input[name=aNum]').val();
		let eNum = $('.exper_insert_'+experCode+' input[name=eNum]').val();


		let dataFormat = new FormData();
		dataFormat.append('eNum' , eNum);
		dataFormat.append('aNum', aNum);
		dataFormat.append('blog', blog);
		dataFormat.append('instagram', instagram);
		dataFormat.append('homepage', homepage);
		dataFormat.append('store', store);
		dataFormat.append('receipt', receipt);

        let dataForm = {
			'eNum' : eNum,
			'aNum' : aNum,
			'blog' : blog,
			'instagram' : instagram,
			'homepage' : homepage,
			'store' : store,
			'receipt' : receipt 
		}


        $.ajax({
           url : '${pageContext.request.contextPath }/experience/insertReview',
		   processData : false,
		   contentType : false,
		   enctype : 'multipart/form-data',
           type : 'POST',
           data : dataFormat,
           success : function(result) {
               if(result != null) {
				   
				   if(result.result) {
					   alert('정성스러운 리뷰를 작성해주셔서 감사합니다. 작성된 리뷰에 이상이 있다면 수정 요청이 있을 수 있습니다.');
				   } else {
					   alert('등록 실패, 지속될 경우 원포에 따로 말씀 부탁드립니다.');
				   }
			   }
           }, error : function(e) {
			   console.log(e);
			   alert('등록 실패, 지속될 경우 원포에 따로 말씀 부탁드립니다.');
		   }
        });
    }

</script>