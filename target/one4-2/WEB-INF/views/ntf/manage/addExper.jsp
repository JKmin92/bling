<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/ntf/manage/gnb.jsp"%>
<style>
   
</style>
<div class="man_container">

    <section class="add_exper">
        <form action="${pageContext.request.contextPath}/mana/insertExperience" method="post" enctype="multipart/form-data">
        <div class="tr">
            <div class="tit">카테고리</div>
            <div class="con">
                <select class="mCategory" name="mCategory">
                    <option data-code="1">방문</option>
                    <option data-code="2">제품</option>
                    <option data-code="3">기자단</option>
                </select>
                <select class="sCategory" name="sCategory">
                    <option>뷰티</option>
                    <option>식품/생활</option>
                    <option>육아</option>
                    <option>차량/캠핑</option>
                    <option>IT/가전제품</option>
                </select>
            </div>
        </div>
        <div class="tr">
            <div class="tit">제목</div>
            <div class="con">
                <div class="in_bor">
                    <input type="text" name="title">
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">부제</div>
            <div class="con">
                <div class="in_bor">
                    <input type="text" name="subject">
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">메인 이미지</div>
            <div class="con">
                <div class="in_bor">
                    <input type="file" name="mainImg">
                </div>
            </div>
        </div>
        <div class="tr place">
            <div class="tit">매장 위치</div>
            <div class="con">
                <div class="in_bor">
                    <input type="text" name="area" placeholder="동, 호수까지만">
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">채널</div>
            <div class="con channel">
                <ul>
                    <li><input type="checkbox" name="kind_n" id="kind_n" ><label for="kind_n">BLOG</label></li>
                    <li><input type="checkbox" name="kind_i" id="kind_i"><label for="kind_i">INSTAGRAM</label></li>
                    <li><input type="checkbox" name="kind_h" id="kind_h"><label for="kind_h">홈페이지 리뷰</label></li>
                    <li><input type="checkbox" name="kind_s" id="kind_s"><label for="kind_s">스토어리뷰</label></li>
                    <li><input type="checkbox" name="kind_r" id="kind_r"><label for="kind_r">영수증리뷰</label></li>
                </ul>
            </div>
        </div>
        <div class="tr">
            <div class="tit">모집기간</div>
            <div class="con">
                <div class="start date">
                    시작기간 <div class="in_bor">
                        <input type="date" name="startDate">
                    </div>
                </div>
                <div class="end date" style="padding-top:40px;">
                    종료기간 <div class="in_bor"><input type="date" name="endData"></div>
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">발표일</div>
            <div class="con date">
                <div class="in_bor" style="margin:0;">
                    <input type="date" name="desDate">
                </div>
            </div>
        </div>
        <div class="tr">
            <div class="tit">체험서비스</div>
            <div class="con">
                <div class="in_bor">
                    <input type="text" name="service">
                </div>
            </div>
        </div>
        
        <div class="tr">
            <div>상세페이지</div>
            <textarea name="content" id="detail" style="height: 50px; max-width: 1080px;"></textarea>
           
        </div>
        

            <div class="btn">
                <div class="cancel">취소</div>
                <button type="submit" id="submit">다음</button>
            </div>
        </form>
    </section>
</div>

