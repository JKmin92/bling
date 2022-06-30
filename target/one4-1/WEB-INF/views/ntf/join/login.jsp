<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
    .joinCon {margin:100px auto 0 auto !important; min-width:auto; width:400px; min-width: auto;}
    @media (max-width : 787px) {
        .joinCon {width:100%;}
    }
</style>

<div class="container joinCon">
    <section class="login">


        
        <div class="logo">
			<a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="100%" /></a>
		</div>

            <div class="user_info">
                <div class="user_id">
                    <input type="email" placeholder="email" name="email" />
                </div>
                <div class="user_pw">
                    <input type="password" placeholder="password" name="password" />
                </div>
                <div class="btns">
                    <div class="auto_login">
                        <label style="display: none;"><input type="checkbox" name="autoLogin">자동로그인</label>
                    </div>
                    <div class="lost_pw">
                        <a href="${pageContext.request.contextPath}/user/find/password"><span>비밀번호 찾기</span></a>
                    </div>
                </div>
                <button class="login_btn">로그인</button>
            </div>

        <div class="social">
            <span>SNS 계정 로그인</span>
			<p class="subject">SNS 계정으로 더욱 간편하게 로그인하세요.</p>
			
            <div class="channel">
                <button><img src="${pageContext.request.contextPath}/resources/img/icon/channel/login_naver.png" width="40px"></button>
                <button onclick="kakaoLogin();"><img src="${pageContext.request.contextPath}/resources/img/icon/channel/login_kakao.png" width="40px"></button>
                <button onclick="fbLogin();"><img src="${pageContext.request.contextPath}/resources/img/icon/channel/login_facebook.png" width="40px"></button>
            </div>
        </div>
		
		<div class="notice">
			<p class="title">가치중심 리뷰 플랫폼 원포를 만나보세요.</p>
			<p class="content">누구에게나 쉽고 즐거운 NEW-파이프라인</p>
		</div>

        <div class="log_join">
            <div class="btn join" onclick="location.href='${pageContext.request.contextPath}/user/joinView'">회원가입</div>
        </div>

        <div class="bottom_locate">
            <div class="btm_btn"><a href="#">회사소개</a></div>
            <div class="btm_btn"><a href="#">광고문의</a></div>
            <div class="btm_btn"><a href="${pageContext.request.contextPath}/policy/useServiceView">이용약관</a></div>
			<div class="btm_btn"><a href="${pageContext.request.contextPath}/policy/userInfoView">개인정보처리방침</a></div>
			<div class="btm_btn"><a href="${pageContext.request.contextPath}/policy/operationView">운영정책</a></div>
			
        </div>
		<p class="copyright">Copyrightⓒ2022 Amean. All right reserved.</p>


        
    </section>
</div>


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=773115777379953" nonce="SiOBIhLG"></script>
<script>

    Kakao.init('996b3e2e8741e5a841b1c6e72ce31c40');

    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                        channelLogin('kakao', response.id, response.kakao_account.email);
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

    function statusChangeCallback(res){
        statusChangeCallback(response);
    }

    function fbLogin(){
        FB.login(function(response) {
            if (response.status === 'connected') {
                FB.api('/me', 'get', {fields: 'name,email'}, function(r) {
                    console.log(r);
                })
            } else if (response.status === 'not_authorized') {
                alert('앱에 로그인해야 이용가능한 기능입니다.');
            } else {
                alert('페이스북에 로그인해야 이용가능한 기능입니다.');
            }
        }, {scope: 'public_profile,email'});
    }

    window.fbAsyncInit = function() {
        FB.init({
            appId      : '773115777379953',
            cookie     : true,
            xfbml      : true,
            version    : 'v10.0'
        });
        FB.AppEvents.logPageView();   
    };

    function channelLogin(channel, id, email) {
        let sendData = {
            'channel' : channel,
            'id' : id,
            'email' : email
        };

        $.ajax({
            url : '${pageContext.request.contextPath}/user/login/channelgo',
            type : 'post',
            data : sendData,
            success : function(result) {
                if(result == true) {
                    let locate = getParameterByName('locate');
                    let eNum = getParameterByName('eNum');
                    let popup = getParameterByName('popup');

                    if(popup == '1' || popup == 1) {
                        window.location.replace('${pageContext.request.contextPath }/experience/apply?eNum='+ eNum);
                    } else if(locate != null) {
                        if(locate == 'apply') {
                            window.location.replace('${pageContext.request.contextPath}/experience/apply?eNum='+ eNum);
                        } else if (locate == 'experDetail') {
                            window.location.replace('${pageContext.request.contextPath}/experience/detail?eNum='+ eNum);
                        } else if(locate == 'inquery') {
                            window.location.replace('${pageContext.request.contextPath}/user/mypage/inqury/list');
                        }
                    } else {
                        window.location.replace('${pageContext.request.contextPath }/');
                    }

                } else {
                    window.location = '${pageContext.request.contextPath}/user/joinViewChannel?channel=' + channel +'&channelId=' + id + '&email=' + email;
                }
            }
        });
    }

    $('input[name=email]').keydown(function(key) {
        if(key.keyCode == 13) {
            $('.login_btn').click();
        }
    });

    $('input[name=password]').keydown(function(key) {
        if(key.keyCode == 13) {
            $('.login_btn').click();
        }
    });

    $('.login_btn').on('click', function() {
        let email = $('input[name=email]').val();
        let password = $('input[name=password]').val();

        if(email.length == 0) {
            alert('email을 입력해주세요');
            return false;
        }

        if(password.length == 0) {
            alert('비밀번호를 입력해주세요');
            return false;
        }

        $.ajax({
            url : '${pageContext.request.contextPath}/user/login/go',
            data : {'id':email, 'password':password},
            type : 'post',
            success : function(result) {
                if(result.data) {

                    let locate = getParameterByName('locate');
                    let eNum = getParameterByName('eNum');
                    let popup = getParameterByName('popup');

                    if(popup == '1' || popup == 1) {
                        window.location.replace('${pageContext.request.contextPath }/experience/apply?eNum='+ eNum);
                    } else if(locate != null && locate != '') {
                        if(locate == 'apply') {
                            window.location.replace('${pageContext.request.contextPath}/experience/apply?eNum='+ eNum);
                        } else if (locate == 'experDetail') {
                            window.location.replace('${pageContext.request.contextPath}/experience/detail?eNum='+ eNum);
                        } else if(locate == 'inquery') {
                            window.location.replace('${pageContext.request.contextPath}/user/mypage/inqury/list');
                        }
                    } else {
                        window.location.replace('${pageContext.request.contextPath }/');
                    }
                    
                } else {
                    alert("ID 또는 비밀번호가 다릅니다.");
                }
            }, error : function(e) {
                console.log(e);
                alert("로그인에 실패했습니다.")
            }
        })
    });
</script>

