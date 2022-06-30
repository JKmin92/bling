<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://fonts.googleapis.com/css?family=Kalam" rel="stylesheet" type="text/css">
<style>
    .premium .title h4 {font-family: 'Kalam', 'NanumBarunGothic', 'Noto Sans KR', sans-serif;}
</style>

<section class="premium">
    <div class="sec1">
        <div class="title">
            <img src="${pageContext.request.contextPath}/resources/img/logo/logo_white.png" style="margin: 0 0 10px 0; width: 150px;" />
            <h4>PREMIUM</h4>
            <h3>원포 플렛폼 프리미엄 리뷰어를 위한 멤버쉽 서비스</h3>
            <p>Membership Serive for Premium Reivewer</p>
        </div>
        <div class="btn">
            <a href="#"><div class="content">프리미엄 신청하기</div></a>
        </div>
    </div>
    <div class="sec2">
        <div class="discription">
            <h5>ㆍONE4 PREMIUM</h5>
            <p class="txt">ONE4 PREMIUM은 각 분야별 전문성과 영향력이 검증된 리뷰어 회원들을 위한 프리미엄 멤버십 서비스입니다.</p>
            <p class="txt">멤버십 회원이 되시면 원포에서 제공하는 프리미엄 전용 서비스로 더욱 많은 혜택을 누리실 수 있습니다.</p>
        </div>
        <div class="benefit">
            <h5>프리미엄 멤버쉽 혜택</h5>
            <ul>
                <li>
                    <div class="icon" style="background-image: url('${pageContext.request.contextPath}/resources/img/icon/premium_benefit_icon_1.png');"></div>
                    <div class="content">
                        <div class="t1">프리미엄 전용 캠페인</div>
                        <div class="t2">프리미엄 전용 캠페인 참여 기회</div>
                    </div>
                </li>
                <li>
                    <div class="icon" style="background-image: url('${pageContext.request.contextPath}/resources/img/icon/premium_benefit_icon_2.png'); background-size: 65px;"></div>
                    <div class="content">
                        <div class="t1">제품 제공 및 포인트</div>
                        <div class="t2">캠페인 제공 내용 및 포인트 지급</div>
                    </div>
                </li>
                <li>
                    <div class="icon" style="background-image: url('${pageContext.request.contextPath}/resources/img/icon/premium_benefit_icon_3.png');"></div>
                    <div class="content">
                        <div class="t1">프리미엄 전용 위젯</div>
                        <div class="t2">프리미엄 회원을 위한 위젯 제공</div>
                    </div>
                </li>
                <li>
                    <div class="icon" style="background-image: url('${pageContext.request.contextPath}/resources/img/icon/premium_benefit_icon_4.png');"></div>
                    <div class="content">
                        <div class="t1">스페셜 베네핏</div>
                        <div class="t2">일반 캠페인 기본 포인트 2배 제공<br>비공개 캠페인 참여 기회 추가 제공</div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="condition">
            <h5>ㆍ프리미엄 멤버십 신청조건</h5>
            <ul>
                <li>
                    <div class="icon"></div>
                    <div class="content">
                        <div class="t1">네이버 블로그</div>
                        <div class="t2">- 최근 7일 일평균 방문자수 3,000명 이상의 블로그 리뷰어</div>
                        <div class="t2">- 최소 1가지 이상의 전문 카테고리를 운영하는 블로그 리뷰어</div>
                    </div>
                </li>
                <li>
                    <div class="icon"></div>
                    <div class="content">
                        <div class="t1">인스타그램</div>
                        <div class="t2">- 팔로워수 10K 이상의 인스타그래머</div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="sec3">
        <div class="content">
            <h5>프로세스 및 신청하기</h5>
            <p class="txt">신청서를 제출해주시면 영업일 기준 최대 10일 이내 내부 심사를 거쳐 발표됩니다.</p>
            <p class="txt">운영중인 전문 카테고리를 최소 1가지 등록해주세요.<br>
                <span class="notice">(등록하신 카테고리 중 전문성이 인정되지 않을 경우 보류 또는 부분 보류될 수 있습니다.)</span>
            </p>

            <ul>
                <li>
                    <p>1. 신청</p>
                </li>
                <li><p>2. 심사</p></li>
                <li><p>3. 선정</p></li>
            </ul>

            <a href="#">
                <div class="btn">
                    <span>원포 프리미엄 리뷰어 신청하기</span>
                </div>
            </a>
        </div>

        <ul class="notice">
            <li class="title"><span><i></i> ONE4 PREMiUM 신청 전, 꼭 확인해주세요.</span></li>
            <li><span>1. ONE4 PREMIUM은 블로그 / 인스타그램 / 네이버 인플루언서 3가지로 프리미엄 신청이 가능하며, 참여 가능한 캠페인은 각각 상이합니다.</span></li>
            <li><span>2. 신청 조건을 갖춘 회원이라면 3가지 종류의 프리미엄에 모두 신청이 가능합니다.</span></li>
            <li><span>3. 프리미엄은 최초 선정 후, 선정 일로부터 6개월 동안 자격이 유지됩니다.</span></li>
            <li><span>4. 프리미엄 신청 후, 선정이 되지 않은 경우엔 결과 발표일로부터 30일 이후부터 재신청이 가능합니다.</span></li>
            <li><span>5. 프리미엄 선정 후, 원포에 연결되어 있는 미디어를 변경하거나 해지하면 프리미엄 자격도 함께 해제됩니다.</span></li>
            <li><span>6. 불법 프로그램 등으로 조작된 방문자수는 인정되지 않습니다.</span></li>
            <li><span>7. 뉴스 등 이슈성 컨텐츠로 방문자수를 올리시는 분들은 선정에서 제외될 수 있습니다.</span></li>
            <li><span>8. 프리미엄 선정 후, 불법 어뷰징 행위 적발 시 멤버십 자격이 박탈될 수 있습니다.</span></li>
        </ul>
    </div>
</section>

</div>