<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>

<div class="registerReview">
	<div class="mytitle">나의 캠페인</div>
    <div class="state">
		<ul class="exper_state">
			<li><a href="${pageContext.request.contextPath}/user/mypage/applyExperience">신청한 캠페인</a></li>
			<li><a href="${pageContext.request.contextPath}/user/mypage/selectExper">선정된 캠페인</a></li>
			<li><a href="${pageContext.request.contextPath}/user/mypage/insertExper">미등록 캠페인</a></li>
			<li class="active"><a href="${pageContext.request.contextPath}/user/mypage/registerReview">등록한 컨텐츠</a></li>
		</ul>
	</div>

    <ul class="experList">
        
        
    </ul>
</div>
</div>
<script>

    $(document).ready(function() {
        getExperienceReivewList();
        $('.registerReview ul.experList').append(setExperienceReivew(1, 6, '/resources/upload/experience/6/thumnail.jpg', '서초동헬스장', 1, 'https://blog.naver.com/ameanbiz', '', '', '', ''));
    })


    function getExperienceReivewList() {
        $.ajax({
            url : '${pageContext.request.contextPath}/user/getReivewList',
            type : 'post',
            success : function(result) {
                if(result != null) {
                    (result.reviewList).forEach(function(item, index) {
                        $('.registerReview ul.experList').append(setExperienceReivew(item.r_num, item.e_num, result.experienceList[index].main_img, result.experienceList[index].title, item.state, item.blog, item.instagram, item.homepage, item.store, item.receipt));
                    });

                    if(result.reviewList.length <= 0) {
						$('.registerReview ul.experList').append('<div class="expernone">신청하신 캠페인이 없습니다</div>');
					}
                }
            }, error : function(e) {
                console.log(e);
            }
        });
    }


    function setExperienceReivew(r_num, e_num, main_img, title, state, blog, instagram, homepage, store, receipt) {

        /**
         * state
         * 1 = 작성
         * 2 = 수정
         * 3 = 최종완료
        */

        let stateN = '';
        if(state == 1) stateN = '검토중';
        if(state == 2) stateN = '수정필요';
        if(state == 3) stateN = '완료';

        let review = '<li class="report_review_' + r_num +'">'
            + '<input name="eNum" type="hidden" value="' + e_num + '>'
            + '<div class="thum">'
                + '<img src="' + main_img + '">'
            + '</div>'
            + '<div class="info">'
                + '<div class="title">' + title +'</div>'
                + '<div class="state'
            if(state == 2) {
                review += ' reportModify';
            }  
            
            review += '">상태 : ' + stateN + '</div>';
        

        if(state == 2) {
            review += '<a href="#"><div class="modifyReview info_btn">수정내용</div></a>';
        }
        review += '<a href="${pageContext.request.contextPath }/user/mypage/inqury/list"><div class="inquire info_btn">문의하기</div></a>';
        if(state == 1 || state == 3) {
            if(blog != '' && blog != null) {
                review += '<div class="check info_btn" onclick="checkReiview(\'' + blog + '\');">작성확인</div>'
            }
            if(instagram != '' && instagram != null) {
                review += '<div class="check info_btn" onclick="checkReiview(\'' + instagram + '\');">작성확인</div>'
            }
        } else if(state == 2) {
            review += '<div class="report info_btn" data-code="' + e_num + '">작성보고</div>'
        }
        
        review += '</div><div class="updateReview">';
        
        if(state == 1 || state == 3) {
            if(blog != '' && blog != null) {
            review += '<div class="modify mo_' + e_num + '"><a href="' + blog +'">'
                    + '<div class="suc_url">' + blog + '</div></a>'
                + '</div>';
            }

            if(instagram != '' && instagram != null) {
                review += '<div class="modify mo_' + e_num + '"><a href="' + instagram +'">'
                        + '<div class="suc_url">' + instagram +'</div></a>'
                    + '</div>';
            }

            if(store != null && store != '') {
                + '<div class="modify mo_' + e_num + '">'
                    +    '<input id="store_img_' + r_num + '" data-code="' + r_num + '" type="button" valut="스토어 리뷰">'
                    + '</div>';
            }

            if(homepage != null && homepage != '') {
                + '<div class="modify mo_' + e_num + '">'
                    +    '<input id="homepage_img_' + r_num + '" data-code="' + r_num + '" type="button" valut="홈페이지 리뷰">'
                    + '</div>';
            }

            if(receipt != null && receipt != '') {
                + '<div class="modify mo_' + e_num + '">'
                    +    '<input id="receipt_img_' + r_num + '" data-code="' + r_num + '" type="button" valut="영수증 리뷰">'
                    + '</div>';
            }
        } else if(state == 2) {
            if(blog != '' && blog != null) {
                review += '<div class="modify re_' + e_num + '"><input type="text" name="blog" placeholder="수정 후 블로그 링크 재업로드 부탁합니다." /></div>';
            }

            if(instagram != '' && instagram != null) {
                review += '<div class="modify re_' + e_num + '"><input type="text" name="instaram" placeholder="수정 후 인스타 링크 재업로드 부탁합니다." /></div>';
            }

            if(store != null && store != '') {
                + '<div class="modify re_' + e_num + '">'
                    + '<label class="reivew_label_' + r_num +'" for="review_img_' + r_num +'">스토어 리뷰 재업로드</label><input name="store" id="review_img_' + r_num +'" data-code="' + r_num +'" type="file">'
                + '</div>';
            }

            if(homepage != null && homepage != '') {
                + '<div class="modify re_' + e_num + '">'
                    + '<label class="reivew_label_' + r_num +'" for="review_img_' + r_num +'">홈페이지 리뷰 재업로드</label><input name="homepage" id="review_img_' + r_num +'" data-code="' + r_num +'" type="file">'
                + '</div>';
            }

            if(receipt != null && receipt != '') {
                + '<div class="modify re_' + e_num + '">'
                    + '<label class="reivew_label_' + r_num +'" for="review_img_' + r_num +'">영수증 리뷰 재업로드</label><input name="receipt" id="review_img_' + r_num +'" data-code="' + r_num +'" type="file">'
                + '</div>';
            }

            review += '<button onclick="updateReview(' + r_num +')">등록하기</buuton>';
        }
               
        review += '</div></li>';

        return review;
    }

    function checkReiview(url) {
        window.open(url);
    }

    $('body').on('click', '.report', function() {
        let e_num = $(this).data('code');
        $('.re_' + e_num).css('display','block');
    });

    function updateReview(r_num) {

        if(confirm('링크 및 첨부한 링크에 이상이 없으신가요?') == false) {
            return false;
        }
        
        let eNum = $('.report_review_'+experCode+' input[name=eNum]').val();
        let blog = $('.report_review_'+experCode+' .updateReview .modify input[name=blog]').val();
		let instagram = $('.report_review_'+experCode+' .updateReview .modify input[name=instagram]').val();
        let homepage = $('.report_review_'+experCode+' .updateReview .modify input[name=homepage]')[0].files[0];
		let store = $('.report_review_'+experCode+' .updateReview .modify input[name=store]')[0].files[0];
		let receipt = $('.report_review_'+experCode+' .updateReview .modify input[name=receipt]')[0].files[0];
        
        let dataFormat = new FormData();
        dataFormat.append('eNum', eNum);
		dataFormat.append('rNum' , r_num);
		dataFormat.append('blog', blog);
		dataFormat.append('instagram', instagram);
		dataFormat.append('homepage', homepage);
		dataFormat.append('store', store);
		dataFormat.append('receipt', receipt);

        $.ajax({
           url : '${pageContext.request.contextPath }/experience/updateReview',
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