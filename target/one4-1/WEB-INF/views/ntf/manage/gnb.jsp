<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="manage_gnb">
    <div class="logo">
        <a href="${pageContext.request.contextPath }/">
            <img src="${pageContext.request.contextPath }/resources/img/logo/logo.png" width="80%"/>
        </a>
    </div>

    <div class="list">
        <ul>
            <a href="${pageContext.request.contextPath }/mana/"><li>캠페인</li></a>
            <a href="${pageContext.request.contextPath }/mana/userList"><li>회원정보</li></a>
            <li>업체</li>
            <a href="${pageContext.request.contextPath }/mana/board"><li>게시판 관리</li></a>
        </ul>
    </div>

</div>

<header>

</header>