<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="kr.com.amean.entity.user.User"%>


<script>
    $(document).ready(function() {
        let ap = '${apply}';
        let ad = '${address}';
        let channel_naver_id = '${navChannelURL}';
        let channel_insta_id = '${insChannelURL}';
        let experienceCheck_kindN = ${experience.kind_n};
        let experienceCheck_kindi = ${experience.kind_i};
        if(ap != null && ap != '') {
            alert('이미 신청하신 체험입니다.');
            window.history.back();
        }

        if(ad == '') {
            alert('주소지와 채널을 입력하고 신청해주세요.');
            window.location = '${pageContext.request.contextPath }/user/mypage/userInfo';
        }

        if(experienceCheck_kindN == true) {
            if(channel_naver_id == '') {
                alert('주소지와 채널을 입력하고 신청해주세요.');
                window.location = '${pageContext.request.contextPath }/user/mypage/userInfo#naver';
                return false
            }
        }

        if(experienceCheck_kindi == true) {
            if(channel_insta_id == '') {
                alert('주소지와 채널을 입력하고 신청해주세요.');
                window.location = '${pageContext.request.contextPath }/user/mypage/userInfo#instagram';
                return false
            }
        }
    })
</script>

<div class="container" style="margin:0 auto;">

    <input type="hidden" name="e_num" value="${experience.e_num}" />
    <input type="hidden" name="naverEmail" />
    <section class="ex_aply">
        <div class="exper_left">
            <div class="tit">
                <h3>캠페인 신청</h3>
            </div>
            <div class="aply_ul">
                <div class="aply_li">
                    <div class="aply_tit">제공 내용</div>
                    <div class="aply_cont">
                        ${experience.service}
                    </div>
                </div>
                <div class="aply_li">
                    <div class="aply_tit">회원 정보</div>
                    <div class="aply_cont">
                        <div class="aply_inp">
                            <input type="text" placeholder="성함" value="${user.name}" />
                        </div>
                        <div class="aply_inp">
                            <input type="tel" placeholder="연락처" value="${user.phone_number}" />
                        </div>
                    </div>
                </div>

                <c:if test="${fn:contains(experience.MCategory, '제품')}">
                    <div class="aply_li">
                        <div class="aply_tit">주소</div>
                        <div class="aply_cont">
                            <div class="aply_inp zipcode">
                                <input type="text" name="zipcode" value="${address.zipCode}" disabled/>
                            </div>
                            <!-- <button class="searchAddress">주소지 검색</button> -->
                            <div class="aply_inp">
                                <input type="text" name="address" value="${address.address}" disabled/>
                            </div>
                            <div class="aply_inp">
                                <input type="text" name="detail"  value="${address.detail}" style="margin-top:10px;" disabled /> 
                            </div> 
                        </div>
                    </div>
                </c:if>

                <c:if test="${experience.kind_n}">
                    <div class="aply_li" id="blog_channel">
                        <div class="aply_tit">블로그</div>
                        <div class="aply_cont">
                           
                            <div class="channel_add">
                                <input type="text" name="nId" value="https://blog.naver.com/" disabled />
                                <button id="check_nId">링크 확인</button>
                                <span></span>
                            </div>
                        </div>
                    </div>
                </c:if>

                <c:if test="${experience.kind_i}">
                    <div class="aply_li" id="insta_channel">
                        <div class="aply_tit">인스타그램</div>
                        <div class="aply_cont">
                           
                            <div class="channel_add">
                                <input type="text" name="iId" value="https://www.instagram.com/" disabled />
                                <button id="check_iId">링크 확인</button>
                                <span></span>
                            </div>
                        </div>
                    </div>
                </c:if>
                
                <c:if test="${not empty consentList}">
                    <c:forEach items="${consentList}" var="consent" varStatus="status">
                        <div class="aply_li consent_${status.index} consent">
                            <input type="hidden" value="${consent.c_num}" name="consentList[${status.index}].c_num" />
                            <div class="aply_tit">${consent.title}</div>
                            <div class="aply_cont">
                                <div class="caution">
                                    ${consent.description}
                                </div>
                                <div class="agree">
                                    
                                </div>
                                <script>
                                    let anserList_${status.index} = '${consent.anser}';
                                    anserList_${status.index} = anserList_${status.index}.split(',');
                                    let consentAgree_${status.index} = '<select class="selector">';

                                    anserList_${status.index}.forEach(function(anser, i) {
                                        
                                        consentAgree_${status.index} += '<option name="consentList[${status.index}].userAnser">' + anser + '</option>';
                                    });

                                    consentAgree_${status.index} += '</select>'
                                     
                                    $('.consent_${status.index} .agree').append(consentAgree_${status.index});
                                </script>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <div class="aply_li">
                    <div class="aply_tit">리뷰 유지</div>
                    <div class="aply_cont">
                        <div class="caution">
                            작성된 리뷰는 <strong>최소 6개월 이상 유지</strong>되어야 합니다. 6월 이전에 리뷰 삭제 또는 비공개, 심한 수정이 있을 시 재작성을 요청드릴 수 있습니다.
                            또한, 체험 진행 시 제공되는 가이드라인에 요청드린 사항이 리뷰내에 누락되거나 제품에 대한 잘못된 내용, 심한 오타 등이 있을 경우 수정을 요청드릴 수 있습니다.
                        </div>
                        <div class="agree">
                            <input type="checkbox" name="guide_agree" id="guide_agree"><label for="guide_agree"><i></i>네, 알겠습니다.</label>
                        </div>
                        
                    </div>
                </div>
                <div class="aply_li">
                    <div class="aply_tit">패널티</div>
                    <div class="aply_cont">
                        <div class="caution">
                            사전에 연락 없이 체험 지연 및 리뷰 작성이 지연되는 경우 다른 체험 선정에 불이익이 발생할 수 있습니다. 
                            <span style="color:red">제품 또는 서비스를 제공받고 연락두절, 체험취소, 포스팅 지연 시 관련법에 의해 법적 처벌대상이 될 수 있으며
                            제품/서비스에 대한 비용이 청구될 수 있습니다.</span> 이 경우 저희 원포에서 리뷰어님을 보호해드리기 어려우니 꼭 잊지말고 작성 부탁드립니다.
                        </div>
                        <div class="agree">
                            <input type="checkbox" name="caution_agree" id="caution_agree"><label for="caution_agree"><i></i>네, 알겠습니다.</label>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="exper_right">
            <div class="info_area">
                <div class="thubm">
                    <img src="${pageContext.request.contextPath }/${experience.main_img}" width="100%" />
                </div>
                <h4>${experience.title}</h4>
				<ul>
					<li class="ex_apply_date">
						<div class="title">모집기간</div>
						<div class="content"><fmt:formatDate value="${experience.startDate}" pattern="MM.dd"/> ~ <fmt:formatDate value="${experience.endDate}" pattern="MM.dd"/></div>
					</li>
					<li class="ex_apply_ann_date">
						<div class="title">발표일</div>
						<div class="content"><fmt:formatDate value="${experience.desDate}" pattern="MM.dd"/></div>
					</li>
                    <li class="ex_apply_ann_date">
						<div class="title">작성일</div>
						<div class="content">${guide.closeDate}</div>
					</li>
				</ul>
				<div class="agr">
                    <input type="checkbox" name="agree_marketing" id="agree_marketing"><label for="agree_marketing"><i></i>마케팅 활용에 동의합니다.</label><br><span class="ag_zoom">자세히보기</span>
                </div>
                <div class="agr">
                    <input type="checkbox" name="agree_userinfo" id="agree_userinfo"><label for="agree_userinfo"><i></i>캠페인 유의사항 및 제 3자 제공에 모두 동의 합니다</label><br>
                    <a href="${pageContext.request.contextPath}/policy/userInfoView#agrShare"><span class="ag_zoom">자세히보기</span></a>
                </div>
				<div class="apply_btn">캠페인 신청</div>
			</div>
        </div>
    </section>

