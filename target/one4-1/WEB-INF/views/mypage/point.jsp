<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>

<section class="myPoint">

    <div class="myBank">

        <h3>[환급 계좌]</h3>

        <table>
            <tr>
                <td>은행명</td>
                <td>
                    <select>
                        <option>환급계좌 은행선택</option>
                        <option>농협</option>
                        <option>기업은행</option>
                        <option>국민은행</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>예금주</td>
                <td><input type="text" placeholder="계좌의 예금주를 정확히 입력해주세요."></td>
            </tr>
            <tr>
                <td>계좌번호</td>
                <td><input type="text" placeholder="'-'은 제외하여 입력해주세요."></td>
            </tr>
        </table>
        <p class="notice">* 블링포인트는 30,000 포인트부터 환급이 가능하며 환급 계좌는 정보 오류로 인한 누락 및 착오 환급에 대하여는 
        책임을 지지 않으니 계좌번보를 꼼꼼히 확인해주세요.</p>

        <button>저장하기</button>
    </div>

    <div class="myPointHistory">
        <h3>[포인트 내역]</h3>

        <div class="refundBtn">나의 포인트<span>20,000</span>P <button>환급신청</button></div>
        
        <table class="historyList">
            <colgroup>
                <col width="30%">
                <col width="40%">
                <col width="20%">
                <col width="10%">
            </colgroup>
            <thead>
                <td>충전일</td>
                <td>내역</td>
                <td>포인트</td>
                <td>입/출금</td>
            </thead>
            <tbody>
                <tr>
                    <td>22-01-01</td>
                    <td>세탁소 블로그 기자단</td>
                    <td>10,000P</td>
                    <td>입금</td>
                </tr>
                <tr>
                    <td>22-01-01</td>
                    <td>세탁소 블로그 기자단</td>
                    <td>10,000P</td>
                    <td>입금</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="info">
        <h3>[포인트 환급 신청 안내]</h3>
        - 블링포인트는 30,000P 이상일 경우에만 환급 신청 가능합니다.<br>
        - 포인트는 10,000P 단위로 환급 가능합니다.<br>
        - 환급 신청은 한 달 간격으로 접수를 받으며, 익월 10일에 일괄 지급됩니다.<br>
        - 세법 상 신고를 위해 3.3% 제외한 금액이 입금되는점 유념해주세요.

    </div>

</section>