<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>

<section class="userInfo">
	<div class="mytitle">내정보</div>
    <ul class="myInfoNav">
        <li class="active"><a href="">기본정보</a></li>
        <li><a href="${pageContext.request.contextPath}/user/mypage/userInfoAdd">추가정보</a></li>
    </ul>
    <table class="userTable">
        <colgroup>
            <col width="20%">
            <col width="80%">
        </colgroup>
        <tbody>
            <tr>
                <td>아이디</td>
                <td><input type="email" name="emailAdd" disabled /></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password" />
                    <p class="notice">미 입력 시 비밀번호는 변경되지 않습니다.</p>
                </td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" name="passw" /></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="name" disabled/></td>
            </tr>
            <tr>
                <td>닉네임</td>
                <td><input type="text" name="nickName" /></td>
            </tr>
            
            <tr>
                <td>연락처</td>
                <td>
                    <input type="tel" name="phone">
                </td>
            </tr>
            <tr class="address">
                <td>주소</td>
                <td class="addressList">
                    <input type="text" name="zipcode" /><button>주소지 검색</button><br>
                    <input type="text" name="address" /><br>
                    <input type="text" name="detail" placeholder="상세주소를 입력해주세요." style="margin-top:10px;" /> 
                </td>
            </tr>
            <tr class="simple">
                <td>간편 로그인</td>
                <td>
                    <div class="simple_login login_naver">
                        <a href="#">
                            <span>네이버 로그인 연동</span>
                        </a>
                    </div>
                    <div class="simple_login login_kakao">
                        <a href="#">
                            <span>카카오 로그인 연동</span>
                        </a>
                    </div>
                    <div class="simple_login login_facebook">
                        <a href="#">
                            <span>페이스북 로그인 연동</span>
                        </a>
                    </div>
                </td>
            </tr>
            <tr class="agreement">
                <td>수집동의</td>
                <td>
                    <input type="checkbox" name="sAgr" id="sAgr" /><label for="sAgr"><i></i>캠페인 모집 및 추천, 이벤트 정보 등 마케팅 수신 이메일, 문자, 카카오톡 등)에 동의합니다. (선택)</label>
                    
                    <table class="agreeContents">
                        <tr>
                            <th>목적</th>
                            <th>항목</th>
                            <th>보유 및 이용기간</th>
                        </tr>
                        <tr>
                            <td>이용자 식별 및<br>본인여부 확인</td>
                            <td>이메일, 성함, 주소,<br>비밀번호, 연락처</td>
                            <td>회원탈퇴시까지</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>

    <div class="infoSubmit">
        <button type="submit">기본정보 저장</button>
    </div>


    <div class="channel">
        <div class="title">미디어등록</div>

        <div class="ch" id="naver">
            <div class="name">나의 블로그</div>
            <div class="insert">
                <input type="text" name="link" value="https://blog.naver.com/">
				<p class="notice">등록 및 변경하시는 블로그 URL를 입력해주세요.</p>
                <p class="notice">캠페인 신청 시 등록된 미디어로 신청되오니 '링크 확인' 버튼으로 링크를 올바르게 입력했는지 꼭 확인해주세요.</p>
            </div>
            <div class="btn">
                <button class="check">링크 확인</button>
                <button class="registChannel">채널 등록</button>
            </div>
        </div>

        <div class="ch" id="instagram">
            <div class="name">나의 인스타</div>
            <div class="insert">
                <input type="text" name="link" value="https://www.instagram.com/"> 
				<p class="notice">등록 및 변경하시는 인스타그램 URL를 입력해주세요.</p>
                <p class="notice">캠페인 신청 시 등록된 미디어로 신청되오니 '링크 확인' 버튼으로 링크를 올바르게 입력했는지 꼭 확인해주세요.</p>
            </div>
            <div class="btn">
                <button class="check">링크 확인</button>
                <button class="registChannel">채널 등록</button>
            </div>
        </div>

        <div class="ch" id="facebook">
            <div class="name">나의 페이스북</div>
            <div class="insert">
                <input type="text" name="link" value="https://www.facebook.com/"> 
				<p class="notice">등록 및 변경하시는 페이스북 URL를 입력해주세요.</p>
                <p class="notice">캠페인 신청 시 등록된 미디어로 신청되오니 '링크 확인' 버튼으로 링크를 올바르게 입력했는지 꼭 확인해주세요.</p>
            </div>
            <div class="btn">
                <button class="check">링크 확인</button>
                <button class="registChannel">채널 등록</button>
            </div>
        </div>

        <div class="ch" id="youtube">
            <div class="name">나의 유튜브</div>
            <div class="insert">
                <input type="text" name="link" value="https://www.youtube.com/channel/"> 
				<p class="notice">등록 및 변경하시는 유튜브 URL를 입력해주세요.</p>
                <p class="notice">캠페인 신청 시 등록된 미디어로 신청되오니 '링크 확인' 버튼으로 링크를 올바르게 입력했는지 꼭 확인해주세요.</p>
            </div>
            <div class="btn">
                <button class="check">링크 확인</button>
                <button class="registChannel">채널 등록</button>
            </div>
        </div>
    </div>

    <div class="inqury">
        <button>문의하기</button>
        <button>탈퇴하기</button>
    </div>
    

