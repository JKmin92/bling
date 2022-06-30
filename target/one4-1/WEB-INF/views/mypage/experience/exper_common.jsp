<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="container mypage">
<div class="mytitle top">마이페이지</div>
<div class="mysimple">
	
    <div class="my_left">
        <div class="profile">
            <div class="img">
                <div class="userImg" style="background-image: url('${pageContext.request.contextPath}/resources/img/user/basic_user.png');"></div>
            </div>
            <p class="name"></p>
            <p class="email"></p>
        </div>

        <div class="premium_area">
            <div class="btn">프리미엄 <span>신청</span></div>
        </div>
    </div>

    <div class="my_right">
        <div class="campaign_state">
			<div class="campign">
            <h3>나의 캠페인</h3>

            <ul>
                <a href="${pageContext.request.contextPath}/user/mypage/applyExperience">
                    <li class="counting">
                        <div class="num applyOnCount"></div>
                        <div class="subject">신청한 캠페인</div>
                    </li>
                </a>
                <a href="${pageContext.request.contextPath}/user/mypage/selectExper">
                    <li class="counting">
                        <div class="num experApplyOnCount"></div>
                        <div class="subject">선정된 캠페인</div>
                    </li>
                </a>
                <a href="${pageContext.request.contextPath}/user/mypage/insertExper">
                    <li class="counting">
                        <div class="num nonCommitCount"></div>
                        <div class="subject">미등록 컨텐츠</div>
                    </li>
                </a>
                <a href="${pageContext.request.contextPath}/user/mypage/registerReview">
                    <li class="counting">
                        <div class="num commitCount"></div>
                        <div class="subject">등록한 컨텐츠</div>
                    </li>
                </a>
            </ul>
			</div>
        </div>
        
        <div class="channel">
            <div class="nav"><a href="${pageContext.request.contextPath}/user/mypage/userInfo#naver"></a></div>
            <div class="ins"><a href="${pageContext.request.contextPath}/user/mypage/userInfo#instagram"></a></div>
            <div class="fac"><a href="${pageContext.request.contextPath}/user/mypage/userInfo#facebook"></a></div>
            <div class="you"><a href="${pageContext.request.contextPath}/user/mypage/userInfo#youtube"></a></div>
        </div>
    </div>
    
</div>

<div class="my_snb">
    <ul>
        <a href="${pageContext.request.contextPath}/user/mypage/userInfo"><li>내정보</li></a>
        <a href="${pageContext.request.contextPath}/user/mypage/applyExperience"><li>나의 캠페인</li></a>
        <a href="${pageContext.request.contextPath}/user/mypage/interestExper"><li>관심 캠페인</li></a>
        <a href="${pageContext.request.contextPath}/user/mypage/point/list"><li>나의 포인트</li></a>
        <a href="${pageContext.request.contextPath}/user/mypage/inqury/list"><li>1:1 문의하기</li></a>
    </ul>
</div>

<script>

    $(document).ready(function() {
        getEpxerienceCounter();
        getMySnbActive();

        if($(window).width() > 800) {
            $('body').addClass('gnb_active');
        }
    });

    $(window).resize(function() {
        if($(window).width() > 800) {
            if(!$('body').hasClass('gnb_active')) {
                $('body').addClass('gnb_active');
            }
        } else {
            if($('body').hasClass('gnb_active')) {
                $('body').removeClass('gnb_active');
            }
        }
    })

    function getMySnbActive() {
        let pathname = window.location.pathname;

        if(pathname.includes('interestExper')) {
            $('.my_snb ul a:nth-child(3) li').addClass('active');
        } else if(pathname.includes('point')) {
            $('.my_snb ul a:nth-child(4) li').addClass('active');
        } else if(pathname.includes('inqury')) {
            $('.my_snb ul a:nth-child(5) li').addClass('active');
        } else if(pathname.includes('userInfo')){
            $('.my_snb ul a:nth-child(1) li').addClass('active');
        } else {
            $('.my_snb ul a:nth-child(2) li').addClass('active');
        }
    }

    function getEpxerienceCounter() {
        $.ajax({
            url : '${pageContext.request.contextPath}/user/mypage/getExperCount',
            type : 'get',
            success : function(data) {
                $('.applyOnCount').text(data.applyOnCount);
                $('.experApplyOnCount').text(data.experApplyOnCount);
                $('.nonCommitCount').text(data.nonCommitCount);
                $('.commitCount').text(data.commitCount);
                $('.my_left .profile .name').text(data.user.name);
                $('.my_left .profile .email').text(data.user.id);

                if((data.channelList).length) {
                    (data.channelList).forEach(function(channel) {
                        if(channel != null) {
                            if(channel.channelCode == 1) {
                                $('.channel .nav a').addClass('active');
                            } else if(channel.channelCode == 2) {
                                $('.channel .ins a').addClass('active');
                            } else if(channel.channelCode == 3) {
                                $('.channel .fac a').addClass('active');
                            } else if(channel.channelCode == 4) {
                                $('.channel .you a').addClass('active');
                            }
                        }
                    });
                }
            }
        });
    }
</script>