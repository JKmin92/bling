<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="kr.com.amean.entity.bank.Bank"%>
<%@page import="kr.com.amean.entity.user.Channel"%>
    <div class="gnb_active_back"></div>
    
    <div class="gnb">
        <div class="sect">
        <div class="logo">
            <a href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" style="width:50%; max-width: 160px;;" /></a>
        </div>
        
		<ul>
			<li class="gnb_li"><span class="cate">제품</span>
                <ul class="snb">
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=뷰티">뷰티</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=식품">식품</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=생활용품">생활용품</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=육아">육아</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=차량·캠핑">차량·캠핑</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=반려동물">반려동물</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=IT·가전제품">IT·가전제품</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=1&sCategory=기타">기타</a></li>
                </ul>
            </li>
			<li class="gnb_li"><span class="cate">방문</span>
                <ul class="snb">
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=맛집·카페">맛집·카페</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=뷰티·미용">뷰티·미용</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=여행·숙박·레저">여행·숙박·레저</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=문화">문화</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=기타">기타</a></li>
                </ul>
            </li>
			<li class="gnb_li"><a href="${pageContext.request.contextPath }/experience?mCategory=3"><span>기자단</span></a></li>
			<li class="gnb_li"><span class="cate">서비스</span>
                <ul class="snb">
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=교육·강의">교육·강의</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=APP">APP</a></li>
                    <li><a href="${pageContext.request.contextPath }/experience?mCategory=2&sCategory=기타">기타</a></li>
                </ul>
            </li>
			<li class="gnb_li"><a href="${pageContext.request.contextPath }/experience?mCategory=5"><span>얼리버드</span></a></li>
			<li class="gnb_li"><a href="${pageContext.request.contextPath }/experience?mCategory=6"><span>프리미엄</span></a></li>
		</ul>

        <div class="contect_area">
            <span>체험 문의</span>
            <h4>070-5147-1560</h4>
            <p>평일 09:30 ~ 18:30</p>
            <p>ameanbiz@naver.com</p>
            <ul>
                <li>카톡문의</li>
                <li>문의하기</li>
            </ul>
        </div>
    </div>

    <%
        if(user != null) {
    %>
    <div class="user_gnb">
        <div class="sect">
            <div class="profile">
                <div class="userName"><a href="${pageContext.request.contextPath }/user/mypage"><span><%=user.getName()%></span></a></div>
                <div class="email"><a href="${pageContext.request.contextPath }/user/mypage"><span><%=user.getId()%></span></a></div>
                <div class="userImg"><a href="${pageContext.request.contextPath }/user/mypage"><img src="${pageContext.request.contextPath }/resources/img/user/basic_user.png"></a></div>
            </div>

            <ul class="userInfo_ul">
                <li>
                    <a href="${pageContext.request.contextPath }/user/mypage/point/list">
                        <span class="title">나의 포인트</span>
                        <span class="state bankPoint"></span>
                    </a>
                </li>
                <li>
                    <div class="mychannel">
                        <div class="channel">
                            <a href="${pageContext.request.contextPath }/user/mypage/userInfo#naver">
                                <div class="img" style="background-image:url('${pageContext.request.contextPath }/resources/img/icon/channel/my_blog.png');"></div>
                            </a>
                        </div>
                        <div class="channel">
                            <a href="${pageContext.request.contextPath }/user/mypage/userInfo#instagram">
                                <div class="img" style="background-image:url('${pageContext.request.contextPath }/resources/img/icon/channel/my_instagram.png');"></div>
                            </a>
                        </div>
                        <div class="channel">
                            <a href="${pageContext.request.contextPath }/user/mypage/userInfo#facebook">
                                <div class="img" style="background-image:url('${pageContext.request.contextPath }/resources/img/icon/channel/my_facebook.png');"></div>
                            </a>
                        </div>
                        <div class="channel">
                            <a href="${pageContext.request.contextPath }/user/mypage/userInfo#youtube">
                                <div class="img" style="background-image:url('${pageContext.request.contextPath }/resources/img/icon/channel/my_youtube.png');"></div>
                            </a>
                        </div>
                    </div>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/user/mypage/interestExper">
                        <span class="title">관심 캠페인</span>
                        <span class="state interestCampaignCnt"></span>
                    </a>
                </li>
                <li>
                    <div class="applyInfo">
                        <div class="title">나의 캠페인</div>
                        <div class="applyState">
                            <a href="${pageContext.request.contextPath }/user/mypage/applyExperience">
                                <div class="state">
                                    <div class="cnt"></div>
                                    <div class="t2">신청</div>
                                </div>
                            </a>
                            <a href="${pageContext.request.contextPath }/user/mypage/selectExper">
                                <div class="state">
                                    <div class="cnt"></div>
                                    <div class="t2">선정</div>
                                </div>
                            </a>
                            <a href="${pageContext.request.contextPath }/user/mypage/insertExper">
                                <div class="state">
                                    <div class="cnt"></div>
                                    <div class="t2">미등록</div>
                                </div>
                            </a>
                            <a href="${pageContext.request.contextPath }/user/mypage/registerReview">
                                <div class="state">
                                    <div class="cnt"></div>
                                    <div class="t2">등록</div>
                                </div>
                            </a>
                        </div>
                    </div>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/user/mypage/userInfo">
                        <span class="title">내정보 수정</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/user/loginout">
                        <span class="title logout">로그아웃</span>
                    </a>
                </li>
                <li>
                    <a href="#" id="bottomCategory">
                        <span class="title">캠페인 신청</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <script>

        $(document).ready(function() {
            $.ajax({
                url : '${pageContext.request.contextPath }/user/leftmenu/state',
                type : 'get',
                success : function(items) {
                    $('.user_gnb .userInfo_ul .applyInfo .applyState a:nth-child(1) .state .cnt').append(items.stateList[0]);
                    $('.user_gnb .userInfo_ul .applyInfo .applyState a:nth-child(2) .state .cnt').append(items.stateList[1]);
                    $('.user_gnb .userInfo_ul .applyInfo .applyState a:nth-child(3) .state .cnt').append(items.stateList[2]);
                    $('.user_gnb .userInfo_ul .applyInfo .applyState a:nth-child(4) .state .cnt').append(items.stateList[3]);
                    $('.user_gnb .userInfo_ul li .bankPoint').append(items.bank.presentPoint + 'P');
                    
                    if(items.channelList[0] != null) $('.user_gnb .userInfo_ul li .mychannel .channel:nth-child(1) .img').addClass('active');
                    if(items.channelList[1] != null) $('.user_gnb .userInfo_ul li .mychannel .channel:nth-child(2) .img').addClass('active');
                    if(items.channelList[2] != null) $('.user_gnb .userInfo_ul li .mychannel .channel:nth-child(3) .img').addClass('active');
                    if(items.channelList[3] != null) $('.user_gnb .userInfo_ul li .mychannel .channel:nth-child(4) .img').addClass('active');

                    $('.user_gnb .userInfo_ul .interestCampaignCnt').append(items.interestCampaignCnt);
                }
            });
        });

    </script>

    <%
        }
    %>

	</div>

    <%@ include file="/WEB-INF/common/bottomCategory.jsp" %>

    <script>
        $('.gnb_active_back').click(function() {
            if($('body').hasClass('gnb_active')) {
                $('body').removeClass('gnb_active');
            }

            if($('body').hasClass('bottom_category')) {
                $('body').removeClass('bottom_category');
            }
        });

        $('#bottomCategory').click(function() {
			if(!$('body').hasClass('bottom_category')) {
				$('body').addClass('bottom_category');
			}
		})
    </script>