</section>
</div>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

    $('.addressList button').click(function() {
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
    });

    function modifyAddress(aNum) {
        window.open('${pageContext.request.contextPath}/user/mypage/userInfo/address?aNum='+aNum,'배송지 주소',
        'width=500px,height=800px,scrollbars=yes');
    }

    $(document).ready(function() {
        userInfo();
    });

    function userInfo() {
        $.ajax({
            url: '${pageContext.request.contextPath}/user/mypage/getUserInfo',
            type : 'post',
            success : function(result) {
                $('input[name=emailAdd]').val(result.user.id);
                $('input[name=name]').val(result.user.name);
                $('input[name=nickName]').val(result.user.nickName);
                $('input[name=phone]').val(result.user.phone_number);
                //$('input[name=eAgr]').prop('checked', result.user.eAgr);
                $('input[name=sAgr]').prop('checked', result.user.sagr);

                (result.channelList).forEach(function(channel) {
                    if(channel==null) {
                        return true;
                    }
                    if(channel.channelCode == 1) {
                        $('#naver input[name=link]').val('https://blog.naver.com/' + channel.url);
                    }

                    if(channel.channelCode == 2) {
                        $('#naver input[name=link]').val('https://blog.naver.com/' + channel.url);
                    }

                    if(channel.channelCode == 3) {
                        $('#facebook input[name=link]').val(channel.url);
                    }

                    if(channel.channelCode == 4) {
                        $('#youtube input[name=link]').val(channel.url);
                    }
                });

                if(result.user.naver_id != null) {
                    $('.simple .login_naver').addClass('connect');
                    $('.simple .login_naver a span').append('해제');
                }
                
                if(result.user.kakao_id != null) {
                    $('.simple .login_kakao').addClass('connect');
                    $('.simple .login_kakao a span').append('해제');
                }

                if(result.user.facebook_id != null) {
                    $('.simple .login_facebook').addClass('connect');
                    $('.simple .login_facebook a span').append('해제');
                }
                

                if(result.address != null && result.address != '') {
                    $('input[name=zipcode]').val(result.address.zipCode);
                    $('input[name=address]').val(result.address.address);
                    $('input[name=detail]').val(result.address.detail);
                }

                
            }, error : function(e) {
                console.log(e.error);
            }
        });
    }


    $('.infoSubmit button[type=submit]').click(function() {
        let password = $('input[name=password]').val();
        let password2 = $('input[name=passw]').val();
        let nickName = $('input[name=nickName]').val();
        let phone = $('input[name=phone]').val();

        let zipcode = $('input[name=zipcode]').val();
        let address = $('input[name=address]').val();
        let detail = $('input[name=detail]').val();
        let sAgr = $('input[name=sAgr]').val();

        if(password.length >= 1 && password.length <= 7) {
            alert('비밀번호는 8자 이상 입력해주세요. 미입력 시 비밀번호는 변경되지 않습니다.');
            $('input[name=password]').focus();
            return false;
        }

        if(password.length >= 1 && password != password2) {
            alert('비밀번호 확인과 맞지 않습니다.');
            $('input[name=passw]').focus();
            return false;
        }

        if((address.length >= 1) && (detail.length == 0 || detail == '' || detail == null)) {
            if(!confirm('상세주소를 입력하지 않았습니다. 주소지가 ' + address + ' 가 맞을까요?')) {
                $('input[name=detail]').focus();
                return false;
            }
        }

        let modifyUserData = {
            'password' : password,
            'nickName' : nickName,
            'phone' : phone,
            'zipcode' : zipcode,
            'address' : address,
            'detail' : detail,
            'sAgr' : sAgr
        }

        $.ajax({
            url : '${pageContext.request.contextPath }/user/mypage/modifyUser',
            type : 'post',
            data : modifyUserData,
            success : function(r) {
                if(r) {
                    alert('수정완료');
                    location.reload();
                }
            }, error : function(e) {
                console.log(e);
                alert('등록 오류, 지속될 경우 관리자에게 연락 부탁드립니다.');
                location.reload();
            }
        });
    });

    var blogCheck = false;
    var instagramCheck = false;
    var facebookCheck = false;
    var youtubeCheck = false;

    $('button.check').click(function() {
        let ch = $(this).parents('.ch');
        let elementId = ch.attr('id');
        let link = $('#'+elementId+ ' .insert input[name=link]').val();


        if(elementId == 'naver') {

            if(link.length == 0 || link == null || link == '') {
                alert('블로그 링크를 입력해주세요.');
                $('#'+elementId+ ' .insert input[name=link]').focus();
                return false;
            }

            if(!link.includes('https://blog.naver.com/') && !link.includes('https://m.blog.naver.com/')) {
                alert('블로그는 https://blog.naver.com/ 또는 https://m.blog.naver.com/ 으로 시작하는 링크를 입력해주세요.');
                $('#'+elementId+ ' .insert input[name=link]').focus();
                return false;
            } else {
                blogCheck = true;
                $(this).css('background', '#eee');
            }
        } else if(elementId == 'instagram') {

            if(link.length == 0 || link == null || link == '') {
                alert('인스타그램 링크를 입력해주세요.');
                $('#'+elementId+ ' .insert input[name=link]').focus();
                return false;
            }

            if(!link.includes('https://www.instagram.com/')) {
                alert('인스타그램는 https://www.instagram.com/ 으로 시작하는 링크를 입력해주세요.');
                $('#'+elementId+ ' .insert input[name=link]').focus();
                return false;
            } else {
                instagramCheck = true;
                $(this).css('background', '#eee');
            }
        } else if(elementId == 'youtube') {

            if(link.length == 0 || link == null || link == '') {
                alert('유튜브 링크를 입력해주세요.');
                $('#'+elementId+ ' .insert input[name=link]').focus();
                return false;
            }

            if(!link.includes('https://www.youtube.com/channel/') || !link.includes('https://www.youtube.com/c/')) {
                alert('유튜브는 https://www.youtube.com/channel/ 또는 https://www.youtube.com/c/ 으로 시작하는 링크를 입력해주세요.');
                $('#'+elementId+ ' .insert input[name=link]').focus();
                return false;
            } else {
                youtubeCheck = true;
                $(this).css('background', '#eee');
            }
           
        } else if (elementId == 'facebook') {

            if(link.length == 0 || link == null || link == '') {
                alert('페이스북 링크를 입력해주세요.');
                $('#'+elementId+ ' .insert input[name=link]').focus();
                return false;
            }

            if(!link.includes('https://www.facebook.com/')) {
                alert('페이스북은 https://www.facebook.com/ 으로 시작되는 링크를 입력해주세요.');
                $('#'+elementId+ ' .insert input[name=link]').focus();
                return false;
            } else {
                facebookCheck = true;
                $(this).css('background', '#eee');
            }
        }

        window.open(link);
        
    });

    $('.registChannel').click(function() {
        let ch = $(this).parents('.ch');
        let elementId = ch.attr('id');
        let link = $('#'+elementId+ ' .insert input[name=link]').val();

        console.log(ch);

        if(elementId == 'naver') {
            if(!blogCheck) {
                alert('링크를 확인해주세요.');
                $('#'+elementId+' .btn button.check').focus();
                return false;
            }
        } else if(elementId == 'instagram') {
            if(!instagramCheck) {
                alert('링크를 확인해주세요.');
                $('#'+elementId+' .btn button.check').focus();
                return false;
            }
        } else if(elementId == 'youtube') {
            if(!youtubeCheck) {
                alert('링크를 확인해주세요.');
                $('#'+elementId+' .btn button.check').focus();
                return false;
            }
        } else if (elementId == 'facebook') {
            if(!facebookCheck) {
                alert('링크를 확인해주세요.');
                $('#'+elementId+' .btn button.check').focus();
                return false;
            }
        }

        registChannelFunc(link, elementId);
    });

    function registChannelFunc(link, channel) {
        $.ajax({
            url : '${pageContext.request.contextPath }/user/mypage/channel',
            type : 'post',
            data : {'link':link, 'channel':channel},
            success : function(r) {
                if(r) {
                    alert('채널 등록(수정)이 완료되었습니다');
                    userInfo();
                } else {
                    alert('채널 등록(수정)에 실패했습니다. 지속될 경우 관리자에게 말씀해주세요.');
                }
            }, error : function(e) {
                console.log(e);
                alert('채널 등록(수정)에 실패했습니다. 지속될 경우 관리자에게 말씀해주세요.');
            }
        });
    }

    $('.simple .login_naver').click(function() {
        if($(this).hasClass('connect')) {
            channelLogin('naver', '');
        } else {
            
        }
    });

    $('.simple .login_kakao').click(function() {
        if($(this).hasClass('connect')) {
            channelLogin('kakao', '');
        } else {
            kakaoLogin();
        }
    });

    $('.simple .login_facebook').click(function() {
        if($(this).hasClass('connect')) {
            channelLogin('facebook', '');
        } else {
            
        }
    });

    Kakao.init('996b3e2e8741e5a841b1c6e72ce31c40');

    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                        channelLogin('kakao', response.id);
                    },
                    fail: function (error) {
                        console.log(error)
                    }
                })
            },
            fail: function (error) {
                console.log(error)
            },
        })
    }

    function channelLogin(channel, id) {
        let sendData = {
            'channel' : channel,
            'id' : id
        };

        $.ajax({
            url : '${pageContext.request.contextPath}/user/mypage/channelModify',
            type : 'post',
            data : sendData,
            success : function(map) {
                if(map.user == -1) {
                    alert('로그인 후 재시도 부탁드립니다.');
                    location.reload();
                }
                
                if(map.result == 1) {
                    alert('채널 연동 완료');
                    location.reload();
                } else if(map.result == 2) {
                    alert('채널 연동 해제');
                    location.reload();
                } else {
                    alert('채널 연동 실패, 지속될 경우 관리자에 말씀해주세요.');
                    //location.reload();
                }
            }
        });
    }

</script>