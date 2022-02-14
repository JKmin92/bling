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
                <td><input type="email" name="emailAdd" /></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" placeholder="실명기재" name="userName"/></td>
            </tr>
            <tr>
                <td>성별</td>
                <td>
                    <label><input type="radio" name="gender"/>남자</label>
                    <label><input type="radio" name="gender"/>여성</label>
                </td>
            </tr>
            <tr>
                <td>연락처</td>
                <td>
                    <input type="tel">
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                    <input type="text" name="addNum"> <input type="button" value="우편번호 찾기"> <br>
                    <input type="text" name="add"><br>
                    <input type="text" name="addDe"><br>
                    <p style="font-size:12px;">*배송 캠페인 신청 시 제품을 수령하실 주소 기재</p>
                </td>
            </tr>
        </tbody>
    </table>

    <hr>

    <div class="userInfoGree">
        <label><input type="checkbox" />이메일을 통한 캠페인 모집 및 추천, 이벤트 정보 등의 수신에 동의합니다.</label><br>
        <label><input type="checkbox" />SMS를 통한 캠페인 모집 및 추천, 이벤트 정보 등의 수신에 동의합니다.</label><br>
        <label><input type="checkbox" />개인정보 수집 및 이용에 동의합니다.</label>
        <button>약관보기</button>
    </div>

    <div class="infoSubmit">
        <button type="submit">기본정보 저장</button>
    </div>
    

</section>