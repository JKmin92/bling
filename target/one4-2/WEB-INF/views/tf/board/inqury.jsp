<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
    <section class="inqury">
        <div class="boardTit">
            <div class="t01">문의하기</div>
            <div class="t02">원포에게 문의하기</div>
        </div>
        <div class="form_table">
            <div class="table_tr">
                <div class="table_td">제목</div>
                <div class="table_td"><input type="text" name="subject" placeholder="제목을 입력해주세요." /></div>
            </div>
            <div class="table_tr">
                <div class="table_td">성함</div>
                <div class="table_td"><input type="text" name="name" placeholder="성함을 입력해주세요." /></div>
            </div>
            <div class="table_tr">
                <div class="table_td">연락처</div>
                <div class="table_td"><input type="tel" name="phone" placeholder="연락처을 입력해주세요." /></div>
            </div>
            <div class="table_tr">
                <div class="table_td">이메일</div>
                <div class="table_td"><input type="email" name="email" placeholder="이메일을 입력해주세요." /></div>
            </div>
            <div class="table_tr">
                <div class="table_td">문의내용</div>
                <div class="table_td"><textarea placeholder="내용을 입력해주세요."></textarea></div>
            </div>
            <div class="table_tr">
                <div class="table_td_h2">
                    <label><input type="checkbox" name="gree" />동의하십니까?</label>
                </div>
            </div>
            <div class="butt"><button type="submit">보내기</button></div>
        </div>
    </section>
</div>