<script>

    var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "detail", 
	    sSkinURI: "${pageContext.request.contextPath }/resources/edit/SmartEditor2Skin.html",
	    fCreator: "createSEditor2",
	   
	});

    $('.mCategory').change(function() {
        if($('.mCategory option:selected').data('code') == 1) {
            $('.place').css('display', 'block');
        } else {
            $('.place').css('display', 'none');
        }
    });

    var detailFiles = new Array();
    var fileCount = 0;
    const maxImageCount = 10;
    const fileForm = /(.*?)\.(jpg|jpeg|png|gif)$/;
    const maxFileSize = 5 * 1024 * 1024;
    var fileReader = new FileReader();

    // $('.channel li').click(function () {
    //     let hasActive = $(this).hasClass('active');
    //     if(hasActive) {
    //         $(this).removeClass('active');
    //     } else {
    //         $(this).addClass('active');
    //     }
    // });

    $('input[name=detailFile]').on('change', fileCheck);
    $('input[name=detailFile]').on('change', mainFileCheck);

    function fileCheck(e) {
        let files = e.target.files;
        let fileArr = Array.prototype.slice.call(files);

        if(fileCount + fileArr.length > maxImageCount) {
            alert("파일은 최대 " + maxImageCount + "개까지 업로드 가능합니다.");
            return;
        } else {
            fileCount = fileCount + fileArr.length;
        }

        fileArr.forEach(function(f) {

            // if(!f.type.match(fileForm)) {
            //     alert("jpg, jpeg, png, gif 파일만 업로드 가능");
            //     return;
            // }
            // if(f.size > maxFileSize) {
            //     alert("파일 사이즈는 5MB까지 가능");
            //     return;
            // }
            

            
            fileReader.onload = function(e) {
                detailFiles.push(f);
                fileCount++;
            }
            fileReader.readAsDataURL(f);
        });
    }

    function mainFileCheck(e) {
        let files = e.target.files;
        let fileArr = Array.prototype.slice.call(files);

        fileArr.forEach(function(f) {

            // if(!f.type.match(fileForm)) {
            //     alert("jpg, jpeg, png, gif 파일만 업로드 가능");
            //     return;
            // }
            // if(f.size > maxFileSize) {
            //     alert("파일 사이즈는 5MB까지 가능");
            //     return;
            // }
            

            fileReader.readAsDataURL(f);
        });
        
    }

    // $('#submit').click(function() {
        

    //     let mCategory = $('.mCategory option:selected').text();
    //     let sCategory = $('.sCategory option:selected').text();
    //     let title = $('input[name=title').val();
    //     let subject = $('input[name=subject').val();
    //     let main_img = $('input[name=main_img]')[0].files[0];
    //     let area = $('input[name=area]').val();
    //     let channel1 = 'false';
    //     let channel2 = 'false';
    //     let channel3 = 'false';
    //     let channel4 = 'false';
    //     let channel5 = 'false';
    //     let startDate = $('input[name=startDate').val();
    //     let endDate = $('input[name=endDate').val();
    //     let desDate = $('input[name=desDate').val();
    //     let service = $('input[name=service').val();
    //     let detail = $('textarea[name=detail').val();
        
        

    //     $('.channel ul li.active').each(function() {
    //         if($(this).data('channel') == '1') {
    //             channel1 = 'true';
    //         }
    //         if($(this).data('channel') == '2') {
    //             channel2 = 'true';
    //         }

    //         if($(this).data('channel') == '3') {
    //             channel3 = 'true';
    //         }
    //         if($(this).data('channel') == '4') {
    //             channel4 = 'true';
    //         }
    //         if($(this).data('channel') == '5') {
    //             channel5 = 'true';
    //         }
    //     });

    //     let dataMap = {
    //         'mCategory' : mCategory,
    //         'sCategory' : sCategory,
    //         'title' : title,
    //         'subject' : subject,
    //         'channel1' : channel1,
    //         'channel2' : channel2,
    //         'channel3' : channel3,
    //         'channel4' : channel4,
    //         'channel5' : channel5,
    //         'area' : area,
    //         'startDate' : startDate,
    //         'endDate' : endDate,
    //         'desDate' : desDate,
    //         'service' : service,
    //         'detail' : detail,
    //     };


        
    //     let jsonData = JSON.stringify(dataMap);
    //     let formData = new FormData();
    //     formData.append('json', new Blob([jsonData], {type: "application/json"}));
    //     formData.append('main_img', main_img);
        
    //     for(let i=0; i<fileCount; i++) {
    //         formData.append('detailFiles', detailFiles[i]);
    //     }
        
        

    //     $.ajax({
    //         url : '${pageContext.request.contextPath}/mana/insertExperience',
    //         type : 'POST',
    //         enctype: "multipart/form-data",
    //         data : formData,
    //         processData: false,
   	//         contentType: false,
    //         success : function(data) {
    //             if(data.result) {
    //                 window.location = '${pageContext.request.contextPath }/mana/addExperGuide?eNum=' +data.enum;
    //             }
    //         }, error : function(e) {
    //             console.log("체험 등록 오류");
    //             console.log(e);
    //         }

    //     });
    // });

</script>