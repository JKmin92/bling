<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<section class="myChannel">

    <input type="text" name="naverEmail"/>

    <div class="channel"><span id="naver_id_login">블로그</span></div>
    <div class="channel">인스타그램</div>

</section>

<script>

    var naver_id_login = new naver_id_login("sFd89GzqyDOPCe20rvXH", "http://localhost:8080/one4-1/user/nav_callback");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8080");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();

</script>