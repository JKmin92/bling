<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="kr.com.amean.entity.user.Address"%>
<style>
    .addAdress {width:450px; max-width:100%; margin: auto; padding:30px 0; }
    .addAdress .list {width:100%; font-size: 14px;}
    .addAdress .list .tit {display: inline-block; width: 20%; margin:15px 0;}
    .addAdress .list .cont {display: inline-block; width: 75%; margin:15px 0;}
    .addAdress .list input[type=text] {width: 100%; border: none; border-bottom: 1px solid #ccc; padding: 15px;}
    .addAdress .list input[name=zipcode] {width: 30%; min-width: 100px;}
    .addAdress .list .cont label {cursor: pointer;}
    .addAdress .list .cont input[type=checkbox] {width: 14px; height: 14px; margin:0 5px 0 0; cursor: pointer;}
    .addAdress .list .cont input[type=checkbox]:checked {background: #666;}
    .addAdress .list #searchAddress {
        width: 100%; 
        padding: 10px; 
        border:1px solid #ccc; 
        border-radius: 10px; 
        background: white;
        font-size: 14px;
        text-align: center;
        margin-bottom: 20px;
    }
    .addAdress .btn {width: 100%; margin:30px auto;}
    .addAdress .btn button {
        width: 35%; 
        display: inline-block; 
        text-align: center; 
        padding: 10px; 
        margin: 0 5%; 
        background: rgb(104, 104, 104);
        color: white;
        font-size: 14px;
        border: none;
    }
    footer, .m_gbn {display:none;}
</style>
<div class="addAdress">
    <div class="list">
        <div class="tit">기본 배송지</div>
        <div class="cont"><label><input type="checkbox">기본 배송지로 설정합니다.</label></div>
    </div>
    <div class="list">
        <div class="tit">배송지 이름</div>
        <div class="cont"><input type="text" name="name" placeholder="배송지 이름을 입력해주세요."></div>
    </div>
    <div class="list">
        <button id="searchAddress">배송지 검색</button>
        <input type="text" name="zipcode" class="addInfo">
        <input type="text" name="address" class="addInfo">
        <input type="text" name="detail" placeholder="상세주소를 입력해주세요.">
    </div>
    <div class="btn">
        <button name="cancel">닫기</button>
        <button name="submit">등록</button>
    </div>
</div>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%
    Address address = (Address)request.getAttribute("Address");
    if(address != null) {
%>
    <script>
        $(document).ready(function() {
            let state = <%=address.isBasic()%>;
            let add = '<%=address.getAddress()%>';
            let name =  '<%=address.getName()%>';
            let detail = '<%=address.getDetail()%>';
            let zipCode = '<%=address.getZipCode()%>';

            $('input[type=checkbox]').prop('checked', state);
            $('input[name=name]').val(name);
            $('input[name=zipcode]').val(zipCode);
            $('input[name=address]').val(add);
            $('input[name=detail]').val(detail);

            if(state) {
                $('input[type=checkbox]').attr('disabled', true);
            }

            $('.addAdress .btn button[name=submit]').remove();
            $('.addAdress .btn').append('<button name="modify">수정</button>');
            

        });
    </script>
<%
    }
%>
<script>
    $('.addInfo').click(function() {
        $('#searchAddress').click();
    });

    $('button[name=cancel]').click(function() {
        window.close();
    });

    $('#searchAddress').click(function() {
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

    $('button[name=submit]').click(function() {
        sendData('insert', 1);
    });

    $('button[name=modify]').click(function() {
        sendData('modify', 2);
    });

    function sendData(url, cont) {
        let basic = $('input[type=checkbox]').val();
        let name = $('input[name=name]').val();
        let zipCode = $('input[name=zipcode]').val();
        let address = $('input[name=address]').val();
        let detail = $('input[name=detail]').val();

        let data = {
            'name' : name,
            'address' : address,
            'detail' : detail,
            'zipCode' : zipCode,
            'basic' : basic,
        }

        $.ajax({
            url : '${pageContext.request.contextPath}/user/address/' + url,
            data : data,
            type : 'post',
            success : function(result) {
                if(result) {
                    if(cont == 1) {
                        alert("주소가 등록되었습니다.")
                    }
                    if(cont == 2) {
                        alert("주소가 수정되었습니다.")
                    }

                    opener.parent.checkAdress();
                    window.close();
                } else {
                    if(cont == 1) {
                        alert("주소 등록에 실패했습니다.")
                    }
                    if(cont == 2) {
                        alert("주소 수정에 실패 했습니다.")
                    }
                    opener.parent.checkAdress();
                    window.close();
                }
            }, error : function(e) {
                console.log(e.error);
                if(cont == 1) {
                        alert("주소 등록에 실패했습니다.")
                }
                if(cont == 2) {
                    alert("주소 수정에 실패 했습니다.")
                }
                opener.parent.checkAdress();
                window.close();
            }
        });
    }

</script>