</div>

<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    var nav_check = false;
    var ins_check = false;
    var isNav = false;
    var isIns = false;

    var kind_n_check = ${experience.kind_n};
    var kind_i_check = ${experience.kind_i};

    $(document).ready(function() {

        let nId = '${navChannelURL}';
        let iId = '${insChannelURL}';
        let splitnId = nId.split('@',1);
        let nIdLink  = 'https://blog.naver.com/' + splitnId;
        let iIdLink = 'https://www.instagram.com/' + iId;

        if(kind_n_check) {
            if(nId == null || nId == '') {
                nIdcheck = '등록된 채널이 없습니다. 블로그 URL를 입력해주세요.';
                $('input[name=nId]').siblings('span').append(nIdcheck);
                $('#check_nId').remove();
                let addBtn = '<button id="add_nId">채널 확인</button>'
                $('.channel_add').append(addBtn);
                isNav = false;
            } else {
                nav_check = true;
                isNav = true;
            }
        }
        
        if(kind_i_check) {
            if(iId == null || iId == '') {
                iIdcheck = '등록된 채널이 없습니다. 인스타그램 URL를 입력해주세요.';
                $('input[name=iId]').siblings('span').append(iIdcheck);
                $('#check_iId').remove();
                let addBtn = '<button id="add_iId">채널 확인</button>'
                $('.channel_add').append(addBtn);
                isIns = false;
            } else {
                ins_check = true;
                isIns = true;
            }
        }

       

        $('.channel_add input[name=nId]').val(nIdLink);
        
    });

    $(document).on('click', '#add_nId', function() {
        let navId = $('input[name=nId]').val();
        if(!navId.includes('https://blog.naver.com/') && !navId.includes('https://m.blog.naver.com/')) {
            alert('블로그 링크에 https://blog.naver.com 또는 https://m.blog.naver.com 을 반드시 포함해주세요.');
            return false;
        }

        if(navId == 'https://blog.naver.com/') {
            alert('블로그 링크를 입력해주세요.');
            return false;
        }

        window.open(navId);
        nav_check = true;
        $(this).css({'background':'#950101', 'color' : 'white', 'border-top-right-radius' : '10px', 'border-bottom-right-radius' : '10px'})
    });

    

    $(document).on('click', '#add_iId', function() {
        let insId = $('input[name=iId]').val();
        if(!insId.includes('https://www.instagram.com/') && !insId.includes('https://instagram.com/')) {
            alert('인스타그램 링크에 https://www.instagram.com 를 반드시 포함해주세요.');
            return false;
        }

        if(insId == 'https://www.instagram.com/') {
            alert('인스타그램 링크를 입력해주세요.');
            return false;
        }

        window.open(insId);
        ins_check = true;
        $(this).css({'background':'#950101', 'color' : 'white', 'border-top-right-radius' : '10px', 'border-bottom-right-radius' : '10px'})
    });

    $(document).on('change', 'input[name=nId]', function() {
        if(nav_check) nav_check = false;
        if(isNav) {
            $('#check_nId').remove();
            let addBtn = '<button id="add_nId">채널 확인</button>'
            $('.channel_add').append(addBtn);
            isNav = false;
        }
    });

    $(document).on('change', 'input[name=iId]', function() {
        if(ins_check) ins_check = false;
        if(isIns) {
            $('#check_iId').remove();
            let addBtn = '<button id="add_iId">채널 확인</button>'
            $('.channel_add').append(addBtn);
            isNav = false;
        }
    });

    $('input[name=naverEmail]').change(function() {
        let nId = $(this).val();
        if(nId != null || nId != '') {
            let splitnId = nId.split('@',1);
            let nIdLink  = 'https://blog.naver.com/' + splitnId;
            $('#add_nId').remove();
            let check_nId = '<button id="check_nId">링크확인</button>'
            $('.channel_add').append(check_nId);
            $('.channel_add input[name=nId]').val(nIdLink);
        }
        
    });

    $('.searchAddress').click(function() {
        setAddress();
    });

    $('input[name=zipcode]').click(function() {
        setAddress();
    });

    $('input[name=address]').click(function() {
        setAddress();
    });

    function setAddress() {
        new daum.Postcode({
                oncomplete : function(data) {
                    let roadAddress = data.roadAddress;
                    let jibunAddress = data.jibunAddress;

                    $('input[name=zipcode]').val(data.zonecode);
                    if(roadAddress != '') {
                        $('input[name=address]').val(roadAddress);
                    } else if(jibunAddress != '') {
                        $('input[name=address]').val(jibunAddress);
                    }
                }
                
            }).open();
    };

    function navLogin() {
		let url = 'https://nid.naver.com/nidlogin.login?oauth_token=ZT2LY0h0AhBimBeEbn&consumer_key=sFd89GzqyDOPCe20rvXH&logintp=oauth2&nurl=https%3A%2F%2Fnid.naver.com%2Foauth2.0%2Fauthorize%3Fresponse_type%3Dtoken%26state%3Dd933ebdd-edec-4661-bce1-a9ef4cb96fb5%26client_id%3DsFd89GzqyDOPCe20rvXH%26redirect_uri%3Dhttp%253A%252F%252Flocalhost%253A8080%252Fone4-1%252Fuser%252Fnav_callback%26locale%3Dko_KR%26inapp_view%3D%26oauth_os%3D&locale=ko_KR&inapp_view=&svctype=';
		window.open(url,'배송지 주소', 'width=500px,height=800px,scrollbars=yes');
	}

    $('.channel_add #check_nId').click(function() {
        window.open('https://blog.naver.com/${navChannelURL}');
    });

    $('.channel_add #check_iId').click(function() {
        window.open('https://www.instagram.com/${insChannelURL}');
    });


    $('.ex_aply .exper_right .apply_btn').click(function() {

        let navId = null;
        let insId = null;

        if(kind_n_check) {
            if(!nav_check) {
                alert('채널 확인해주세요.');
                return false;
            }
            
            navId = $('input[name=nId]').val();
            
        }

        if(kind_i_check) {
            if(!ins_check) {
                alert('채널을 확인해주세요.');
                return false;
            }
            
            insId = $('input[name=iId]').val();
            
        }

        let eNum = $('input[name=e_num]').val();

        let address = $('input[name=address]').val();
        let zipcode = $('input[name=zipcode]').val();
        let detail = $('input[name=detail]').val();

        let caution_agree = $('input[name=caution_agree]').is(':checked');
        let agree_marketing = $('input[name=agree_marketing]').is(':checked');
        let agree_userinfo = $('input[name=agree_userinfo]').is(':checked');

        let consentSize = $('.aply_li .consent').length;
        let userAnser = '';
        if(consentSize != 0) {
            for(let i=0; i<=consentSize-1; i++) {
                if(i >= 1) {
                    userAnser += ',';
                }
                userAnser += $('.aply_li .consent_' + i + ' .agree select option:selected').val();
            }
             
        }

        if(!caution_agree) {
            alert('주의사항에 동의해주세요');
            $('input[name=caution_agree]').focus();
            return false;
        }

        if(!agree_marketing) {
            alert('마케팅 활용에 동의해주세요');
            $('input[name=agree_marketing]').focus();
            return false;
        }

        if(!agree_userinfo) {
            alert('개인정보 활용에 동의해주세요');
            $('input[name=agree_userinfo]').focus();
            return false;
        }

        if(address == null) {
            alert('배송지를 추가해주세요.');
            $('.aply_but button').focus();
            return false;
        }

        let sendData = {
            'eNum' : eNum,
            'zipcode' : zipcode,
            'address' : address,
            'detail' : detail,
            'caution_agree' : caution_agree,
            'agree_marketing' : agree_marketing,
            'agree_userinfo' : agree_userinfo,
            'navId' : navId,
            'insId' : insId,
            'userAnser' : userAnser
        }

        $.ajax({
            url : '${pageContext.request.contextPath}/experience/experienceApply',
            type : 'post',
            data : sendData,
            success : function(result) {
                if(result) {
                    alert('체험에 신청했습니다.');
                    window.location = '${pageContext.request.contextPath}/experience/detail?eNum=' + eNum;
                } else {
                    alert('체험 신청에 실패 했습니다. 지속될 경우 관리자에게 말씀 부탁드립니다.');
                }
            }, error : function(e) {
                console.log(e);
                alert('체험 신청에 실패 했습니다. 지속될 경우 관리자에게 말씀 부탁드립니다.');
            }
        })

    });


</script>