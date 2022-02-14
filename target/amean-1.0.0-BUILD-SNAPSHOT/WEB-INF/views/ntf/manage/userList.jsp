<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/ntf/manage/gnb.jsp"%>

<div class="man_container">
    <section class="userList">
        <table>
            <colgroup>
                <col width="10%">
                <col width="30%">
                <col width="30%">
                <col width="30%">
            </colgroup>
            <thead>
                <tr>
                    <td>No</td>
                    <td>이름</td>
                    <td>연락처</td>
                    <td>채널</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>민정기</td>
                    <td>01065513317</td>
                    <td>
                        <ul>
                            <li><img src="${pageContext.request.contextPath}/resources/img/icon/channel/ico_nav_active.png" width="22px"></li>
                            <li><img src="${pageContext.request.contextPath}/resources/img/icon/channel/ico_insta_inact.png" width="22px"></li>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
    </section>
</div>