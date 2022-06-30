<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/ntf/manage/gnb.jsp"%>

<div class="man_container">

    <section class="addConsent">

        <form id="saveConsent" action="<c:choose>
            <c:when test="${null ne experience}">${pageContext.request.contextPath}/mana/updateConsent</c:when>
            <c:otherwise>${pageContext.request.contextPath}/mana/insertConsent</c:otherwise>
        </c:choose>" method="post" enctype="multipart/form-data">
        <input type="hidden" value="${experience.e_num}" name="e_num" />
        <input type="hidden" value="${experience.MCategory}" name="mCate" />
        <input type="hidden" value="" name="loadContent" />
        <input type="hidden" value="${experience.main_img}" name="loadMainImg" />

        <div class="tr">
            <div class="tit">메인 이미지</div>
            <div class="con">
                <div class="in_bor mainImage">
                    <input type="file" name="mainImg">
                    
                </div>
            </div>
        </div>

        <div class="tr">
            <div>상세페이지</div>
            <textarea name="content" id="detail" style="height: 50px; max-width: 1080px; width:100%;"></textarea>
           
        </div>

        <div class="tr">
            <ul class="consent_add">
                <li class="item" id="consent_text">TEXT</li>
                <li class="item" id="consent_select">SELECT</li>
            </ul>
        </div>

        <div class="tr">
            <ul class="consent_list">
                
            </ul>
        </div>

        <div class="btn">
            <div class="cancel">취소</div>
            <button type="submit" id="submit">다음</button>
        </div>
        </form>
    </section>

</div>

