<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
    <style>
        .joinCon {margin:100px auto 0 auto !important; min-width:auto; width:400px; min-width: auto;}
        @media (max-width : 787px) {
            .joinCon {width:100%;}
        }
    </style>

<div class="container joinCon">

    <section class="login">

        <div class="logo">
			<img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="100%" />
		</div>

        <div class="user_info">
            <div class="user_id">
                <input type="email" placeholder="email" name="email" />
            </div>
            <div class="user_pw">
                <input type="text" placeholder="연락처" name="phone" />
            </div>
            <button class="login_btn">비밀번호 찾기</button>
        </div>

    </section>

</div>

<script>
    $('.login_btn').click(function() {
        let id = $('input[name=email]').val();
        let phone = $('input[name=phone]').val();

        if(id == null || id.length <= 0 || id == '') {
            alert('email을 입력해주세요.');
            $('input[name=email]').focus();
            return false;
        }
        
        if(phone == null || phone.length <= 0 || phone == '') {
            alert('연락처를 입력해주세요.');
            $('input[name=phone]').focus();
            return false;
        }

        $.ajax({
           url : '${pageContext.request.contextPath}/user/password/find',
           type : 'post',
           data : {'id':id, 'phone':phone},
           success : function(result) {
               if(result != '' && result != null && result.length > 0) {
                   window.location = '${pageContext.request.contextPath}/user/change/password/view?id='+result+'&code=2&phone='+phone;
               } else {
                   alert('계정을 찾을 수 없습니다');
               }
           }, error : function(e) {
               console.log(e);
               alert('계정 확인에 실패 했습니다');
           }
        });
    })
</script>