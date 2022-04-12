<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="userInfo">

    <table class="userTable">
        <colgroup>
            <col width="20%">
            <col width="80%">
        </colgroup>
        <tbody>
            <tr>
                <td>메일주소</td>
                <td><input type="email" name="emailAdd" disabled /></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" placeholder="실명기재" name="userName"/></td>
            </tr>
            
            <tr>
                <td>연락처</td>
                <td>
                    <input type="tel" name="phone">
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td class="addressList">
                    <button>+ 배송지 추가</button>
                    <ul>
                        
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>

    <hr>

    <div class="userInfoGree">
        <label><input type="checkbox" name="eAgr" />이메일을 통한 캠페인 모집 및 추천, 이벤트 정보 등의 수신에 동의합니다.</label><br>
        <label><input type="checkbox" name="sAgr" />SMS를 통한 캠페인 모집 및 추천, 이벤트 정보 등의 수신에 동의합니다.</label><br>
        <label><input type="checkbox" />개인정보 수집 및 이용에 동의합니다.</label>
        <button>약관보기</button>
    </div>

    <div class="infoSubmit">
        <button type="submit">기본정보 저장</button>
    </div>
    

</section>

<script>

    $('.addressList button').click(function() {
        window.open('${pageContext.request.contextPath}/user/mypage/userInfo/address?aNum=0','배송지 주소',
        'width=500px,height=800px,scrollbars=yes');
    });

    function modifyAddress(aNum) {
        window.open('${pageContext.request.contextPath}/user/mypage/userInfo/address?aNum='+aNum,'배송지 주소',
        'width=500px,height=800px,scrollbars=yes');
    }

    $(document).ready(function() {
        checkAdress();
    });

    function checkAdress() {
        $('.addressList ul li').remove();
        $.ajax({
            url: '${pageContext.request.contextPath}/user/mypage/getUserInfo',
            type : 'post',
            success : function(result) {
                $('input[name=emailAdd]').val(result.user.id);
                $('input[name=userName]').val(result.user.nickName);
                $('input[name=phone]').val(result.user.phone_number);
                $('input[name=eAgr]').prop('checked', result.user.eAgr);
                $('input[name=sAgr]').prop('checked', result.user.sAgr);

                if(result.addressList.length == 0) {
                    $('.addressList ul').append('<li>등록된 주소가 없습니다. 주소를 추가해주세요</li>');
                } else {
                    result.addressList.forEach(function(item) {
                        let name = '<span class="modifyAdd" onclick="modifyAddress(' + item.anum + ')">' + item.name + '</span>';
                        let remove = '<span onclick="removeAddress(' + item.anum + ');" class="removeAdd">X</span>';
                        let address = '<li class="address">'+ name + remove +'<li>';
                        $('.addressList ul').append(address);
                    })
                }
                
            }, error : function(e) {
                console.log(e.error);
            }
        });
    }

    function removeAddress(addressNum) {

        if(confirm('배송지를 삭제하시겠습니까?') == false) {
            return false;
        }

        $.ajax({
            url : '${pageContext.request.contextPath}/user/address/remove',
            type : 'POST',
            date : {'anum' : addressNum},
            success : function(result) {
                if(result) {
                    checkAdress();
                    alert('배송지가 삭제되었습니다.');
                } else {
                    checkAdress();
                    alert('배송지 삭제가 실패 했습니다. a');
                }
            }, error : function(e) {
                console.log(e);

                alert('배송지 삭제가 실패 했습니다. b');
            }
        });
    }

</script>