<script>
    
    var index = 0;
    var anserIndex = 0;
    var oEditors = [];

    $('#submit').click(function(){
        oEditors.getById["detail"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#saveConsent").submit();
    });

    $(document).ready(function() {
        
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "detail", 
            sSkinURI: "${pageContext.request.contextPath }/resources/edit/SmartEditor2Skin.html",
            fCreator: "createSEditor2",
            <c:if test="${null ne experience}">

            fOnAppLoad : function() {
                
                oEditors.getById["detail"].exec("PASTE_HTML", [ '${experience.content}' ]);
            }
            </c:if>
            
        
        });

        if($('input[name=loadMainImg]').val() != null && $('input[name=loadMainImg]').val() != '') {
            $('.mainImage').append('<img src="${pageContext.request.contextPath}/' + $('input[name=loadMainImg]').val() + '" width="150px" class="loadMainImgage" />');
        }

        <c:if test="${null ne consentList}">
        getConsentList();
        </c:if>

    });

    $('.consent_add .item').click(function() {
        let id = $(this).attr('id');
        let consentList = $('.consent_list');
        if(id == 'consent_text') {
            consentList.append(getConsentText('', '', '', 0));
        } else if(id == 'consent_select') {
            consentList.append(getConsentSelect('', '', '', 0));
        }
    })

    $('body').on('click', '.consent_list .consent .remove', function() {
        let searchIndex = $(this).prev().val();
        $('.con_' + searchIndex).remove();
    });

    $('body').on('click', '.consent_list .consent .select .removeOption', function() {
        let searchAnserIndex = $(this).prev().val();
        $('.sel_' + searchAnserIndex).remove();
    });

    $('body').on('click', '.consent_list .consent .addAnser', function() {
        let searchAnserIndex = $(this).prev('.anser').children('.select:last-child').children('input[name=anserIndex]').val();
        searchAnserIndex += 1;
        let searchIndex = $(this).prevAll('input[name=index]').val();
        console.log($(this).prevAll('input[name=index]'));
        let sel = '<div class="select sel_' + searchAnserIndex + '">'
                        + '<input type="radio"/><input type="text" name="consentList[' + searchIndex +'].anser" />'
                        + '<input type="hidden" value="' + searchAnserIndex + '" name="anserIndex" />'
                        + '<div class="removeOption">X</div>'
                        + '</div>';
        $(this).prev('.anser').append(sel);
    });

    function getConsentText(title, description, anser, c_num) {
        let consentText = '<li class="consent con_' + index + '">'
                    + '<input type="hidden" value="1" name="consentList['+ index +'].consentCode" />';
        if(c_num != 0) {
            consentText += '<input type="hidden" value="' + c_num + '" name="consentList['+ index +'].c_num" />';
        }

        consentText += '<input type="hidden" value="' + index + '" name="index" />'
                    + '<div class="remove">X</div>'
                    + '<div class="box title">'
                        + '<div class="label">항목제목</div>'
                        + '<input type="text" name="consentList['+ index +'].title" value="' + title + '" />'
                    + '</div>'
                    + '<div class="box description">'
                        + '<div class="label">항목설명</div>'
                        + '<input type="text" name="consentList['+ index +'].description" value="' + description + '" />'
                    + '</div>'
                    + '<div class="box anser">'
                        + '<div class="label">답변</div>'
                        + '<input type="text" name="consentList['+ index +'].anser" value="' + anser + '" />'
                    + '</div>'
                + '</li>';
        index++;
        return consentText;
    }

    function getConsentSelect(title, description, anserList, c_num) {
        let anserIndex = 0;
        let consentSelect = '<li class="consent con_' + index + '">'
                    + '<input type="hidden" value="2" name="consentList['+ index +'].consentCode" />';
        if(c_num != 0) {
            consentSelect += '<input type="hidden" value="' + c_num + '" name="consentList['+ index +'].c_num" />';
        }
        consentSelect += '<input type="hidden" value="' + index + '" name="index" />'
                    + '<div class="remove">X</div>'
                    + '<div class="box title">'
                        + '<div class="label">항목제목</div>'
                        + '<input type="text" name="consentList['+ index +'].title" value="' + title + '" />'
                   + '</div>'
                    + '<div class="box description">'
                        + '<div class="label">항목설명</div>'
                        + '<input type="text" name="consentList['+ index +'].description" value="' + description + '" />'
                    + '</div>'
                    + '<div class="box anser">'
                        + '<div class="label">답변</div>';
        
        if(anserList != null && anserList != '') {
            anserList.forEach(function(anser) {
                consentSelect += '<div class="select sel_' + anserIndex + '">'
                        + '<input name="naserIndex" value="' + anserIndex + '" type="hidden" />'
                        + '<input type="radio"/><input type="text" name="consentList[' + index +'].anser" value="' + anser + '" />'
                        + '<input type="hidden" value="' + anserIndex + '" name="anserIndex" />'
                        + '<div class="removeOption">X</div>'
                        + '</div>';
                anserIndex++;
            })
        } else {
            consentSelect += '<div class="select sel_' + anserIndex + '">'
                        + '<input type="radio"/><input type="text" name="consentList[' + index +'].anser" />'
                        + '<input type="hidden" value="' + anserIndex + '" name="anserIndex" />'
                        + '<div class="removeOption">X</div>'
                        + '</div>';
            anserIndex++;

            consentSelect += '<div class="select sel_' + anserIndex + '">'
                        + '<input type="radio"/><input type="text" name="consentList[' + index +'].anser" />'
                        + '<input type="hidden" value="' + anserIndex + '" name="anserIndex" />'
                        + '<div class="removeOption">X</div>'
                        + '</div>'
                    +'</div>'
                    + '<div class="addAnser">클릭하면 추가</div>'
                + '</li>';
        }
                        
                        

        index++;
        return consentSelect;
    }

    function getConsentList() {

        <c:forEach var="consent" items="${consentList}">
            if(${consent.consentCode} == 1) {
                $('.consent_list').append(getConsentText('${consent.title}', '${consent.description}', '${consent.anser}', ${consent.c_num}));
            } else if(${consent.consentCode} == 2) {
                let anserList = '${consent.anser}';
                anserList = anserList.split(',');
                $('.consent_list').append(getConsentSelect('${consent.title}', '${consent.description}', anserList, ${consent.c_num}));
            }
            index++;
        </c:forEach>

    }

    
    
</script>