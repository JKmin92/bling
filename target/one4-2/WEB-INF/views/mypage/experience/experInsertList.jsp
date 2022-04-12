<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>

<div class="experInsertList">
    <ul>
        <li class="exper_insert_1">
            <input name="aNum" value="1" class="dataCode" />
            <div class="thum">
                <img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%">
            </div>
            <div class="info">
                <div class="title">체험 제목</div>
                <div class="date">작성 완료일 : <span>3월 10일까지 <strong>1일 남았습니다.</strong></span></div>
                <div class="mission">블로그 포스팅 1건 작성</div>
                <a href="#"><div class="guide info_btn">가이드라인 확인</div></a>
                <a href="#"><div class="inquire info_btn">문의하기</div></a>
            </div>
            <div class="insertExper">
                <div class="insert"><input type="text" placeholder="작성된 블로그 포스팅 링크를 입력해주세요"></div>
                <button onclick="sendReview(1)">제출하기</button>
            </div>
        </li>
        <li class="exper_insert_2">
            <input name="aNum" value="2" class="dataCode" />
            <div class="thum">
                <img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%">
            </div>
            <div class="info">
                <div class="title">체험 제목</div>
                <div class="date">작성 완료일 : <span>3월 10일까지 <strong>오늘은 작성일 입니다.</strong></span></div>
                <div class="mission">블로그 포스팅 1건 + 영수증 리뷰 1건 작성</div>
                <a href="#"><div class="guide info_btn">가이드라인 확인</div></a>
                <a href="#"><div class="inquire info_btn">문의하기</div></a>
            </div>
            <div class="insertExper">
                <div class="insert"><input type="text" placeholder="작성된 블로그 포스팅 링크를 입력해주세요"></div>
                <div class="insert">
                    <label class="reivew_label_2" for="review_img_2">스토어리뷰 업로드</label><input id="review_img_2" data-code="2" type="file">
                </div>
                <button onclick="sendReview(2)">제출하기</button>
            </div>
        </li>
        <li class="exper_insert_3">
            <input name="aNum" value="3" class="dataCode" />
            <div class="thum">
                <img src="${pageContext.request.contextPath }/resources/img/ex/main_ex_100x100_2.jpg" width="100%">
            </div>
            <div class="info">
                <div class="title">체험 제목</div>
                <div class="date">작성 완료일 : <span>3월 10일까지 <strong>1일 지났습니다.</strong></span></div>
                <div class="mission">블로그 포스팅 4건 작성</div>
                <a href="#"><div class="guide info_btn">가이드라인 확인</div></a>
                <a href="#"><div class="inquire info_btn">문의하기</div></a>
            </div>
            <div class="insertExper">
                <div class="insert"><input type="text" placeholder="작성된 블로그 포스팅 링크를 입력해주세요"></div>
                <button>제출하기</button>
            </div>
        </li>
    </ul>
</div>

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

    function sendReview(experCode) {
        let url = $("exper_insert_"+experCode+" .insertExper input[type='text']").val();
        let img = $("exper_insert_"+experCode+" .insertExper input[type='file']").val();
        let aNum = $("exper_insert_"+experCode+" input[name='aNum']").val();
        let dataForm = new FormData();
        dataForm.append('eNum',experCode);
        dataForm.append('aNum',aNum);
        dataForm.append('url',url);
        dataForm.append('img',img);
        

        $.ajax({
           url : '${pageContext.request.contextPath }/experience/insertApply',
           type : 'POST',
           data : dataForm,
           dataType : 'json',
           success : function(e) {
               alert(e);
           }
        });
    }
</script>