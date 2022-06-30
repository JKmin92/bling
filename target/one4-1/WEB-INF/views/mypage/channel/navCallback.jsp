<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
    var naver_id_login = new naver_id_login("sFd89GzqyDOPCe20rvXH", "http://one4.co.kr/one4-1/user/nav_callback");
    
    naver_id_login.get_naver_userprofile('callbackAjax()');

    function callbackAjax() {

        let email = naver_id_login.getProfileData('email');
        console.log(email);

        $.ajax({
            url : '${pageContext.request.contextPath}/user/naver/add',
            type : 'post',
            data : {'email' : email},
            success : function(data) {
                
                if(data.email == 'false') {
                    $(opener.document).find('input[name=naverEmail]').val("이메일 주소를 가져오지 못함");
                    window.close();
                }

                if(data.navAdd == 'false') {
                    $(opener.document).find('input[name=naverEmail]').val("저장 실패");
                    window.close();
                }

                $(opener.document).find('input[name=naverEmail]').val(data.result);
                window.close();
            }, error : function(e) {
                console.log("체험등록오류");
                console.log(e);
                alert('주소 등록 실패, 지속될 경우 관리자에게 말씀해주세요');
            }
        })

       
    }
    
  </script>