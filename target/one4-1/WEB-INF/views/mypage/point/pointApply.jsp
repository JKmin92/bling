<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/WEB-INF/views/mypage/point/pointCommon.jsp"%>


    <div class="pointApply">
        <table>
            <colgroup>
                <col width="15%">
                <col width="85%">
            </colgroup>
            <tbody>
                <tr>
                    <td>예금주</td>
                    <td><input type="text" name="holder"></td>
                </tr>
                <tr>
                    <td>은행명</td>
                    <td>
                        <select class="bankName">
                            <option value="0">은행을 선택해주세요.</option>
                            <option value="NH농협은행">NH농협은행</option>
                            <option value="KB국민은행">KB국민은행</option>
                            <option value="신한은행">신한은행</option>
                            <option value="우리은행">우리은행</option>
                            <option value="카카오뱅크">카카오뱅크</option>
                            <option value="IBK기업은행">IBK기업은행</option>
                            <option value="하나은행">하나은행</option>
                            <option value="케이뱅크">케이뱅크</option>
                            <option value="새마을금고">새마을금고</option>
                            <option value="SC제일은행">SC제일은행</option>
                            <option value="씨티은행">씨티은행</option>
                            <option value="BNK부산은행">BNK부산은행</option>
                            <option value="대구은행">대구은행</option>
                            <option value="BNK경남은행">BNK경남은행</option>
                            <option value="우체국">우체국</option>
                            <option value="광주은행">광주은행</option>
                            <option value="전북은행">전북은행</option>
                            <option value="수협은행">수협은행</option>
                            <option value="수협중앙회">수협중앙회</option>
                            <option value="KDB산업은행">KDB산업은행</option>
                            <option value="제주은행">제주은행</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>계좌번호</td>
                    <td><input type="text" name="bankNumber"></td>
                </tr>
                <tr>
                    <td>신청금액</td>
                    <td><input type="number" name="applyPoint"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <p class="notice">위 계좌 정보를 잘못 기재로 인해 잘못 출금 시 당사는 책임지지 않으니 반드시 재차 확인 부탁드립니다.</p>
                        <button type="submit">출금신청</button>
                    </td>
                </tr>
            </tbody>
        </table>

        <div class="remainPoint">
            <p class="txt">출금신청 가능 포인트</p>
            <p class="point"></p>
        </div>
    </div>

</section>
</div>
<script>

    $(document).ready(function() {
        $('.pointRemote li:nth-child(3)').addClass('active');
        setPoint();
    });

    $('button[type=submit]').click(function() {
        applyPointGo();
    });

    function setPoint() {
        $.ajax({
            url : '${pageContext.request.contextPath}/user/mypage/getPresentPoint',
            type : 'get',
            success : function(r) {
                
                if(r == null) {
                    location.href = '${pageContext.request.contextPath}/';
                }

                let point = (r.presentPoint).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                let holder = r.holder;
                let bankNumber = r.bankNumber;
                let bankName = r.bankName;

                $('.remainPoint .point').append(point + 'P');
                $('input[name=holder]').val(holder);
                $('input[name=bankNumber]').val(bankNumber);
                $('select.bankName').val(''+bankName).prop('selected', true);
            }, error : function(e) {
                console.log(e);
            }
        });
    }

    function applyPointGo() {
        let holder = $('input[name=holder]').val();
        let bankName = $('.bankName').val();
        let bankNumber = $('input[name=bankNumber]').val();
        let applyPoint = $('input[name=applyPoint]').val();

        if(holder == null || holder == '') {
            alert('예금주를 입력해주세요.');
            $('input[name=holder]').focus();
            return false;
        }

        if(bankName == null || bankName == '' || bankName == 0) {
            alert('은행을 선택해주세요.');
            $('input[name=bankName]').focus();
            return false;
        }

        if(bankNumber == null || bankNumber == '') {
            alert('계좌번호를 입력해주세요.');
            $('input[name=bankNumber]').focus();
            return false;
        }

        if(applyPoint == null || applyPoint == '' || applyPoint <= 0) {
            alert('신청금액을 입력해주세요.');
            $('input[name=applyPoint]').focus();
            return false;
        }

        let sendDate = {
            'holder' : holder,
            'bankName' : bankName,
            'bankNumber' : bankNumber,
            'applyPoint' : applyPoint
        }

        $.ajax({
            url : '${pageContext.request.contextPath}/user/mypage/applyPointGo',
            type : 'post',
            data : sendDate,
            success : function(item) {
                if(item.user == false) {
                    alert('로그인 해주세요.');
                    location.href = '${pageContext.request.contextPath}/';
                } 
                
                if(item.day == true) {
                    alert('이미 출금신청했으며 남은 포인트는 익월 1일 ~ 15일에 신청 부탁드립니다.');
                    return false;
                } else if(item.day == false) {
                    alert('이미 출금신청했으며 남은 포인트는 당월 16일 이후 신청 부탁드립니다.');
                    return false
                }

                if(item.pointShort == true) {
                    alert('10,000 포인트 이상 시 출금 신청이 가능합니다.');
                    return false;
                }
                
                if(item.result == false) {
                    alert('신청 실패, 지속될 경우 관리자에게 연락 부탁드립니다.');
                    return false;
                } else {
                    alert('포인트 신청 완료 했습니다.\n포인트는 매월 1~ 15일 신청 시 당월 20일 지급,\n매울 16일 ~ 말일 신청 시 익월 5일 지급됩니다.\n신청기간 당 1회 신청만 가능하며 관련 법상 사업소득에 따른 세금 3.3%(원청징수)를 공제하고 입금됩니다.');
                }

                location.reload();
            }, error : function(e) {
                console.log(e);
                alert('신청 실패, 지속될 경우 관리자에게 연락 부탁드립니다.');
            }
        });
    }
</script>