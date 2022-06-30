<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
    <style>
        .joinCon {margin:100px auto 0 auto !important; min-width:auto; width:400px; min-width: auto;}
        @media (max-width : 787px) {
            .joinCon {width:100%;}
        }
    </style>
<div class="container">

    <section class="join_1 joinCon">
		<div class="logo">
			<img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="100%" />
		</div>
			<table class="insert_data">
				<colgroup>
					<col width="100%" />
				</colgroup>
				<tbody>
                    <%
                        int code = (Integer)request.getAttribute("code");

                        if(code == 1) {
                    %>
					<tr>
						<td><input type="password" placeholder="기존 비밀번호" name="original"/></td>
					</tr>
                    <% 
                        }
                    %>
					<tr>
						<td><input type="password" placeholder="변경될 비밀번호" name="password" /></td>
					</tr>
					<tr>
						<td><input type="password" placeholder="비밀번호 확인" name="ps2" /></td>
					</tr>
				</tbody>
			</table>
			
			<div class="summit">
				<button type="submit">비밀번호 변경</button>
			</div>
    </section>
</div>

<script>

    $('.summit button').click(function() {
        <%
            if(code == 1) { 
        %>
        let original = $('input[name=original]').val();
        <% 
            }
        %>
        let password = $('input[name=password]').val();
        let ps2 = $('input[name=ps2]').val();

        if(password.length <= 7) {
            alert('비밀번호는 8자 이상으로 설정해주세요');
            focus($('input[name=password]'));
            return false;
        }

        if(password != ps2) {
            alert('변경될 비밀번호가 다릅니다.');
            focus($('input[name=ps2]'));
            return false;
        }

        let sendData = {
            <%
                if(code == 1) {
            %>
            'orginal' : origin,
            <%
                }
            %>
            'id' : '<%=(String)request.getAttribute("id")%>',
            'password': password
        }

        $.ajax({
            <%
                if(code == 1) {

            %>
            url : '${pageContext.request.contextPath}/user/change/password/mypage',
            <%
                } else {
            %>
            url : '${pageContext.request.contextPath}/user/change/password/find',
            <%
                }
            %>
            type : 'post',
            data : sendData,
            success : function(e) {
                if(e) {
                    alert('비밀번호가 변경 되었습니다');
                    window.location = '${pageContext.request.contextPath}/user/login'
                } else {
                    alert('비밀번호 변경에 실패 했습니다.');
                }
            }, error : function(e) {
                console.log(e);
                alert('비밀번호 변경에 오류가 있습니다');
            }
        });
    });

</script>